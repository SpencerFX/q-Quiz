from pykx import SyncQConnection


class QuizClient:

    def __init__(self,
                 host="localhost",
                 port=5001):

        self.q = SyncQConnection(host=host,
                                 port=port)

    def new(self, bank):

        return self.q(
            ".quiz.api.new",
            bank
        )

    def next(self):

        return self.q(
            ".quiz.api.next[]"
        )

    def answer(self, answer):

        return self.q(
            ".quiz.api.answer",
            answer
        )

    def state(self):

        return self.q(
            ".quiz.api.state[]"
        )

    def reset(self):

        return self.q(
            ".quiz.api.reset[]"
        )

    def version(self):

        return self.q(
            ".quiz.api.version[]"
        )