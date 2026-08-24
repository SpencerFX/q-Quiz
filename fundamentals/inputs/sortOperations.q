//====================================================================
// fundamentals — sortOperations inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Covers 11 core sort-related keywords: asc, bin, binr, desc, differ,
// distinct, iasc, idesc, rank, xbar, xrank - one question each.
//
// Named "sortOperations" rather than the more obvious "sort" - qIdioms
// already has its own, completely unrelated .inputs.sort.*/
// .solutions.sort.* (qIdioms/inputs/sort.q). Same collision risk (and
// same fix) as fundamentals/inputs/textOperations.q hit with "text" -
// checked via grep before creating anything this time.
//====================================================================

.inputs.sortOperations.easy:
    `ascSort`descSort`distinctVals`differFlags!(
        (enlist 5 2 8 1 9);
        (enlist 5 2 8 1 9);
        (enlist 3 1 2 1 3);
        (enlist 1 1 2 2 3 1 1)
    );

.inputs.sortOperations.medium:
    `iascIdx`idescIdx`rankVals`xbarRound!(
        (enlist 5 2 8 1 9);
        (enlist 5 2 8 1 9);
        (enlist 5 2 8 1 9);
        (10;47)
    );

.inputs.sortOperations.hard:
    `binSearch`binrSearch`xrankBucket!(
        (1 3 5 7 9;6);
        (1 3 5 7 9;6);
        (3;10 20 30 40 50 60)
    );
