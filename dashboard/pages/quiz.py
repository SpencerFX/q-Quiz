from nicegui import ui

from qclient import QuizClient


client = QuizClient()


class QuizPage:

    def __init__(self):

        self.question = None
        self.selected = None

        ui.label("q-Quiz") \
            .classes("text-h3")

        self.topic = ui.label()

        self.progress = ui.label()

        self.questionLabel = ui.label() \
            .classes("text-h5")

        self.radio = ui.radio(
            {
                "a": "",
                "b": "",
                "c": "",
                "d": ""
            }
        )

        ui.button(
            "Submit",
            on_click=self.submit
        )

        ui.separator()

        self.score = ui.label()

        ui.button(
            "Next",
            on_click=self.next
        )

        self.start()

    def start(self):

        client.new(".quiz.bankEasy")

        self.next()

    def next(self):

        self.question = client.next()

        self.questionLabel.text = self.question["question"]

        answers = self.question["answers"]

        self.radio.options = {
            "a": answers["a"],
            "b": answers["b"],
            "c": answers["c"],
            "d": answers["d"]
        }

        self.radio.value = None

        self.refresh()

    def submit(self):

        if self.radio.value is None:
            return

        client.answer(self.radio.value)

        self.refresh()

    def refresh(self):

        state = client.state()

        self.score.text = \
            f"Score: {state['correct']} / {state['answered']}"

        self.progress.text = \
            f"Remaining: {state['remaining']}"