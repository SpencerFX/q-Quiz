import os
from dataclasses import asdict

from flask import Flask, render_template, request, jsonify, send_from_directory
from werkzeug.utils import secure_filename

from services import QuizService, JudgeService, ProfileService

app = Flask(__name__)

# Flask defaults to caching static files for 12 hours, which makes CSS/JS
# edits invisible without a hard refresh during local development.
app.config["SEND_FILE_MAX_AGE_DEFAULT"] = 0

quiz = QuizService()
judge = JudgeService()
profile = ProfileService()

UPLOAD_DIR = os.path.join(os.path.dirname(__file__), "uploads")
ALLOWED_RESUME_EXTENSIONS = {"pdf", "doc", "docx"}


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


@app.route("/quiz")
def start():
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


@app.route("/problems")
def problems():
    return render_template("problems.html")


@app.route("/api/problems")
def api_problems():
    return jsonify([p.__dict__ for p in judge.list_problems()])


@app.route("/problems/<problem>")
def problem_detail(problem):
    return render_template("problem.html", problem=problem)


@app.route("/api/problems/<problem>/submit", methods=["POST"])
def api_submit(problem):
    code = request.get_json(force=True).get("code", "")
    try:
        result = judge.submit(problem, code)
    except Exception as exc:
        return jsonify({"error": _error_message(exc)}), 400
    return jsonify(asdict(result))


@app.route("/profile")
def profile_view():
    return render_template("profile.html")


@app.route("/profile/edit")
def profile_edit():
    return render_template("profile_edit.html")


@app.route("/api/profile")
def api_profile_get():
    return jsonify(profile.get())


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