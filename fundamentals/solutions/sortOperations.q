//====================================================================
// fundamentals — sortOperations solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/sortOperations.q for background, including why
// this kind is named "sortOperations" rather than "sort").
//
// Gotcha that mattered here specifically: asc's result carries the
// `s# (sorted) attribute, and the judge's normaliser (-3!-based text
// comparison, same as every other fundamentals kind) treats
// `s#1 2 5 8 9 and a bare 1 2 5 8 9 as DIFFERENT text even though ~
// (plain match) says they're equal - the attribute is part of what
// -3! prints. ascSort's expected literal is written with the `s#
// prefix for exactly that reason; verified against the judge's actual
// comparison, not just ~, before trusting it. None of the other ten
// keywords here produce an attributed result.
//
// rank's result is worth a note too: rank x gives each element's
// 0-based position in sorted order (equivalently iasc iasc x) - a
// different thing from iasc x, which gives the sort-order *indices*
// rather than each original element's own rank.
//====================================================================

.solutions.sortOperations.easy:
    `ascSort`descSort`distinctVals`differFlags!(
        `s#1 2 5 8 9;
        9 8 5 2 1;
        3 1 2;
        1010110b
    );

.solutions.sortOperations.medium:
    `iascIdx`idescIdx`rankVals`xbarRound!(
        3 1 0 2 4;
        4 2 0 1 3;
        2 1 3 0 4;
        40
    );

.solutions.sortOperations.hard:
    `binSearch`binrSearch`xrankBucket!(
        2;
        3;
        0 0 1 1 2 2
    );
