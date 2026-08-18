import atexit
import threading
import time

from qclient import QClient


DEFAULT_INTERVAL_SECONDS = 300


def _save_once(q, label):

    try:

        q.execute(".quiz.save[]")

        print("[autosave] saved (" + label + ")", flush=True)

    except Exception as exc:

        # A failed save (eg q is mid-restart) shouldn't take the web
        # process down - just log it and let the next tick/exit try again.
        print("[autosave] save failed (" + label + "): " + str(exc), flush=True)


def _loop(interval_seconds):

    q = QClient()

    while True:

        time.sleep(interval_seconds)

        _save_once(q, "periodic")


def start(interval_seconds=DEFAULT_INTERVAL_SECONDS):

    # .quiz.history (see scripts/init.q) previously only ever hit disk via
    # an explicit, never-automated .quiz.save[] call - a q crash between
    # saves silently lost everything recorded since the last one (this
    # actually happened to a test row earlier in development). This
    # doesn't touch any q/kdb code: it just calls the q side's own
    # existing .quiz.save[] function on a timer, the same way any other
    # web/*.py service call does.
    thread = threading.Thread(target=_loop, args=(interval_seconds,), daemon=True)

    thread.start()

    # Best-effort: covers a graceful stop (eg Ctrl+C), not a forceful kill
    # (taskkill /F, SIGKILL) - the periodic save above is what actually
    # bounds data loss from a hard crash.
    atexit.register(lambda: _save_once(QClient(), "on-exit"))

    print("[autosave] started, saving every " + str(interval_seconds) + "s", flush=True)
