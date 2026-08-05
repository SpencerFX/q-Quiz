.solutions.miscellaneous.easy: (!) . flip raze 2 cut
    (
    (`zeroItemsNotFlagged;enlist 3 0 15 1 0);
    (`zeroItemsIn;enlist 0 3 0 5 0);
    (`zeroItemsNotIn;enlist 2 3 0 5 0 7 0 0 0 11);
    (`replaceFlaggedWithOne;enlist 10 1 7 1 1f);
    (`replaceFlaggedWithValue;enlist " bcd f  i ");
    (`replaceValue;enlist "  aeeca bbcbe c");
    (`replaceFirstItem;enlist "tbbccdefcdab");
    (`replaceLastItem;enlist "abbccdefcdat");
    (`limitBetween;enlist
        (30 30 30 70 70 70;
        43 70 70 63 70 54;
        38 70 70 58 68 45;
        30 39 64 49 70 40;
        70 70 30 30 30 30));
    (`changeSignWhereOne;enlist 1 -2 3 -4 -5 6);
    (`applyOverAll;enlist 300);
    (`countOccurrences;enlist 2);
    (`countBetweenEndpoints;enlist 14);
    (`cyclicCounter;enlist 2 3 4 5 6 7 8 1 2 3);
    (`insert;enlist 10 20 30 40 1 2 3 50 60 70);
    (`insertRow;enlist
        (1 2 3;
        4 5 6;
        7 8 9;
        13 14 15;
        10 11 12));
    (`moveIntoFirstQuadrant;enlist
        (0 5 3;
        0 1 4;
        1 2 0));
    (`roll;enlist
        (6 2 1 2 2;
        4 4 6 3 0;
        6 3 4 5 1));
    (`deal;enlist 5 7 3 2 0 4);
    (`randomArrayBetween;enlist
        (4 6 8 8;
        5 8 7 7;
        4 6 5 8));
    (`remove;enlist "bcebc");
    (`removeEveryNth;enlist 4 5 7 8 10 11 13);
    (`removeEverySecond;enlist "bdfhjln");
    (`removeLeadingTrailing;enlist 1 2 0 3 4 0 5);
    (`distinctItems;enlist "wirls");
    (`rightToLeftScan;enlist 15 14 12 9 5);
    (`selectWhereZero;enlist 10 7 8 7 2);
    (`selectBySign;enlist "-0+");
    (`selectEveryNth;enlist 6 9 12);
    (`itemsDivisibleBy;enlist 64 20 92);
    (`selectByIndex;enlist "Jane Austen");
    (`selectXorY;enlist `cold`white`short`young);
    (`selectionByEncodedList;enlist "f");
    (`dropFirstSuffixZero;enlist 4 5 6 0);
    (`dropLastPrefixZero;enlist 0 3 4 5);
    (`shiftRight;enlist 0 0 0 1 2 3 4 5 6 7 8 9);
    (`shiftLeft;enlist 4 5 6 7 8 9 10 11 12 0 0 0);
    (`rotateRowsLeft;enlist
        (2 3 4 1;
        6 7 8 5;
        10 11 12 9));
    (`rotateRowsRight;enlist
        (4 1 2 3;
        8 5 6 7;
        12 9 10 11));
    (`streakSameSign;enlist 1 2 3 1 2 1 2 3);
    (`sumByOrderedCodes;enlist 93 74 170 0 166)
    );