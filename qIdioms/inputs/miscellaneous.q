.inputs.miscellaneous.easy: (!) . flip raze 2 cut
    (
    (`zeroItemsNotFlagged;((3 7 15 1 292);1 0 1 1 0));
    (`zeroItemsIn;((4 0 2 1 2 1);2 3 2 5 4));
    (`zeroItemsNotIn;((2 3 4 5 6 7 8 9 10 11);2 3 5 7 11));
    (`replaceFlaggedWithOne;((0 1 0 1 1);10 5 7 12 20f));
    (`replaceFlaggedWithValue;((1 0 0 0 1 0 1 1 0 1);"abcdefghij";" "));
    (`replaceValue;("ddaeecadbbcbedc";"d "));
    (`replaceFirstItem;("abbccdefcdab";"t"));
    (`replaceLastItem;("abbccdefcdab";"t"));
    (`limitBetween;(30;70;(12 10 1 90 73 90;43 90 84 63 93 54;38 97 88 58 68 45;2 39 64 49 82 40;88 77 30 17 23 12)));
    (`changeSignWhereOne;((0 1 0 1 1 0);1 2 3 4 5 6));
    (`applyOverAll;(+;2 3 4#1+til 24));
    (`countOccurrences;(7;6 4 7 7 6 6 4));
    (`countBetweenEndpoints;(10;80;66 8 6 4 86 82 91 52 53 89 43 0 62 3 17 0 26 80 2 12 37 41 41 72 10));
    (`cyclicCounter;(10;8));
    (`insert;(1 2 3;10*1+til 7;3));
    (`insertRow;(13 14 15;4 3#1+til 12;2));
    (`moveIntoFirstQuadrant;enlist (1 6 4;3 4 7;7 8 6));
    (`roll;(7;3 5));
    (`deal;(8;6));
    (`randomArrayBetween;(4 9;3 4));
    (`remove;("abcdeabc";"ad"));
    (`removeEveryNth;(3;1+til 13));
    (`removeEverySecond;enlist "abcdefghijklmn");
    (`removeLeadingTrailing;((0 0 1 2 0 0 3 4 0 5 0 0 0);0));
    (`distinctItems;enlist "wirlsisl");
    (`rightToLeftScan;enlist 1 2 3 4 5);
    (`selectWhereZero;((0 7 8 0 2);10 4 6 7 3));
    (`selectBySign;enlist -4.5 0 6.78);
    (`selectEveryNth;((4+til 10);3));
    (`itemsDivisibleBy;(95 33 64 10 78 1 47 20 92 95;4));
    (`selectByIndex;(1775;1564 1608 1667 1775 1795 1812;("William Shakespeare";"John Milton";"Jonathan Swift";"Jane Austen";"John Keats";"Charles Dickens")));
    (`selectXorY;(`hot`white`short`old;`cold`black`tall`young;1 0 0 1));
    (`selectionByEncodedList;enlist 1 0 1);
    (`dropFirstSuffixZero;enlist 3 4 5 6);
    (`dropLastPrefixZero;enlist 3 4 5 6);
    (`shiftRight;(1+til 12;3));
    (`shiftLeft;(1+til 12;3));
    (`rotateRowsLeft;enlist 3 4#1+til 12);
    (`rotateRowsRight;enlist 3 4#1+til 12);
    (`streakSameSign;enlist 2 3 4 -2 -7 1 4 2);
    (`sumByOrderedCodes;(`e`c`b`b`b`a`c`e`e`a`e`c`c`b`e`c`b`a`e`a;12 40 10 1 26 9 26 43 26 37 20 29 38 33 24 37 4 45 41 2;"abcde"))
    );

.inputs.miscellaneous.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.inputs.miscellaneous.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );