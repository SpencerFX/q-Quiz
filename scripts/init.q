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
        result:`boolean$();
        user:`symbol$()
    );
    / Whoever is signed in on the Flask session at the moment a result is
    / recorded - null symbol when nobody's signed in. Set by
    / .web.setCurrentUser (web/q/web_api.q), which web/qclient.py calls
    / before every request so this stays in sync with the session even
    / across q restarts. Defined here (not in web_api.q) so it always
    / exists, since console-only checker.q insert calls reference it too
    / and web_api.q only loads lazily on Flask's first request.
    .web.currentUser:`;
    .web.setCurrentUser:{[u] .web.currentUser:$[0=count u; `; `$u] };
    .quiz.loadBanks[];
    .quiz.loadBanksSyntax[];
    .quiz.loadBanksDebug[];
    .quiz.shuffleBank each key .quiz.bank;
    -1 "";
    system "l ./scripts/quiz.q";
    system "l ./hackerRank/scripts/init.q";
    system "l ./qIdioms/scripts/init.q";
    system "l ./diChallenges/scripts/init.q";
    system "l ./leetcode/scripts/init.q";
    system "l ./quantRank/scripts/init.q";
    system "l ./jobs/jobs.q";
    system "l ./fundamentals/scripts/init.q";
    system "l ./lisp99/scripts/init.q";
    system "l ./euler/scripts/init.q";
    system "l ./adventOfCode/scripts/init.q";
    initHackerRank[];
    initQIdioms[];
    initDiChallenges[];
    initLeetcode[];
    initQuantRank[];
    initFundamentals[];
    initLisp99[];
    initEuler[];
    initAdventOfCode[];
    .quiz.loadResults[];
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


.quiz.loadBanksDebug:{
    listOfDirs:key hsym `$"./banksDebug/";
    {system"l ./banksDebug/",(string x),"/easy.q"}each listOfDirs;
    {system"l ./banksDebug/",(string x),"/medium.q"}each listOfDirs;
    {system"l ./banksDebug/",(string x),"/hard.q"}each listOfDirs;
    banks:key hsym `$"./banksDebug/";
    .quiz.bankDebugEasy: raze value each {` sv `.quiz,x,y}[;`easy]each banks;
    .quiz.bankDebugMedium: raze value each {` sv `.quiz,x,y}[;`medium]each banks;
    .quiz.bankDebugHard: raze value each {` sv `.quiz,x,y}[;`hard]each banks;
    .quiz.bankDebug:.quiz.bankDebugEasy,.quiz.bankDebugMedium,.quiz.bankDebugHard;
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

/ Both defaults to ./results/tab, but honor Q_RESULTS_PATH when set so a
/ q process started for something other than normal dev/prod use (eg
/ web/tests/conftest.py's isolated test q process) can point at its own
/ file instead. Without this, every q process launched from this repo's
/ root - dev, prod, and every past test run alike - has always resolved
/ the exact same bare relative path, so a live dev/prod .quiz.save[]
/ call silently leaks real history into what's supposed to be an
/ isolated test database the next time it boots (found via a
/ completed>total assertion failure caused by exactly that).
.quiz.resultsPath:{[]
    p:getenv `Q_RESULTS_PATH;
    $[0=count p; `:./results/tab; hsym `$p]
 };

.quiz.loadResults:{[]
    / get (not load) - load's return value is only the *symbol name* of
    / the global variable it populates (matching the file's own base
    / name), not the loaded data itself, so a naive "tab:load x" here
    / would just shadow the real loaded table with the symbol `tab`
    / (count 1, an atom) instead of the actual rows - a genuinely
    / surprising q gotcha, caught by the completion percentage math
    / going wrong once this file started routing through a non-default
    / Q_RESULTS_PATH. get reads the value directly with no such
    / filename/variable-name coupling, so it works for any path.
    /
    / Protected rather than a pre-check for the file's existence: a
    / fresh Q_RESULTS_PATH (nothing has saved to it yet) or a genuinely
    / first-ever checkout has no such file, and get throws on that.
    @[{.quiz.history:.quiz.upgradeResultsSchema get x}; .quiz.resultsPath[]; {}];
 };

/ Older saved files predate the user column - backfill it with null
/ symbols rather than dropping straight into a 6-column insert schema
/ mismatch the moment anything new gets recorded.
.quiz.upgradeResultsSchema:{[tab]
    $[`user in cols tab; tab; update user:(count tab)#` from tab]
 };

.quiz.save:{[]
    .quiz.resultsPath[] set .quiz.history;
 };

.quiz.init[]