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
    /.quiz.loadBanksSyntax[];
    .quiz.shuffleBank each key .quiz.bank;
    -1 "";
    system "l ./scripts/quiz.q";
    system "l ./hackerRank/scripts/init.q";
    initHackerRank[];
    -1 "Loaded.";
 };


.quiz.loadBanks:{
    listOfDirs:key hsym `$"./banks/";
    {system"l ./banks/",(string x),"/easy.q"}each listOfDirs;
    {system"l ./banks/",(string x),"/medium.q"}each listOfDirs;
    {system"l ./banks/",(string x),"/hard.q"}each listOfDirs;
    banks:key hsym `$"./banks/";
    .quiz.bankEasy: raze value each {` sv `.quiz,x,y}[;`easy]each banks;
    .quiz.bankMedium: raze value each {` sv `.quiz,x,y}[;`medium]each banks;
    .quiz.bankHard: raze value each {` sv `.quiz,x,y}[;`hard]each banks;
    .quiz.bank:.quiz.bankEasy,.quiz.bankMedium,.quiz.bankHard;
 };


.quiz.loadBanksSyntax:{
    listOfDirs:key hsym `$"./banksSyntax/";
    {system"l ./banksSyntax/",(string x),"/easy.q"}each listOfDirs;
    {system"l ./banksSyntax/",(string x),"/medium.q"}each listOfDirs;
    {system"l ./banksSyntax/",(string x),"/hard.q"}each listOfDirs;
    banks:key hsym `$"./banksSyntax/";
    .quiz.bankSyntaxEasy: raze value each {` sv `.quiz,x,y}[;`easy]each banks;
    .quiz.bankSyntaxMedium: raze value each {` sv `.quiz,x,y}[;`medium]each banks;
    .quiz.bankSyntaxHard: raze value each {` sv `.quiz,x,y}[;`hard]each banks;
    .quiz.bankSyntax:.quiz.bankSyntaxEasy,.quiz.bankSyntaxMedium,.quiz.bankSyntaxHard;
 };


.quiz.shuffleQuestion:{[question]
    letters:`a`b`c`d;
    answers:value question`answers;
    correct:question`correct;
    idx:first where letters=correct;
    perm:-4?4;
    shuffled:answers perm;
    newIdx:first where perm=idx;
    `question`answers`correct!(
        question`question;
        letters!shuffled;
        letters newIdx
    )
 };


.quiz.shuffleBank:{[question]
    @[`.quiz.bank; question; :; .quiz.shuffleQuestion[.quiz.bank question]];
 };


.quiz.init[]