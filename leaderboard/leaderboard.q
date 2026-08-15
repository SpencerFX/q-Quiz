//====================================================================
// leaderboard - hypothetical/placeholder standings
//
// Fictional handles and scores (not derived from real .quiz.history
// data - this is a single-local-profile app with no multi-user
// accounts to actually rank), seeded so the Leaderboard page has
// something to display. Swap this file's contents for a real feed
// if/when the app ever supports multiple users.
//====================================================================

.leaderboard.data:([]
    place:1+til 10; / "rank" is a reserved column name in this q build - assigning to it errors ('assign)
    handle:`qMaster`VectorViper`TickCruncher`AsofJoinAce`LambdaLion`WavgWizard`KdbKid`FlipFlopFin`ParseTreePro`SymTableSam;
    score:2450 2210 1980 1875 1690 1540 1420 1310 1200 1050;
    solved:142 130 118 109 98 90 82 75 68 60;
    accuracy:88.5 91.2 85.0 93.4 79.8 87.1 90.5 82.3 94.0 76.5
 );
