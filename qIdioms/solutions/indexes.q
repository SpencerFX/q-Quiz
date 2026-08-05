.solutions.indexes.easy: (!) . flip raze 2 cut
    (
    (`allIndexesOfVector;
        enlist til 10);
    (`yWideSublists;
        enlist (0 1 2;1 2 3;2 3 4;3 4 5));
    (`sublistsOfLengthStartingAt;
        enlist (4 5 6;5 6 7;6 7 8;7 8 9;8 9 10));
    (`allPairsOfTil;
        enlist (0 0 0 0 1 1 1 1 2 2 2 2;0 1 2 3 0 1 2 3 0 1 2 3));
    (`indexesOfArray;
        enlist
            (0 0 0 0 0 0 1 1 1 1 1 1;
             0 0 1 1 2 2 0 0 1 1 2 2;
             0 1 0 1 0 1 0 1 0 1 0 1));
    (`scatteredIndexing;
        enlist "atw");
    (`raveledIndexFromGeneralIndex;
        enlist 19);
    (`indexArbitraryRankArray;
        enlist
            (60 61 62 63 64;
             65 66 67 68 69;
             70 71 72 73 74;
             75 76 77 78 79;
             80 81 82 83 84;
             85 86 87 88 89;
             90 91 92 93 94;
             95 96 97 98 99;
             100 101 102 103 104;
             105 106 107 108 109;
             110 111 112 113 114;
             115 116 117 118 119))
    );

.solutions.indexes.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.solutions.indexes.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );