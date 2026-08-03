from qclient import QClient


class QuizService:

    def __init__(self):

        self.q = QClient()

    def get_question(self):

        return self.q.execute(
            ".quiz.ask[]"
        )

    def submit_answer(self, answer):

        return self.q.execute(
            f'.quiz.answer[`{answer}]'
        )

    def results(self):

        return self.q.execute(
            ".quiz.results[]"
        )