## Running tests

```
cd web
pip install -r requirements-test.txt
pytest
```

The test suite boots its own isolated q process (a separate port from
whatever dev/prod q server is already running, so it never touches real
`.quiz.history`/`results/tab` data) and drives the Flask app through it via
`app.test_client()`. It covers the judge/grading pipeline for every
coding section (HackerRank, AquaQ Challenges, leetcode, qIdioms, quantRank,
Fundamentals, Project Euler, Advent of Code), the multiple-choice quiz flow,
the timed assessment flow, and the list/info/leaderboard/results endpoints.

If `q.exe` isn't at `C:\q\w64\q.exe`, set `Q_EXECUTABLE` to its actual path
before running `pytest`.

## Running in production (auto-restart + autosave)

```
python scripts/supervisor.py
```

or, from a bash shell:

```
scripts/start.sh                          # defaults: q=5000, web=8000
scripts/start.sh --q-port 5099 --port 8099 # e.g. to test alongside an already-running instance
```

`start.sh` is a thin wrapper - it resolves the repo root so it works from
any cwd, and `--q-port`/`--port` are just a shorthand for setting
`Q_PORT`/`PORT` below before it execs `scripts/supervisor.py`.

Run from the repo root. This starts both the q server and the
waitress-served web app (`web/wsgi.py`) as child processes, and restarts
whichever one exits unexpectedly - closing the gap where a q crash needed
a manual restart. Logs go to `logs/q-server.log` and `logs/web-server.log`
(gitignored, never committed). Stop with Ctrl+C if it's running attached
to your terminal.

If it's running detached (eg started with `scripts/start.sh &` or via
`nohup`), there's no terminal to Ctrl+C - use `scripts/stop.sh` instead:

```
scripts/stop.sh                  # stop every running q-Quiz instance
scripts/stop.sh --q-port 5099    # stop only the instance on that q port
scripts/stop.sh --force          # skip the graceful attempt, kill immediately
```

It finds the supervisor process, asks it to shut down gracefully first
(so `.quiz.history` gets one last save via `web/autosave.py`'s on-exit
hook before anything dies), and falls back to a forceful kill of the
whole process tree if graceful isn't possible - which in practice is
the common case on Windows for a supervisor with no console attached,
where a graceful stop request fails outright rather than timing out.

Config via env vars, all optional:

| Var | Default | Meaning |
|---|---|---|
| `Q_EXECUTABLE` | `C:\q\w64\q.exe` | path to the q binary |
| `Q_PORT` | `5000` | q's listening port |
| `PORT` | `8000` | web app's port |
| `AUTOSAVE_INTERVAL_SECONDS` | `300` | how often `.quiz.history` is saved to `results/tab` |
| `POLL_INTERVAL_SECONDS` | `5` | how often the supervisor checks for a dead child |
| `GOOGLE_CLIENT_ID` | - | passed through to the web child if set |

**Autosave**: `.quiz.history` previously only reached disk via an
explicit `.quiz.save[]` call - a q crash between saves silently lost
everything recorded since. `web/autosave.py` now calls it on a timer from
a background thread in the web process (started by `wsgi.py`/`app.py`,
not by importing `app` - so the test suite is unaffected), plus once on a
graceful process exit. No q/kdb code was added for this - it's a plain
Python client calling the existing `.quiz.save[]` function, the same way
any other request does.

**Windows note**: a forceful stop (`taskkill /F`, a crash, power loss)
skips both q's own exit handling and Python's `atexit`/signal handling -
neither this supervisor nor q itself can guarantee a save in that case.
The periodic autosave is what actually bounds data loss (worst case, the
autosave interval's worth of activity); the on-exit save is just a bonus
for the graceful-stop case.

**Alternative: running as a real Windows service.** This script is a
console app, not a service - if you want it to survive a reboot or show
up in `services.msc`, wrap it with [NSSM](https://nssm.cc/) (`nssm
install q-quiz python scripts/supervisor.py`) or a Task Scheduler "at
startup" trigger. Neither is set up here since installing a service
manager is a system-level change worth doing deliberately rather than as
a side effect of this change.

## Kubernetes (sketch, not deployed)

`docker/` and `k8s/` sketch a three-service architecture - q-core (the
real app), judge-worker (a hardened, isolated pool that grades arbitrary
submitted code without access to real data), and web - for if this ever
needs to be reachable by people other than one trusted local user. See
[`k8s/README.md`](k8s/README.md) for the architecture, what's actually
been verified (the new q loader script was tested locally; the
Dockerfiles/manifests have not, since this environment has no Docker,
kubectl, cluster, or licensed Linux kdb+ build), and what's genuinely
missing before it would run anywhere.
