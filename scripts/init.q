//=============================================================
// .quiz.init
//
// Initialise q-Quiz
//=============================================================
.quiz.init:{
    -1 "";
    -1 "======================================";
    -1 " Initialising q-Quiz";
    -1 "======================================";
    .quiz.current:`$();
    .quiz.history:([]
        question:`symbol$();
        input:`symbol$();
        correct:`symbol$();
        result:`boolean$()
    );
    .quiz.loadBanks[];
    quizBankList: key hsym `$"./banks/";
    .quiz.bankEasy: raze value each {` sv `.quiz,x,y}[;`easy]each quizBankList;
    .quiz.bankMedium: raze value each {` sv `.quiz,x,y}[;`medium]each quizBankList;
    .quiz.bankHard: raze value each {` sv `.quiz,x,y}[;`hard]each quizBankList;
    .quiz.bank:.quiz.bankEasy,.quiz.bankMedium,.quiz.bankHard;
    .quiz.shuffleAll each key .quiz.bank;
    -1 "";
    system "l ./scripts/quiz.q";
    -1 "Loaded.";
 };


.quiz.loadBanks:{
    listOfDirs:key hsym `$"./banks/";
    {system"l ./banks/",(string x),"/easy.q"}each listOfDirs;
    {system"l ./banks/",(string x),"/medium.q"}each listOfDirs;
    {system"l ./banks/",(string x),"/hard.q"}each listOfDirs;
 };


.quiz.shuffleQuestion:{[question]
    letters:`a`b`c`d;
    perm:(til 4) iasc 4?1f;
    answers:value question`answers;
    idx:first where letters=question`correct;
    question[`answers]:letters!answers perm;
    question[`correct]:letters perm?idx;
    question
 };


.quiz.shuffleAll:{[question]
  @[`.quiz.bank; question; :; .quiz.shuffleQuestion[.quiz.bank question]];
 };


.quiz.init[]