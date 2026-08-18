//====================================================================
// diChallenges — stringProc solutions
//
// Expected output per challenge, verified by running each challenge's
// own reference solution against its wired input in
// diChallenges/Inputs/inputs.q (.inputs.diChallenges.easy).
//====================================================================

.solutions.diChallenges.stringProc:
    `challenge0`challenge1`challenge16!(
        enlist "r";    / decodeMessage
        "0d40fe";      / colourHex
        92i            / sumEmptySpaces - not yet wired into .inputs.diChallenges.easy; verified against the example alphabet/words in challenge16.q's own comments
    );
