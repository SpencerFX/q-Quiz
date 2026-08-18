# q-Quiz on Kubernetes (sketch)

This is a sketch, not a working deployment. It was written and validated
(YAML parses, `docker/*.Dockerfile` reviewed carefully) without Docker,
kubectl, a Kubernetes cluster, or a Linux kdb+ binary available in the
environment that built it - see "What's actually been verified" below for
exactly where the line is.

## Architecture

Three services instead of the current two processes (q + web):

- **q-core** (StatefulSet, replicas: 1) - the real app: `.quiz.history`,
  question banks, profile data. Same q process this app has always run,
  containerized. `docker/q-core.Dockerfile`.
- **judge-worker** (Deployment, replicas: 3) - grades arbitrary
  user-submitted q code in an isolated, hardened, read-only,
  no-network pod, separate from q-core's real data. This is the actual
  point of doing any of this - see the "arbitrary code execution"
  conversation this came out of. `docker/judge-worker.Dockerfile`,
  `scripts/init_judge_worker.q`.
- **web** (Deployment, replicas: 1 for now) - the existing Flask/waitress
  app, unmodified except for how it finds q. `docker/web.Dockerfile`.

```
  Ingress -> web (1+ replicas) -> q-core (1 replica, has the real data)
                                -> judge-worker (3 replicas, sandboxed, no data)
```

## What's NOT wired up yet

- **web/services.py still calls q-core directly for grading**, exactly
  like it does running locally. Routing grading calls to judge-worker
  instead is an application code change (something like a second
  `QClient` pointed at `JUDGE_WORKER_HOST`/`JUDGE_WORKER_PORT`, used only
  by the judge/submit endpoints), not part of this infra sketch.
- Recording a graded result into q-core's real `.quiz.history` becomes a
  **second call** once grading moves to judge-worker (today one q-side
  function call does both). `scripts/init_judge_worker.q` stubs
  `.quiz.history`/`.web.currentUser` so the existing `.web.judgeX`
  functions run unmodified in the worker, but that stubbed insert is
  thrown away - nothing currently makes the follow-up call back to
  q-core.
- **No execution timeout on submitted code**, in q-core or judge-worker.
  Resource `limits` on judge-worker (deployment.yaml) bound CPU/memory,
  but a submission that just loops forever ties up that pod indefinitely
  rather than erroring out. Was explicitly deprioritized in the design
  conversation, flagged again here since it matters more once judge-worker
  actually starts receiving arbitrary submissions.

## What's actually been verified

- `scripts/init_judge_worker.q` **was tested locally** against Windows q
  on an isolated port: boots cleanly, and `.web.judgeEuler` /
  `.web.judge` / `.web.judgeDiChallenge` all graded correctly (both
  pass and fail cases) with nothing but the trimmed grading-only
  environment loaded - no `.quiz.history`, no banks, no jobs data.
- All 12 YAML files parse as valid YAML with the expected `kind` (checked
  with PyYAML - not the same as validating against the real Kubernetes
  API schema, which needs `kubectl apply --dry-run=server` or `kubeconform`
  against a real or test cluster).
- The Dockerfiles have **not** been built - no Docker in this environment.

## Real gaps before this could actually run anywhere

1. **kdb+ license and Linux binary.** Neither Dockerfile bundles kdb+
   itself - `COPY kdb/` expects a licensed Linux 64-bit build placed at
   `docker/kdb/` before building, which isn't available here. The
   license file itself is deliberately kept out of the image entirely
   (see `k8s/q-core/statefulset.yaml`'s `q-quiz-kdb-license` Secret) -
   baking a license into an image means anyone with the image has it.
2. **This app has only ever run q.exe on Windows.** These Dockerfiles
   assume the Linux build. That's very likely a drop-in swap for the q
   side itself, but it's genuinely untested here - the local
   verification above used Windows q, not Linux.
3. **No cluster to apply any of this to.** Locally, `kind` or `minikube`
   would be the way to try it before anything real; a managed cluster
   (AKS/EKS/GKE) is the real destination if this app is actually going
   to be reachable by other people.
4. **TLS.** `k8s/web/ingress.yaml` has no certificate configured - fine
   for `kubectl port-forward`-style local testing, not fine for
   anything real. Google Identity Services (the sign-in flow added
   earlier) requires HTTPS in production; `localhost` is the only
   documented exception, which is the sole reason the current
   plain-HTTP local setup has worked at all.
5. **Secrets.** `k8s/base/secret.example.yaml` is a template with
   placeholder values, safe to commit - see the comment in that file for
   how to actually create the real Secret via `kubectl create secret`
   (or, better, a real secrets manager) instead.

## If you do want to try this for real

```
# 1. Get a licensed Linux kdb+ build into docker/kdb/ (not provided here)
# 2. Build the three images
docker build -f docker/q-core.Dockerfile -t q-quiz/q-core:latest .
docker build -f docker/judge-worker.Dockerfile -t q-quiz/judge-worker:latest .
docker build -f docker/web.Dockerfile -t q-quiz/web:latest .

# 3. Get them into your cluster (kind load docker-image / minikube image load /
#    push to a real registry - depends on where you're running this)

# 4. Apply everything
kubectl apply -f k8s/base/namespace.yaml
kubectl create secret generic q-quiz-kdb-license --namespace q-quiz \
  --from-file=k4.lic=/path/to/your/k4.lic
kubectl apply -f k8s/base/configmap.yaml
kubectl create secret generic q-quiz-secrets --namespace q-quiz \
  --from-literal=FLASK_SECRET_KEY="$(python -c 'import secrets; print(secrets.token_hex(32))')" \
  --from-literal=GOOGLE_CLIENT_ID="<your real client ID>"
kubectl apply -f k8s/q-core/
kubectl apply -f k8s/judge-worker/
kubectl apply -f k8s/web/
```
