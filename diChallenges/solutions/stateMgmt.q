//====================================================================
// diChallenges — stateMgmt solutions
//
// Expected output per challenge, verified by running each challenge's
// own reference solution against its wired input in
// diChallenges/Inputs/inputs.q (.inputs.diChallenges.easy).
//====================================================================

.solutions.diChallenges.stateMgmt:
    `challenge5`challenge8`challenge17`challenge19`challenge20!(
        5;                                       / sumMatchingIndices
        1500f;                                   / solve
        "Somaliland 19000103 19020101";          / findLongestShame - not yet wired into .inputs.diChallenges.easy; verified against the example table in challenge17.q's own comments
        8;                                       / sumAliveAcrossInputs - not yet wired into .inputs.diChallenges.easy; verified against the example in challenge19.q's own comments (enlist 350 6 2 2 2 3)
        1                                        / countWins - not yet wired into .inputs.diChallenges.easy; verified against the example in challenge20.q's own comments
    );
