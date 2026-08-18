import os

Q_HOST = os.environ.get("Q_HOST", "localhost")

Q_PORT = int(os.environ.get("Q_PORT", 5000))

DEBUG = True