from dataclasses import dataclass


@dataclass
class Question:

    question: str

    answers: dict

    correct: str


@dataclass
class Problem:

    problem: str

    area: str

    difficulty: str


@dataclass
class CaseResult:

    case_no: int

    passed: bool

    actual: str

    expected: str


@dataclass
class JudgeResult:

    problem: str

    area: str

    difficulty: str

    passed: bool

    cases: list