import os

from waitress import serve

import autosave
from app import app

# Canonical production entrypoint: `python wsgi.py` (from the web/
# directory, same as every other way this app gets run). Replaces the
# Werkzeug dev server (app.run()) that prints its own "do not use this in
# a production deployment" warning - waitress is a real, threaded WSGI
# server and runs on Windows, unlike gunicorn.
HOST = os.environ.get("HOST", "127.0.0.1")
PORT = int(os.environ.get("PORT", 8000))
THREADS = int(os.environ.get("WAITRESS_THREADS", 4))
AUTOSAVE_INTERVAL_SECONDS = int(os.environ.get("AUTOSAVE_INTERVAL_SECONDS", autosave.DEFAULT_INTERVAL_SECONDS))

if __name__ == "__main__":
    autosave.start(AUTOSAVE_INTERVAL_SECONDS)
    serve(app, host=HOST, port=PORT, threads=THREADS)
