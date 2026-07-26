//====================================================================
//
// q-Quiz
//
// API Layer
//
// Version 1
//
// The Python dashboard communicates ONLY through these functions.
//
//====================================================================



//====================================================================
//
// Start a New Quiz
//
// Example:
//
// .quiz.api.new[.quiz.bankEasy]
//
//====================================================================
.quiz.api.new:{[bank]

    .quiz.bank:bank;

    .quiz.reset[];

    .quiz.api.state[]

 };



//====================================================================
//
// Return the Next Question
//
//====================================================================
.quiz.api.next:{

    .quiz.ask[];

    q:.quiz.current;

    `id`question`answers!(
        first key enlist .quiz.current;
        q`question;
        q`answers
    )

 };



//====================================================================
//
// Submit an Answer
//
//====================================================================
.quiz.api.answer:{[answer]

    correct:.quiz.answer answer;

    `correct`state!(
        correct;
        .quiz.api.state[]
    )

 };



//====================================================================
//
// Current Dashboard State
//
//====================================================================
.quiz.api.state:{

    answered:count .quiz.history;

    correct:sum .quiz.history`result;

    total:count key .quiz.bank;

    remaining:total-answered;

    accuracy:100f*correct%$[answered=0;1;answered];

    finished:remaining=0;

    `answered`correct`remaining`total`accuracy`finished!(
        answered;
        correct;
        remaining;
        total;
        accuracy;
        finished
    )

 };



//====================================================================
//
// Current Question
//
//====================================================================
.quiz.api.question:{

    :.quiz.current

 };



//====================================================================
//
// Reset Quiz
//
//====================================================================
.quiz.api.reset:{

    .quiz.reset[];


 };



//====================================================================
//
// Version
//
//====================================================================
.quiz.api.version:{

    `name`version!(
        "q-Quiz";
        "1.0.0"
    )

 };