import json

import pytest


# One representative problem per judge-backed section. Each "correct"
# submission is a constant-return lambda matching that problem's own
# precomputed expected value (not a real algorithm) - the point of these
# tests is to catch regressions in the *grading pipeline* (submit routing,
# .checker.normalise comparison, pass/fail reporting), not to re-verify
# every problem's content correctness, which was already verified live
# when each section was built. Arity matches the real problem so a
# grading-logic bug can't hide behind an arity mismatch.
SECTIONS = [
    pytest.param(
        "hackerrank", "/api/problems/appleAndOrange/submit",
        "{[a;b;c;d;e;f] 1 1}", "{[a;b;c;d;e;f] 0 0}",
        id="hackerrank-appleAndOrange"
    ),
    pytest.param(
        "aquaq", "/api/aquaq/challenge4/submit",
        "{[n] 60}", "{[n] 0}",
        id="aquaq-challenge4"
    ),
    pytest.param(
        "leetcode", "/api/leetcode/twoSum/submit",
        "{[nums;target] 0 1}", "{[nums;target] -1 -1}",
        id="leetcode-twoSum"
    ),
    pytest.param(
        "qidioms", "/api/qidioms/arithmetic.sumAVector/submit",
        "{[xs] 15}", "{[xs] 0}",
        id="qidioms-arithmetic.sumAVector"
    ),
    pytest.param(
        "quantrank", "/api/quantrank/noWomenAtTableA/submit",
        "{[a;b;c] 0.3991228}", "{[a;b;c] 0f}",
        id="quantrank-noWomenAtTableA"
    ),
    pytest.param(
        "fundamentals", "/api/fundamentals/unaryPlus/submit",
        "{[m] (1 4;2 5;3 6)}", "{[m] (0 0;0 0;0 0)}",
        id="fundamentals-unaryPlus"
    ),
    pytest.param(
        "euler", "/api/euler/problem0002/submit",
        "{[xs] 4613732}", "{[xs] 0}",
        id="euler-problem0002"
    ),
    pytest.param(
        "adventOfCode", "/api/adventOfCode/day01/submit",
        "{[lines] (1;2)}", "{[lines] (0;0)}",
        id="adventOfCode-day01"
    ),
]


@pytest.mark.parametrize("section,endpoint,correct_code,wrong_code", SECTIONS)
def test_correct_submission_passes(client, section, endpoint, correct_code, wrong_code):

    response = client.post(endpoint, json={"code": correct_code})

    assert response.status_code == 200, response.get_data(as_text=True)

    data = response.get_json()

    assert data["passed"] is True, data


@pytest.mark.parametrize("section,endpoint,correct_code,wrong_code", SECTIONS)
def test_wrong_submission_fails(client, section, endpoint, correct_code, wrong_code):

    response = client.post(endpoint, json={"code": wrong_code})

    assert response.status_code == 200, response.get_data(as_text=True)

    data = response.get_json()

    assert data["passed"] is False, data


@pytest.mark.parametrize("section,endpoint,correct_code,wrong_code", SECTIONS)
def test_unparseable_submission_is_a_clean_400(client, section, endpoint, correct_code, wrong_code):

    # A syntactically broken submission should come back as a handled
    # error response, not a 500 - regression guard for the
    # @[value;codeStr;{'"Could not parse submission: ",x}] wrapping every
    # judge function uses around the user's code.
    response = client.post(endpoint, json={"code": "{[x] this is not valid q"})

    assert response.status_code == 400

    assert "error" in response.get_json()


def test_unknown_problem_is_a_clean_400(client):

    response = client.post("/api/euler/notARealProblem/submit", json={"code": "{[xs] 1}"})

    assert response.status_code == 400

    assert "error" in response.get_json()
