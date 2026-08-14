import re

from qclient import QClient
from models import Problem, JudgeResult, CaseResult

# Matches a q "    -1 "text";" print line from a problem's .info function,
# capturing the text so the wrapping -1 "...."; can be stripped for display.
_INFO_LINE = re.compile(r'^\s*-1\s+"(.*)";\s*$')

# diChallenges question files use plain "/ text" comments instead - just
# strip the leading slash and at most one following space.
_DI_INFO_LINE = re.compile(r'^/ ?(.*)$')


def _decode(value):

    if hasattr(value, "decode"):

        return value.decode()

    return value


def _decode_list(values):

    return [_decode(v) for v in values]


def _rows(table):

    if hasattr(table, "to_dict"):

        return table.to_dict("records")

    if hasattr(table, "dtype") and table.dtype.names:

        return [
            {name: table[name][i] for name in table.dtype.names}
            for i in range(len(table))
        ]

    return list(table)


class QuizService:

    def __init__(self):

        self.q = QClient()

    def get_question(self):

        raw = self.q.execute(".web.nextQuestion[]")

        data = {_decode(k): v for k, v in raw.items()}

        answers = {_decode(k): _decode(v) for k, v in data["answers"].items()}

        return {
            "question": _decode(data["question"]),
            "answers": answers,
            "number": int(data["number"])
        }

    def submit_answer(self, answer):

        raw = self.q.execute(".web.submitAnswer", answer)

        data = {_decode(k): v for k, v in raw.items()}

        return {
            "correct": bool(data["correct"]),
            "correctAnswer": _decode(data["correctAnswer"]),
            "finished": bool(data["finished"])
        }

    def results(self):

        raw = self.q.execute(".web.score[]")

        data = {_decode(k): v for k, v in raw.items()}

        return {
            "correct": int(data["correct"]),
            "total": int(data["total"])
        }

    def history(self):

        rows = self.q.execute(".web.results[]")

        return [
            {
                "questionNo": int(row["questionNo"]),
                "question": _decode(row["question"]),
                "questionType": _decode(row["questionType"]),
                "correct": bool(row["result"]),
                "runningCorrect": int(row["runningCorrect"]),
                "percentCorrect": float(row["percentCorrect"])
            }
            for row in _rows(rows)
        ]


class JudgeService:

    def __init__(self):

        self.q = QClient()

    def list_problems(self):

        rows = self.q.execute(".web.listProblems[]")

        return [
            Problem(
                problem=_decode(row["problem"]),
                area=_decode(row["area"]),
                difficulty=_decode(row["difficulty"])
            )
            for row in _rows(rows)
        ]

    def submit(self, problem, code):

        raw = self.q.execute(".web.judge", problem, code)

        data = {_decode(k): v for k, v in raw.items()}

        cases = [
            CaseResult(
                case_no=int(case_no),
                passed=bool(passed),
                actual=_decode(actual),
                expected=_decode(expected)
            )
            for case_no, passed, actual, expected in zip(
                data["caseNo"],
                data["casePass"],
                _decode_list(data["caseActual"]),
                _decode_list(data["caseExpected"])
            )
        ]

        return JudgeResult(
            problem=_decode(data["problem"]),
            area=_decode(data["area"]),
            difficulty=_decode(data["difficulty"]),
            passed=bool(data["pass"]),
            cases=cases
        )

    def get_info(self, problem):

        raw_lines = self.q.execute(".web.problemInfoLines", problem)

        text_lines = []

        for raw_line in raw_lines:

            match = _INFO_LINE.match(_decode(raw_line))

            if match:

                text_lines.append(match.group(1).replace('\\"', '"'))

        return "\n".join(text_lines)


class DiChallengeService:

    def __init__(self):

        self.q = QClient()

    def list_problems(self):

        rows = self.q.execute(".web.listDiChallenges[]")

        return [
            Problem(
                problem=_decode(row["problem"]),
                area=_decode(row["area"]),
                difficulty=_decode(row["difficulty"])
            )
            for row in _rows(rows)
        ]

    def submit(self, problem, code):

        raw = self.q.execute(".web.judgeDiChallenge", problem, code)

        data = {_decode(k): v for k, v in raw.items()}

        cases = [
            CaseResult(
                case_no=int(case_no),
                passed=bool(passed),
                actual=_decode(actual),
                expected=_decode(expected)
            )
            for case_no, passed, actual, expected in zip(
                data["caseNo"],
                data["casePass"],
                _decode_list(data["caseActual"]),
                _decode_list(data["caseExpected"])
            )
        ]

        return JudgeResult(
            problem=_decode(data["problem"]),
            area=_decode(data["kind"]),
            difficulty=_decode(data["difficulty"]),
            passed=bool(data["pass"]),
            cases=cases
        )

    def get_info(self, problem):

        raw_lines = self.q.execute(".web.diChallengeInfoLines", problem)

        text_lines = []

        for raw_line in raw_lines:

            decoded = _decode(raw_line)

            if decoded.strip() == "":

                text_lines.append("")

                continue

            match = _DI_INFO_LINE.match(decoded)

            text_lines.append(match.group(1) if match else decoded)

        return "\n".join(text_lines)


def _decode_entries(table):

    return [
        {
            key: (int(value) if key == "id" else _decode(value))
            for key, value in row.items()
        }
        for row in _rows(table)
    ]


class ProfileService:

    def __init__(self):

        self.q = QClient()

    def _parse(self, raw):

        data = {_decode(k): v for k, v in raw.items()}

        return {
            "name": _decode(data["name"]),
            "tagline": _decode(data["tagline"]),
            "email": _decode(data["email"]),
            "phone": _decode(data["phone"]),
            "location": _decode(data["location"]),
            "resumeFilename": _decode(data["resumeFilename"]),
            "registered": bool(data["registered"]),
            "experience": _decode_entries(data["experience"]),
            "education": _decode_entries(data["education"]),
            "links": _decode_entries(data["links"]),
            "skills": _decode_entries(data["skills"])
        }

    def get(self):

        return self._parse(self.q.execute(".web.profile.get[]"))

    def register(self, name, tagline, email, phone, location):

        raw = self.q.execute(".web.profile.register", name, tagline, email, phone, location)

        return self._parse(raw)

    def set_resume(self, filename):

        return self._parse(self.q.execute(".web.profile.setResume", filename))

    def add_experience(self, company, title, start_date, end_date, location, description):

        raw = self.q.execute(
            ".web.profile.addExperience",
            company, title, start_date, end_date, location, description
        )

        return self._parse(raw)

    def remove_experience(self, entry_id):

        return self._parse(self.q.execute(".web.profile.removeExperience", entry_id))

    def add_education(self, school, degree, start_date, end_date):

        raw = self.q.execute(".web.profile.addEducation", school, degree, start_date, end_date)

        return self._parse(raw)

    def remove_education(self, entry_id):

        return self._parse(self.q.execute(".web.profile.removeEducation", entry_id))

    def add_link(self, label, url):

        return self._parse(self.q.execute(".web.profile.addLink", label, url))

    def remove_link(self, entry_id):

        return self._parse(self.q.execute(".web.profile.removeLink", entry_id))

    def add_skill(self, skill):

        return self._parse(self.q.execute(".web.profile.addSkill", skill))

    def remove_skill(self, entry_id):

        return self._parse(self.q.execute(".web.profile.removeSkill", entry_id))