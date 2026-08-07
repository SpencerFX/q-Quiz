.solutions.tests.easy: (!) . flip raze 2 cut
    (
    (`rangesMatch; enlist 1b);
    (`quickMembership; 1 0 0 enlist 1b);
    (`itemsInCommon; enlist 1b);
    (`subset; enlist 1b);
    (`matchNested; enlist 1b);
    (`pairwiseMatch; 1010b);
    (`permutation; enlist 1b);
    (`matrixSymmetric; enlist 1b);
    (`matrixAntiSymmetric; enlist 1b);
    (`rowMembership; enlist 1b);
    (`integralItems; 1100b);
    (`evenItems; 01010b);
    (`rangeOne; enlist 1b);
    (`binaryItems; enlist 1b);
    (`intervalInclusiveExclusive; 011100b);
    (`ascendingOrder; enlist 1b);
    (`uniqueItems; enlist 1b);
    (`permutationRank; enlist 1b);
    (`singleAtomCount; enlist 1b);
    (`isVector; enlist 1b);
    (`isEmpty; enlist 1b)
    );

.solutions.tests.medium: (!) . flip raze 2 cut
    (
    (`matrixUpperTriangular; enlist 1b);
    (`matrixLowerTriangular; enlist 1b);
    (`integerInterval; 0010100b);
    (`intervalPairsClosedOpen; 01001b);
    (`intervalPairsOpenClosed; 10001b);
    (`adjacentDifference; 1010011111b);
    (`vectorCheck; enlist 0b);
    (`atomCountNested; enlist 1b)
    );

.solutions.tests.hard: (!) . flip raze 2 cut
    (
    (`nestedMatch; enlist 1b);
    (`deepPermutation; enlist 0b);
    (`largeAscending; enlist 1b);
    (`largeUnique; enlist 1b);
    (`largeBinary; enlist 1b);
    (`largeSymmetricMatrix; enlist 1b)
    );