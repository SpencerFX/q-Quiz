def test_leaderboard_always_returns_ten_rows(client):

    response = client.get("/api/leaderboard")

    assert response.status_code == 200

    entries = response.get_json()

    assert len(entries) == 10

    assert [e["place"] for e in entries] == list(range(1, 11))


def test_leaderboard_padding_rows_have_blank_handle_and_zero_stats(client):

    entries = client.get("/api/leaderboard").get_json()

    for e in entries:

        if e["handle"] == "":
            assert e["score"] == 0
            assert e["solved"] == 0
            assert e["accuracy"] == 0.0


def test_leaderboard_is_sorted_by_score_descending(client):

    entries = client.get("/api/leaderboard").get_json()

    scores = [e["score"] for e in entries]

    assert scores == sorted(scores, reverse=True)


def test_signed_in_submission_is_attributed_on_leaderboard(client):

    client.post("/login", data={"handle": "LeaderboardTestUser"})

    # A pass here isn't required for leaderboard attribution (score counts
    # correct submissions specifically), so submit the known-correct
    # constant answer from test_judge_sections' euler-problem0002 case.
    client.post("/api/euler/problem0002/submit", json={"code": "{[xs] 4613732}"})

    client.get("/logout")

    entries = client.get("/api/leaderboard").get_json()

    handles = [e["handle"] for e in entries]

    assert "LeaderboardTestUser" in handles

    row = next(e for e in entries if e["handle"] == "LeaderboardTestUser")

    assert row["score"] >= 1


def test_results_history_reflects_recorded_answers(client):

    # /api/history is scoped to whoever's signed in (empty for
    # anonymous requests), so this needs a session to see its own row.
    client.post("/login", data={"handle": "ResultsHistoryTestUser"})

    client.get("/api/question")

    client.post("/api/answer", json={"answer": "a"})

    history = client.get("/api/history").get_json()

    assert len(history) >= 1

    for row in history:
        assert isinstance(row["correct"], bool)
        assert isinstance(row["percentCorrect"], float)


def test_completion_endpoint_covers_every_section(client):

    rates = client.get("/api/completion").get_json()

    types = {r["questionType"] for r in rates}

    assert types == {
        "MultipleChoice", "MultipleChoiceSyntax", "HackerRank", "Idioms",
        "DiChallenge", "Leetcode", "QuantRank", "Fundamentals", "Euler",
        "AdventOfCode"
    }

    for r in rates:
        assert r["total"] > 0
        assert 0.0 <= r["pct"] <= 100.0
