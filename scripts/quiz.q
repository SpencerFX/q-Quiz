.quiz.history:([]
    question:`symbol$();
    input:`symbol$();
    correct:`symbol$();
    result:`boolean$();
    questionType:`symbol$()
 );

/ Which multiple-choice bank is currently active - MultipleChoice
/ (.quiz.bank/.quiz.bankSyntax swap in place, see .web.setQuizMode in
/ web/q/web_api.q) or MultipleChoiceSyntax. Tags .quiz.history rows so
/ progress/remaining-question tracking stays scoped to whichever bank
/ is live, instead of the two banks' answered questions bleeding into
/ each other.
.quiz.currentType:`MultipleChoice;


.quiz.ask:{[name]
    quizBank:.quiz.bank;
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
    quizBank:.quiz.bank;
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
         choice=correct;
         .quiz.currentType)];
    / Display result
    if[choice=correct;
        -1 "Correct!";
        .quiz.current:`$();
        :()];
    -1 "Incorrect.";
    -1 "Correct answer: ",string correct;
    .quiz.current:`$();
 };


/ Maps every multiple-choice question name to the bank folder it came
/ from (eg `sortedAttribute`->`attributes for a question defined in
/ .quiz.attributes.easy), across both ./banks/ and ./banksSyntax/. Built
/ once .quiz.bank/.quiz.bankSyntax are loaded (see .quiz.init), since
/ that origin is lost once the per-bank dicts are razed together into
/ one flat bank. Question names outside these banks (HackerRank,
/ leetcode, ...) simply aren't keys here, so indexing with them below
/ falls through to a null category, same as any other dict miss.
.quiz.categoryLookup:{[dir]
    names:key hsym `$dir;
    raze {[bankName]
        qs:raze {[bankName;diff]
            @[{key value x}; ` sv `.quiz,bankName,diff; {`symbol$()}]
         }[bankName;] each `easy`medium`hard;
        qs!count[qs]#bankName
     } each names
 };

.quiz.buildQuestionCategory:{[]
    .quiz.questionCategory:.quiz.categoryLookup["./banks/"],.quiz.categoryLookup["./banksSyntax/"];
 };

.quiz.buildQuestionCategory[];


.quiz.results:{[]
    h:.quiz.history;
    if[0=count h;
        :h];
    update runningCorrect:sums result, questionNo:1+til count h, percentCorrect:100f*(sums result)%(1+til count h), category:.quiz.questionCategory question from h
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


.quiz.askIdiom:{[]
    topic:first 1?1_key .qidiom;
    questionName: first 1?key (1 _ .qidiom topic);
    questionFunc: ` sv `.qidiom,topic,questionName;
    (value questionFunc)[];
    show"questionName is ",string questionName;
    .idiom.questName:questionName;
 };


.quiz.answerIdiom:{[func]
    checkIdiom[.idiom.questName;func]
 };


.quiz.askHackerRank:{[]
    topic:first 1?1_key .hackerRank;
    questionName: first 1?key (1 _ hackerRank topic);
    questionFunc: ` sv `.hackerRank,topic,questionName;
    (value questionFunc)[];
    show"questionName is ",string questionName;
    .hackerRank.questName:questionName;
 };


.quiz.answerHackerRank:{[func]
    checker[.hackerRank.questName;func]
 };


ask:.quiz.ask;
answer:.quiz.answer;
question:.quiz.next;
results:.quiz.results;