from nicegui import ui

from pages.quiz import QuizPage


QuizPage()

ui.run(
    title="q-Quiz",
    reload=True
)