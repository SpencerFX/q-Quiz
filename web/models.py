from dataclasses import dataclass


@dataclass
class Question:

    question: str

    answers: dict

    correct: str