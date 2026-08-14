//====================================================================
// diChallenges — permutation solutions
//
// Expected output per challenge, verified by running each challenge's
// own reference solution against its wired input in
// diChallenges/Inputs/inputs.q (.inputs.diChallenges.easy).
//
// Only one challenge lives under this kind so far. Written as a plain
// dict literal rather than the "(!) . flip raze 2 cut" idiom used
// elsewhere in this repo - that idiom mis-groups when the outer list
// has only one pair (see hackerRank/Inputs/extraCases.q for the same
// issue hit earlier).
//====================================================================

.solutions.diChallenges.permutation:
    enlist[`challenge6]!enlist 9;    / sumOnesForN
