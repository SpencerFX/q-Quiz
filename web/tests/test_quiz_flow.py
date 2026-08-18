def test_get_question_shape(client):

    response = client.get("/api/question")

    assert response.status_code == 200

    data = response.get_json()

    assert isinstance(data["question"], str) and data["question"]

    assert set(data["answers"].keys()) == {"a", "b", "c", "d"}

    assert isinstance(data["number"], int)


def test_answer_flow_records_a_result(client):

    client.get("/api/question")

    response = client.post("/api/answer", json={"answer": "a"})

    assert response.status_code == 200

    data = response.get_json()

    assert isinstance(data["correct"], bool)

    assert data["correctAnswer"] in ("a", "b", "c", "d")

    assert isinstance(data["finished"], bool)

    history_response = client.get("/api/history")

    history = history_response.get_json()

    assert len(history) >= 1

    assert history[-1]["questionType"] == "MultipleChoice"


def test_answer_without_active_question_is_a_clean_400(client):

    # No /api/question call first this time - .quiz.current should still
    # be whatever the previous test left it at (already answered), so this
    # exercises the "no active question" guard in .web.submitAnswer.
    client.post("/api/answer", json={"answer": "a"})

    response = client.post("/api/answer", json={"answer": "a"})

    assert response.status_code == 400

    assert "error" in response.get_json()
