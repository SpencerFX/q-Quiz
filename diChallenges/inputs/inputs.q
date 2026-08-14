/ Helper values for entries whose input is too large/structured to inline directly

challenge10Edges:({fwd:([] s:`A`B`B`D`E; d:`B`C`D`E`C; c:8 50 5 10 6); fwd,([] s:fwd`d; d:fwd`s; c:fwd`c)}[]);

challenge15Words:("fly";"fry";"try";"cry";"word";"ward";"ware";"mare";"maze");
challenge15Pairs:(("fly";"try");("try";"fly");("word";"maze"));

.inputs.diChallenges.easy: (!) . flip raze 2 cut
    (
        (`challenge0; enlist 7 3);                                            / decodeMessage
        (`challenge1; enlist "kdb4life");                                     / colourHex
        (`challenge2; enlist 1 4 3 2 4 7 2 6 3 6);                            / sumUniqueTrail
        (`challenge3; enlist "UDRR");                                         / sumPositions
        (`challenge4; enlist 15);                                             / sumCoprimes
        (`challenge5; (1;2;3;1;3;2;"LRDLU"));                                 / sumMatchingIndices
        (`challenge6; enlist 3);                                              / sumOnesForN
        (`challenge7; enlist (`a`b;`b`a;`a`b;`a`b));                          / eloDiff
        (`challenge8; (1 5!1000 1000f; enlist[1]!enlist 1000f));              / solve
        (`challenge9; enlist (2;4;8));                                        / bigProduct
        (`challenge10; (challenge10Edges; `A; `C));                           / shortestPath
        (`challenge11; enlist ((0;0;3;3);(2;2;4;5);(6;3;8;7)));               / tilesNeeded
        (`challenge12; enlist ((1;2);(0;3);(1;1);(0;1);(1;5)));               / simulate
        (`challenge13; enlist ("AAAAAAB";"AAAAAAB"));                         / sumBestCounts
        (`challenge14; enlist 4#enlist 10 5 21 45 53 70 66 4);                / sumTurnsToWin
        (`challenge15; (challenge15Words; challenge15Pairs))                  / productOfChains
    );

.inputs.diChallenges.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.inputs.diChallenges.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );
