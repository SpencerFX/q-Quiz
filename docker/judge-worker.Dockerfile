# judge-worker: grades arbitrary user-submitted q code, in isolation
# from q-core (the process holding real .quiz.history/profile data).
# This image intentionally cannot reach any persistent data - see
# scripts/init_judge_worker.q for what it loads (grading only, no
# .quiz.history/live state) and k8s/judge-worker/networkpolicy.yaml
# for the network lockdown. A compromised or buggy submission here has
# nothing to read, nothing to write, and nowhere to send anything.
#
# NOT independently testable here - see docker/q-core.Dockerfile's
# header for why (no Docker, no Linux kdb+ binary, no license in this
# environment). scripts/init_judge_worker.q itself WAS verified
# locally against Windows q - see k8s/README.md.

FROM debian:bullseye-slim

COPY kdb/ /opt/kdb/
ENV QHOME=/opt/kdb
ENV PATH="/opt/kdb/l64:${PATH}"

RUN useradd --create-home --uid 1000 qapp
WORKDIR /app

# Read-only grading data only - no scripts/init.q (that pulls in
# .quiz.history/banks/jobs, none of which belong in a sandboxed grader),
# no results/ or profile/ directories, nothing under web/ except the
# .web.judgeX function definitions.
COPY scripts/init_judge_worker.q ./scripts/init_judge_worker.q
COPY hackerRank/ ./hackerRank/
COPY diChallenges/ ./diChallenges/
COPY leetcode/ ./leetcode/
COPY qIdioms/ ./qIdioms/
COPY quantRank/ ./quantRank/
COPY fundamentals/ ./fundamentals/
COPY euler/ ./euler/
COPY adventOfCode/ ./adventOfCode/
COPY web/q/ ./web/q/

RUN chown -R qapp:qapp /app

USER qapp

EXPOSE 5000

CMD ["q", "scripts/init_judge_worker.q", "-p", "5000"]
