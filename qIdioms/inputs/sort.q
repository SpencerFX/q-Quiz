.inputs.sort.easy: (!) . flip raze 2 cut
    (
    (`ordinalRankingDistinct;enlist 15 16 13 18 15 12 13);
    (`ordinalRankingShareable;enlist 11 17 12 13 13 13 13 18);
    (`chooseGradingDirection;enlist 66 36 37 44 28 20 30 34 77 61);
    (`gradeUpAccordingToKey;("fig lime";" abcdefghijklmn"));
    (`playingOrder;("agtdepxrmb";6));
    (`sortAscending;enlist "quick brown fox");
    (`sortDescending;enlist "quick brown fox");
    (`sortRows;enlist (6 3 3 9 7;9 4 7 8 9;9 4 4 7 9));
    (`sortStrings;enlist ("scion";"icons";"coins"));
    (`sortYOnX;((9 2 3 1 9 3);7 8 17 11 16 6));
    (`sortRowsOnColumn;((5 6#30?100);2));
    (`sortIndexesByData;((2 3 4 5 0 1 8 7 6);79 74 78 76 77 75 73 72 71));
    (`moveFlaggedToStart;("mjinase";0100110b));
    (`moveBlanksToEnd;enlist " sign if i cant ");
    (`classifyByRank;((4);20?100));
    (`classOfThresholds;((87 9 931 7 27 92 654 1416 7 911);0 50 100 1000));
    (`assignWidthClasses;((32 56 36 48 36 24 28 44 52 32);4;10;10));
    (`meshThreeLists;("abcd";"123456789";"zz";1 0 1 1 2 1 2 1 1 0 1 0 1 0 1));
    (`mergeByFlags;((5 9 8 7 4 3);10 20 30 40;1 0 1 1 0 0 1 0 1 1));
    (`mergeAlternating;((1 3 5 7);2 4 6 8));
    (`rippleShuffle;enlist til 52)
    );

.inputs.sort.medium: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );

.inputs.sort.hard: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );