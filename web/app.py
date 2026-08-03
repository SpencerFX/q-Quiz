from flask import Flask, render_template

from services import QuizService

app = Flask(__name__)

quiz = QuizService()


@app.get("/")
def index():
    return render_template("index.html")


@app.get("/quiz")
def start():
    return render_template("quiz.html")


@app.get("/results")
def results():
    return render_template("results.html")


if __name__ == "__main__":
    app.run(
        host="127.0.0.1",
        port=8000,
        debug=True
    )