import pytest


# (list endpoint, a problem name known to exist in it, info endpoint template)
LIST_ENDPOINTS = [
    pytest.param("/api/problems", "appleAndOrange", "/api/problems/{}/info", id="hackerrank"),
    pytest.param("/api/aquaq", "challenge4", "/api/aquaq/{}/info", id="aquaq"),
    pytest.param("/api/leetcode", "twoSum", "/api/leetcode/{}/info", id="leetcode"),
    pytest.param("/api/quantrank", "noWomenAtTableA", "/api/quantrank/{}/info", id="quantrank"),
    pytest.param("/api/fundamentals", "unaryPlus", "/api/fundamentals/{}/info", id="fundamentals"),
    pytest.param("/api/euler", "problem0002", "/api/euler/{}/info", id="euler"),
    pytest.param("/api/adventOfCode", "day01", "/api/adventOfCode/{}/info", id="adventOfCode"),
]


@pytest.mark.parametrize("list_endpoint,known_problem,info_template", LIST_ENDPOINTS)
def test_list_endpoint_contains_known_problem(client, list_endpoint, known_problem, info_template):

    response = client.get(list_endpoint)

    assert response.status_code == 200

    problems = response.get_json()

    assert len(problems) > 0

    names = [p["problem"] for p in problems]

    assert known_problem in names

    for p in problems:
        assert set(p.keys()) >= {"problem", "area", "difficulty", "status"}
        assert p["status"] in ("solved", "attempted", "unattempted")


@pytest.mark.parametrize("list_endpoint,known_problem,info_template", LIST_ENDPOINTS)
def test_info_endpoint_returns_nonempty_text(client, list_endpoint, known_problem, info_template):

    response = client.get(info_template.format(known_problem))

    assert response.status_code == 200

    info = response.get_json()["info"]

    assert isinstance(info, str) and len(info.strip()) > 0


def test_euler_list_has_all_eight_problems(client):

    problems = client.get("/api/euler").get_json()

    names = {p["problem"] for p in problems}

    assert names == {"problem000%d" % n for n in range(1, 9)}


def test_advent_of_code_list_has_all_eight_problems(client):

    problems = client.get("/api/adventOfCode").get_json()

    names = {p["problem"] for p in problems}

    assert names == {"day0%d" % n for n in range(1, 9)}
