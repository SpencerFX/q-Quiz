# q-core: the single stateful q process holding live app state
# (.quiz.history, question banks, profile data) - everything except
# arbitrary user-submitted-code grading, which judge-worker.Dockerfile
# handles in isolation instead.
#
# NOT independently testable here - built and sketched without Docker,
# a Linux kdb+ binary, or a kdb+ license available in this environment.
# See k8s/README.md for exactly what you need to supply before this runs.

FROM debian:bullseye-slim

# kdb+ is not freely redistributable, so it isn't fetched here - copy the
# Linux 64-bit build in at build time (from a licensed download, not
# committed to this repo). Expected layout: kdb/l64/q, kdb/q.k, etc.
# (KX's own zip layout, "kdb" being $QHOME).
COPY kdb/ /opt/kdb/
ENV QHOME=/opt/kdb
ENV PATH="/opt/kdb/l64:${PATH}"

# The license file (k4.lic) is deliberately NOT copied in - see
# k8s/q-core/statefulset.yaml, which mounts it from a Secret at runtime
# instead, the same way the results/profile PVC is mounted rather than
# baked in. Baking a license into an image means anyone with the image
# has your license.

RUN useradd --create-home --uid 1000 qapp
WORKDIR /app

# Everything q-core loads at boot (scripts/init.q pulls all of this in
# via relative "system \"l ...\"" calls, so cwd has to be /app at
# runtime) - excludes web/ (Python, not needed here) and the
# judge-only sections' data that judge-worker.Dockerfile ships instead.
COPY scripts/ ./scripts/
COPY banks/ ./banks/
COPY banksSyntax/ ./banksSyntax/
COPY hackerRank/ ./hackerRank/
COPY diChallenges/ ./diChallenges/
COPY leetcode/ ./leetcode/
COPY qIdioms/ ./qIdioms/
COPY quantRank/ ./quantRank/
COPY fundamentals/ ./fundamentals/
COPY euler/ ./euler/
COPY adventOfCode/ ./adventOfCode/
COPY jobs/ ./jobs/
COPY web/q/ ./web/q/

# results/ and profile/ are where .quiz.save[]/.profile persistence
# writes - these come from the PersistentVolumeClaim mounted at runtime
# (see statefulset.yaml), not from the image, but the directories need
# to exist so a first boot with an empty volume doesn't fail on a
# missing path.
RUN mkdir -p results profile && chown -R qapp:qapp /app

USER qapp

EXPOSE 5000

# -p 5000 opens q's IPC listener; that's the ONLY interface this
# container exposes (no HTTP here) - Flask/waitress talks to it over
# the ClusterIP Service using the same qpython IPC client it already
# uses locally.
CMD ["q", "scripts/init.q", "-p", "5000"]
