import os
from dataclasses import asdict

from flask import Flask, render_template, request, jsonify, send_from_directory, session, redirect, url_for
from werkzeug.utils import secure_filename

from services import QuizService, JudgeService, ProfileService, DiChallengeService, LeetcodeService, IdiomService, QuantRankService, JobService, FundamentalsService, LeaderboardService
import resume_parser

app = Flask(__name__)

# Flask defaults to caching static files for 12 hours, which makes CSS/JS
# edits invisible without a hard refresh during local development.
app.config["SEND_FILE_MAX_AGE_DEFAULT"] = 0

# Needed to sign the session cookie that backs the lightweight login below.
# This is a local dev install with no real accounts yet - swap for a real
# secret (env-only, never committed) before this goes anywhere multi-user.
app.secret_key = os.environ.get("FLASK_SECRET_KEY", "dev-only-insecure-secret-change-me")

quiz = QuizService()
judge = JudgeService()
profile = ProfileService()
aquaq = DiChallengeService()
leetcode = LeetcodeService()
qidioms = IdiomService()
quantrank = QuantRankService()
jobs = JobService()
fundamentals = FundamentalsService()
leaderboard = LeaderboardService()

UPLOAD_DIR = os.path.join(os.path.dirname(__file__), "uploads")
ALLOWED_RESUME_EXTENSIONS = {"pdf", "doc", "docx"}
ALLOWED_PHOTO_EXTENSIONS = {"png", "jpg", "jpeg", "gif", "webp"}


def _error_message(exc):
    # qpython raises q-side errors (eg .checker.grade's '"Unknown problem")
    # as a QException whose arg is the raw bytes off the wire, so plain
    # str(exc) renders as "b'Unknown problem'" instead of the message.
    message = exc.args[0] if exc.args else exc
    if isinstance(message, bytes):
        message = message.decode()
    return str(message)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/login")
def login_page():
    if session.get("user_handle"):
        return redirect(url_for("index"))
    return render_template("login.html")


@app.route("/login", methods=["POST"])
def login_submit():
    handle = request.form.get("handle", "").strip()
    if not handle:
        return render_template("login.html", error="Enter a display name to continue."), 400
    session["user_handle"] = handle[:40]
    return redirect(url_for("index"))


@app.route("/logout")
def logout():
    session.pop("user_handle", None)
    return redirect(url_for("index"))


@app.route("/api/session")
def api_session():
    handle = session.get("user_handle")
    return jsonify({"loggedIn": handle is not None, "handle": handle})


@app.route("/auth/google")
def auth_google_stub():
    # No Google Cloud OAuth client has been provisioned for this app yet -
    # this endpoint exists so the "Sign in with Google" button on /login
    # has something real to call and can explain why it doesn't work yet,
    # instead of failing silently. Wire this up to Authlib/Flask-Dance once
    # GOOGLE_CLIENT_ID / GOOGLE_CLIENT_SECRET are available.
    return jsonify({
        "error": "Google sign-in isn't configured yet - set GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET to enable it. Use the display name field below for now."
    }), 501


@app.route("/auth/linkedin")
def auth_linkedin_stub():
    # Same situation as /auth/google - no LinkedIn OAuth app has been
    # registered yet, so this just explains the gap instead of the button
    # doing nothing. Wire up via Authlib once LINKEDIN_CLIENT_ID /
    # LINKEDIN_CLIENT_SECRET are available (LinkedIn uses OpenID Connect).
    return jsonify({
        "error": "LinkedIn sign-in isn't configured yet - set LINKEDIN_CLIENT_ID and LINKEDIN_CLIENT_SECRET to enable it. Use the display name field below for now."
    }), 501


@app.route("/quiz")
def start():
    mode = "MultipleChoiceSyntax" if request.args.get("mode") == "syntax" else "MultipleChoice"
    quiz.set_mode(mode)
    return render_template("quiz.html")


@app.route("/results")
def results():
    return render_template("results.html")


@app.route("/api/question")
def api_question():
    try:
        question = quiz.get_question()
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(question)


@app.route("/api/answer", methods=["POST"])
def api_answer():
    answer = request.get_json(force=True).get("answer", "")
    try:
        result = quiz.submit_answer(answer)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/results")
def api_results():
    return jsonify(quiz.results())


@app.route("/api/history")
def api_history():
    return jsonify(quiz.history())


@app.route("/api/completion")
def api_completion():
    return jsonify(quiz.completion_rates())


@app.route("/problems")
def problems():
    return render_template("problems.html")


@app.route("/api/problems")
def api_problems():
    return jsonify([p.__dict__ for p in judge.list_problems()])


@app.route("/problems/<problem>")
def problem_detail(problem):
    return render_template("problem.html", problem=problem)


@app.route("/api/problems/<problem>/info")
def api_problem_info(problem):
    try:
        info = judge.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/problems/<problem>/submit", methods=["POST"])
def api_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = judge.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/problems/<problem>/run", methods=["POST"])
def api_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = judge.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/aquaq")
def aquaq_list():
    return render_template("aquaq.html")


@app.route("/api/aquaq")
def api_aquaq_list():
    return jsonify([p.__dict__ for p in aquaq.list_problems()])


@app.route("/aquaq/<problem>")
def aquaq_detail(problem):
    return render_template("aquaqProblem.html", problem=problem)


@app.route("/api/aquaq/<problem>/info")
def api_aquaq_info(problem):
    try:
        info = aquaq.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/aquaq/<problem>/submit", methods=["POST"])
def api_aquaq_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = aquaq.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/aquaq/<problem>/run", methods=["POST"])
def api_aquaq_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = aquaq.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/leetcode")
def leetcode_list():
    return render_template("leetcode.html")


@app.route("/api/leetcode")
def api_leetcode_list():
    return jsonify([p.__dict__ for p in leetcode.list_problems()])


@app.route("/leetcode/<problem>")
def leetcode_detail(problem):
    return render_template("leetcodeProblem.html", problem=problem)


@app.route("/api/leetcode/<problem>/info")
def api_leetcode_info(problem):
    try:
        info = leetcode.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/leetcode/<problem>/submit", methods=["POST"])
def api_leetcode_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = leetcode.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/leetcode/<problem>/run", methods=["POST"])
def api_leetcode_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = leetcode.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/qidioms")
def qidioms_list():
    return render_template("qidioms.html")


@app.route("/api/qidioms")
def api_qidioms_list():
    return jsonify([p.__dict__ for p in qidioms.list_problems()])


@app.route("/qidioms/<problem>")
def qidioms_detail(problem):
    return render_template("qidiomsProblem.html", problem=problem)


@app.route("/api/qidioms/<problem>/info")
def api_qidioms_info(problem):
    try:
        info = qidioms.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/qidioms/<problem>/submit", methods=["POST"])
def api_qidioms_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = qidioms.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/qidioms/<problem>/run", methods=["POST"])
def api_qidioms_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = qidioms.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/quantrank")
def quantrank_list():
    return render_template("quantrank.html")


@app.route("/api/quantrank")
def api_quantrank_list():
    return jsonify([p.__dict__ for p in quantrank.list_problems()])


@app.route("/quantrank/<problem>")
def quantrank_detail(problem):
    return render_template("quantrankProblem.html", problem=problem)


@app.route("/api/quantrank/<problem>/info")
def api_quantrank_info(problem):
    try:
        info = quantrank.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/quantrank/<problem>/submit", methods=["POST"])
def api_quantrank_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = quantrank.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/quantrank/<problem>/run", methods=["POST"])
def api_quantrank_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = quantrank.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/jobs")
def jobs_list():
    return render_template("jobs.html")


@app.route("/api/jobs")
def api_jobs_list():
    return jsonify([asdict(j) for j in jobs.list_jobs()])


@app.route("/leaderboard")
def leaderboard_list():
    return render_template("leaderboard.html")


@app.route("/api/leaderboard")
def api_leaderboard_list():
    return jsonify([asdict(e) for e in leaderboard.list_entries()])


@app.route("/fundamentals")
def fundamentals_list():
    return render_template("fundamentals.html")


@app.route("/api/fundamentals")
def api_fundamentals_list():
    return jsonify([p.__dict__ for p in fundamentals.list_problems()])


@app.route("/fundamentals/<problem>")
def fundamentals_detail(problem):
    return render_template("fundamentalsProblem.html", problem=problem)


@app.route("/api/fundamentals/<problem>/info")
def api_fundamentals_info(problem):
    try:
        info = fundamentals.get_info(problem)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify({"info": info})


@app.route("/api/fundamentals/<problem>/submit", methods=["POST"])
def api_fundamentals_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = fundamentals.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/api/fundamentals/<problem>/run", methods=["POST"])
def api_fundamentals_run(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = fundamentals.run(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/profile")
def profile_view():
    return render_template("profile.html")


@app.route("/profile/edit")
def profile_edit():
    return render_template("profile_edit.html")


@app.route("/api/profile")
def api_profile_get():
    return jsonify(profile.get())


@app.route("/api/profile/badges")
def api_profile_badges():
    return jsonify(quiz.badge_counts())


@app.route("/api/profile", methods=["POST"])
def api_profile_register():
    body = request.get_json(force=True)
    try:
        result = profile.register(
            body.get("name", ""),
            body.get("tagline", ""),
            body.get("email", ""),
            body.get("phone", ""),
            body.get("location", "")
        )
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/resume", methods=["POST"])
def api_profile_resume():
    file = request.files.get("resume")
    if file is None or file.filename == "":
        return jsonify({"error": "No file provided"}), 400
    ext = file.filename.rsplit(".", 1)[-1].lower() if "." in file.filename else ""
    if ext not in ALLOWED_RESUME_EXTENSIONS:
        return jsonify({"error": "Resume must be a PDF, DOC, or DOCX file"}), 400

    os.makedirs(UPLOAD_DIR, exist_ok=True)
    for existing in os.listdir(UPLOAD_DIR):
        if existing.startswith("resume."):
            os.remove(os.path.join(UPLOAD_DIR, existing))

    filename = secure_filename("resume." + ext)
    file.save(os.path.join(UPLOAD_DIR, filename))

    try:
        result = profile.set_resume(filename)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/resume/autofill", methods=["POST"])
def api_profile_resume_autofill():
    file = request.files.get("resume")
    if file is None or file.filename == "":
        return jsonify({"error": "No file provided"}), 400
    ext = file.filename.rsplit(".", 1)[-1].lower() if "." in file.filename else ""
    if ext not in ALLOWED_RESUME_EXTENSIONS:
        return jsonify({"error": "Resume must be a PDF, DOC, or DOCX file"}), 400
    if ext == "doc":
        return jsonify({"error": "Auto-fill can't read old-style .doc files yet - upload a PDF or DOCX to auto-fill, or fill sections in by hand."}), 400

    os.makedirs(UPLOAD_DIR, exist_ok=True)
    for existing in os.listdir(UPLOAD_DIR):
        if existing.startswith("resume."):
            os.remove(os.path.join(UPLOAD_DIR, existing))

    filename = secure_filename("resume." + ext)
    saved_path = os.path.join(UPLOAD_DIR, filename)
    file.save(saved_path)

    try:
        result = profile.set_resume(filename)
        text = resume_parser.extract_text(saved_path, ext)
        parsed = resume_parser.parse_resume(text)

        for edu in parsed["education"]:
            result = profile.add_education(edu["school"], edu["degree"], edu["startDate"], edu["endDate"])

        for exp in parsed["experience"]:
            result = profile.add_experience(
                exp["company"], exp["title"], exp["startDate"], exp["endDate"],
                exp["location"], exp["description"]
            )

        for link in parsed["links"]:
            result = profile.add_link(link["label"], link["url"])

        for skill in parsed["skills"]:
            result = profile.add_skill(skill)

        result["autofill"] = {
            "experience": len(parsed["experience"]),
            "education": len(parsed["education"]),
            "links": len(parsed["links"]),
            "skills": len(parsed["skills"])
        }
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/photo", methods=["POST"])
def api_profile_photo():
    file = request.files.get("photo")
    if file is None or file.filename == "":
        return jsonify({"error": "No file provided"}), 400
    ext = file.filename.rsplit(".", 1)[-1].lower() if "." in file.filename else ""
    if ext not in ALLOWED_PHOTO_EXTENSIONS:
        return jsonify({"error": "Photo must be a PNG, JPG, GIF, or WEBP image"}), 400

    os.makedirs(UPLOAD_DIR, exist_ok=True)
    for existing in os.listdir(UPLOAD_DIR):
        if existing.startswith("photo."):
            os.remove(os.path.join(UPLOAD_DIR, existing))

    filename = secure_filename("photo." + ext)
    file.save(os.path.join(UPLOAD_DIR, filename))

    try:
        result = profile.set_photo(filename)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/uploads/<path:filename>")
def uploaded_file(filename):
    return send_from_directory(UPLOAD_DIR, filename)


@app.route("/api/profile/experience", methods=["POST"])
def api_add_experience():
    body = request.get_json(force=True)
    try:
        result = profile.add_experience(
            body.get("company", ""),
            body.get("title", ""),
            body.get("startDate", ""),
            body.get("endDate", ""),
            body.get("location", ""),
            body.get("description", "")
        )
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/experience/<int:entry_id>", methods=["DELETE"])
def api_remove_experience(entry_id):
    try:
        result = profile.remove_experience(entry_id)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/education", methods=["POST"])
def api_add_education():
    body = request.get_json(force=True)
    try:
        result = profile.add_education(
            body.get("school", ""),
            body.get("degree", ""),
            body.get("startDate", ""),
            body.get("endDate", "")
        )
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/education/<int:entry_id>", methods=["DELETE"])
def api_remove_education(entry_id):
    try:
        result = profile.remove_education(entry_id)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/links", methods=["POST"])
def api_add_link():
    body = request.get_json(force=True)
    try:
        result = profile.add_link(
            body.get("label", ""),
            body.get("url", "")
        )
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/links/<int:entry_id>", methods=["DELETE"])
def api_remove_link(entry_id):
    try:
        result = profile.remove_link(entry_id)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/skills", methods=["POST"])
def api_add_skill():
    body = request.get_json(force=True)
    try:
        result = profile.add_skill(body.get("skill", ""))
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


@app.route("/api/profile/skills/<int:entry_id>", methods=["DELETE"])
def api_remove_skill(entry_id):
    try:
        result = profile.remove_skill(entry_id)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(result)


if __name__ == "__main__":
    app.run(
        host="127.0.0.1",
        port=8000,
        debug=True
    )