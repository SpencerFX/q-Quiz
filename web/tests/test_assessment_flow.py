def _run_full_assessment(client, difficulty):

    start = client.post("/api/assessment/start", json={"difficulty": difficulty})

    assert start.status_code == 200

    for _ in range(30):

        current = client.get("/api/assessment/current").get_json()

        if current.get("finished"):
            return current

        kind = current.get("kind")

        answer = list(current["answers"].keys())[0] if kind == "mc" else "{[x] x}"

        submit_response = client.post("/api/assessment/submit", json={"answer": answer})

        assert submit_response.status_code == 200

        current = submit_response.get_json()

        if current.get("finished"):
            return current

    raise AssertionError("assessment did not finish within 30 questions")


def test_easy_assessment_runs_to_completion(client):

    finished = _run_full_assessment(client, "easy")

    assert finished["finished"] is True

    assert finished["total"] == 10

    assert 0 <= finished["correct"] <= 10


def test_completed_assessment_appears_in_history_with_detail(client):

    _run_full_assessment(client, "medium")

    history = client.get("/api/assessment/history").get_json()

    assert len(history) >= 1

    latest = history[0]

    assert latest["difficulty"] == "medium"

    assert latest["total"] == 10

    detail = client.get("/api/assessment/history/" + str(latest["runId"])).get_json()

    assert len(detail) == 10

    assert {q["questionNo"] for q in detail} == set(range(1, 11))


def test_unknown_difficulty_is_a_clean_400(client):

    response = client.post("/api/assessment/start", json={"difficulty": "impossible"})

    assert response.status_code == 400

    assert "error" in response.get_json()
