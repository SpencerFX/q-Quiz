import os
import subprocess
import sys
import time

import pytest

# A dedicated port, distinct from the port the app normally runs on
# (config.Q_PORT / 5000) - tests boot their own isolated q process so they
# never touch whatever real dev/prod q server (and its live .quiz.history)
# might already be running.
TEST_Q_PORT = int(os.environ.get("TEST_Q_PORT", 5099))

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
WEB_DIR = os.path.join(REPO_ROOT, "web")
Q_EXECUTABLE = os.environ.get("Q_EXECUTABLE", r"C:\q\w64\q.exe")
Q_LOG_PATH = os.path.join(REPO_ROOT, "web", "tests", ".q_test_server.log")

# scripts/init.q's .quiz.save[]/.quiz.loadResults[] used to address the
# results table with a bare relative path (":./results/tab"), resolved
# against whatever cwd the q process was launched from - since this
# fixture launches its own q process with cwd=REPO_ROOT (below), that
# was the *same* file the real dev/prod q server (also normally
# launched from REPO_ROOT) reads/writes. The TEST_Q_PORT separation
# above only isolated the live in-memory state of the two processes;
# the on-disk file was never actually isolated, so a .quiz.save[] call
# against the dev server (eg its periodic autosave, web/autosave.py)
# could leak real history into every fresh test run the moment
# .quiz.init[] -> .quiz.loadResults[] loaded it back in - this silently
# broke the "never touch..." guarantee the comment above promises
# (found via a real completed>total assertion failure caused by exactly
# this). scripts/init.q now honors Q_RESULTS_PATH when set, so this
# fixture points the test q process at its own dedicated file instead
# of trying to shuffle the real one out of the way and back - the
# earlier move-aside-then-restore approach this replaced was itself
# racy against that same autosave thread rewriting ./results/tab while
# it was supposed to be absent.
TEST_RESULTS_PATH = os.path.join(REPO_ROOT, "results", "tab_test")


def _q_is_ready(port, timeout_each=2):
    # A bare TCP connect can succeed while q is still mid-script (the
    # listener opens before .quiz.init[] finishes loading everything), so
    # readiness is only trusted once an actual query round-trips - probing
    # for a symbol that's only defined at the very end of the boot chain.
    sys.path.insert(0, WEB_DIR)
    from qpython import qconnection

    conn = qconnection.QConnection(host="localhost", port=port, timeout=timeout_each)
    try:
        conn.open()
        # .web.currentUser is a nested-namespace global (key `. only lists
        # top-level names, so it can't be checked that way) - querying it
        # directly is enough: it only exists once scripts/init.q's boot
        # sequence has actually reached that assignment, and a q error
        # (undefined variable) during earlier boot is caught below.
        conn(".web.currentUser")
        return True
    except Exception:
        return False
    finally:
        if conn.is_connected():
            conn.close()


@pytest.fixture(scope="session")
def q_process():

    if os.path.exists(Q_LOG_PATH):
        os.remove(Q_LOG_PATH)

    # Start every test run from a clean slate - a leftover file here
    # would only ever be test-generated (see TEST_RESULTS_PATH's
    # comment above), never real history, so it's always safe to drop.
    if os.path.exists(TEST_RESULTS_PATH):
        os.remove(TEST_RESULTS_PATH)

    log_file = open(Q_LOG_PATH, "w")

    env = os.environ.copy()
    env["Q_RESULTS_PATH"] = TEST_RESULTS_PATH

    proc = subprocess.Popen(
        [Q_EXECUTABLE, "scripts/init.q", "-p", str(TEST_Q_PORT)],
        cwd=REPO_ROOT,
        env=env,
        stdout=log_file,
        stderr=subprocess.STDOUT
    )

    deadline = time.time() + 60

    ready = False

    try:

        while time.time() < deadline:

            if proc.poll() is not None:
                log_file.close()
                with open(Q_LOG_PATH) as f:
                    raise RuntimeError("q test server exited early:\n" + f.read())

            if _q_is_ready(TEST_Q_PORT):
                ready = True
                break

            time.sleep(0.5)

        if not ready:
            proc.terminate()
            log_file.close()
            raise RuntimeError("q test server did not become ready within 60s - see " + Q_LOG_PATH)

        yield proc

    finally:

        proc.terminate()

        try:
            proc.wait(timeout=10)
        except subprocess.TimeoutExpired:
            proc.kill()

        log_file.close()

        # Test-generated data, not real history - drop it rather than
        # leaving it to be (wrongly) picked up by the next test run's
        # own fresh q process. See the removal at the top of this
        # fixture too - this one's just for after a normal run.
        if os.path.exists(TEST_RESULTS_PATH):
            os.remove(TEST_RESULTS_PATH)


@pytest.fixture(scope="session")
def client(q_process):

    os.environ["Q_PORT"] = str(TEST_Q_PORT)

    sys.path.insert(0, WEB_DIR)

    import app as flask_app

    flask_app.app.config["TESTING"] = True

    with flask_app.app.test_client() as test_client:
        yield test_client
