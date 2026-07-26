.quiz.history:([]
    question:`symbol$();
    input:`symbol$();
    correct:`symbol$();
    result:`boolean$()
 );


.quiz.ask:{[name]
    quizBank:.quiz.bankEasy,.quiz.bankMedium,.quiz.bankHard;
    .quiz.bank:quizBank;
    / Validate question exists
    if[not name in key quizBank;
        '"Unknown question"];
    / Store active question
    .quiz.current:name;
    / Retrieve question
    q:quizBank[name];
    / Display
    -1 "";
    /-1 "Question: ",string name;
    -1 "";
    -1 q`question;
    -1 "";
    answers:q`answers;
    -1 "a) ",answers`a;
    -1 "b) ",answers`b;
    -1 "c) ",answers`c;
    -1 "d) ",answers`d;
    / Return the question name
    /name
 };


.quiz.answer:{[choice]
    quizBank:.quiz.bankEasy,.quiz.bankMedium,.quiz.bankHard;
    .quiz.bank:quizBank;
    / Make sure a question is active
    if[null .quiz.current;
        '"No active question"];
    / Validate the answer
    if[not choice in `a`b`c`d;
        '"Answer must be one of `a, `b, `c or `d"];
    q:quizBank .quiz.current;
    correct:q`correct;
    / Record the answer
    insert[`.quiz.history;
        (.quiz.current;
         choice;
         correct;
         choice=correct)];
    / Display result
    if[choice=correct;
        -1 "Correct!";
        .quiz.current:`$();
        :()];
    -1 "Incorrect.";
    -1 "Correct answer: ",string correct;
    .quiz.current:`$();
 };


.quiz.results:{[]
    h:.quiz.history;
    if[0=count h;
        :h];
    update runningCorrect:sums result, questionNo:1+til count h, percentCorrect:100f*(sums result)%(1+til count h) from h
 };


.quiz.next:{[bank]
    if[null bank;
        bank:.quiz.bank
    ];
    questions:key bank;
    answered:.quiz.history`question;
    remaining:questions except answered;
    if[0=count remaining;
        '"No unanswered questions remain."
    ];
    first 1?remaining
 };