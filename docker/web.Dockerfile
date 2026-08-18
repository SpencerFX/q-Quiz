# web: the Flask/waitress app (wsgi.py). Talks to q-core for
# everything except grading, and to judge-worker (via its Service,
# load-balanced across replicas) for grading arbitrary submitted code -
# see web/services.py, which is NOT yet updated to call judge-worker
# instead of q-core directly (see k8s/README.md - "what's not wired
# yet"). Runs fine talking only to q-core today, same as it does
# locally.
#
# python:3.6-slim-buster is the last available slim image for this
# app's pinned Python 3.6 / Flask 1.1.4 stack, and 3.6 is long EOL -
# worth treating a real migration to this as the moment to also bump
# the Python/Flask versions rather than shipping EOL Python to
# production. Sketched as-is (unmodified) here since that's a separate
# decision from "does containerizing/K8s make sense."

FROM python:3.6-slim-buster

RUN useradd --create-home --uid 1000 webapp
WORKDIR /app

COPY web/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY web/ .

# web/uploads/ (resume/photo uploads) needs to exist and be writable -
# comes from a mounted volume at runtime (see k8s/web/deployment.yaml),
# not from the image. If web ever runs with more than 1 replica, that
# volume needs to be ReadWriteMany (or uploads need to move to object
# storage) - a single hostPath/local PVC only works for replicas: 1.
RUN mkdir -p uploads && chown -R webapp:webapp /app

USER webapp

EXPOSE 8000

CMD ["python", "wsgi.py"]
