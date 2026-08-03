.inputs.indexes.easy: (!) . flip raze 2 cut
    (
    (`allIndexesOfVector; enlist 10?.Q.a);
    (`yWideSublists; (6;3));
    (`sublistsOfLengthStartingAt; (4+til 5;3));
    (`allPairsOfTil; (3;4));
    (`indexesOfArray; enlist 2 3 2#til 12);
    (`scatteredIndexing; (2 3 4#.Q.a;(0 0 0;1 1 3;1 2 2)));
    (`raveledIndexFromGeneralIndex; (2 3 4;1 1 3));
    (`indexArbitraryRankArray; (2 3 4 5#til 120;enlist 1))
    );

.inputs.indexes.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.inputs.indexes.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );