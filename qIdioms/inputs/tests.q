.inputs.tests.easy: (!) . flip raze 2 cut
    (
    (`rangesMatch;((1 2 3);3 1 2 1));
    (`quickMembership;((5 3 7 2);8 5 2 6 1 9));
    (`itemsInCommon;("abc";"cdeac"));
    (`subset;("abgk";"abcdefghijkl"));
    (`matchNested;(("abc";`sy;1 3 -7);("abc";`sy;1 3 -7)));
    (`pairwiseMatch;enlist ("123";"123";"45";"45"));
    (`permutation;((15 16 13 18 14 11 12);15 16 13 14 18 12 11));
    (`matrixSymmetric;enlist (0 4 7 1;4 8 6 4;7 6 2 0;1 4 0 6));
    (`matrixAntiSymmetric;enlist (0 -7 1;7 0 -4;-1 4 0));
    (`rowMembership;(("aaa";"bbb";"ooo";"ppp";"kkk");"ooo"));
    (`integralItems;enlist 67 -120 3.83 -5.5);
    (`evenItems;enlist 1 2 3 4 5);
    (`rangeOne;enlist 1 1 1 1 1);
    (`binaryItems;enlist 1 0 1);
    (`intervalInclusiveExclusive;((19 20 21 39 40 41);20 40));
    (`ascendingOrder;enlist 0 1 1 1 7 8 9);
    (`uniqueItems;enlist "abcdefg");
    (`permutationRank;enlist 4 0 2 1 5 3 6);
    (`singleAtomCount;enlist 35);
    (`isVector;enlist 1 2);
    (`isEmpty;enlist "")
    );

.inputs.tests.medium: (!) . flip raze 2 cut
    (
    (`matrixUpperTriangular;enlist (1 0 0 1;0 2 1 0;0 0 1 2;0 0 0 0));
    (`matrixLowerTriangular;enlist (1 0 0 0;0 2 0 0;0 1 1 0;1 0 2 0));
    (`integerInterval;((3 5 6 7.5 11 12 13);6 12));
    (`intervalPairsClosedOpen;(9;(1 9;9 16;5 7;10 20;6 10)));
    (`intervalPairsOpenClosed;(9;(1 9;9 16;5 7;10 20;6 10)));
    (`adjacentDifference;enlist "ceefffmeksc");
    (`vectorCheck;enlist (2 3#til 6));
    (`atomCountNested;enlist 1 1#35)
    );

.inputs.tests.hard: (!) . flip raze 2 cut
    (
    (`nestedMatch;
        (
        ("abc";`sy;1 3 -7;("x";1 2));
        ("abc";`sy;1 3 -7;("x";1 2))
        )
    );
    (`deepPermutation;
        (
        99?99;
        reverse 99?99
        )
    );
    (`largeAscending;enlist asc 1000?10000);
    (`largeUnique;enlist distinct 2000?5000);
    (`largeBinary;enlist 1000?0b 1b);
    (`largeSymmetricMatrix;
        enlist {
            m:x x#x*x?100;
            m|flip m
        }[25]
    )
    );