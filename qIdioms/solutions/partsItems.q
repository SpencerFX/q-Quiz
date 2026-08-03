.solutions.partsItems.easy: (!) . flip raze 2 cut
    (
    (`vectorFromItems;enlist ("the";"quick";"brown";"fox"));
    (`itemsFromFlags;((3 4 8 2 5 6 9 4 5 4);1 1 0 0 0 1 0 0 1 1));
    (`itemsFromLengths;((3 4 8 2 5 6 9 4 5 4);1 4 3 1 1));
    (`startFlagsFromLengths;enlist 1 2 3 4 5);
    (`endFlagsFromLengths;enlist 1 2 3 4 5);
    (`startIndexesFromFlags;enlist 1 0 1 0 0 0 1 0 1 1);
    (`startIndexesFromLengths;enlist 2 3 1 5);
    (`endIndexesFromLengths;enlist 4 7 13 15 20);
    (`fieldStartIndexes;(5;3));
    (`fieldEndIndexes;(5;3));
    (`lengthsFromStartIndexes;enlist 1 0 1 0 0 1 0 0 0 1 0);
    (`reverseEachPart;("thequickbrownfox";3 5 5 3));
    (`rotateEachPart;(1 0 1 0 0 1 1 0 0 0;"abcdefghij"));
    (`applyUniformFunction;(1 1 0 0 0 1 1 0 0 1;3 4 8 2 5 6 9 4 5 4));
    (`aggregateEachPart;(1 1 0 0 0 1 1 0 0 1;3 4 8 2 5 6 9 4 5 4));
    (`maximumsOfParts;(-17 7 30 12 5 2 -5 6 -3 -19;1 1 0 1 1 0 1 1 0 1));
    (`sumsOfPartsByLengths;(1+til 10;2 3 2 3));
    (`sumsGroupedByCodes;(1 2 3 4 5 6 7;1 1 1 2 2 3 3));
    (`sumsFlaggedByStarts;(1 2 3 4 5;1 0 1 0 1));
    (`runningSumsOfParts;(1 2 3 4 5 6 7 8 9;1 0 0 0 1 0 0 0 1));
    (`maximumSumOfParts;enlist -100 2 3 4 -100 6 7 8 9 -100);
    (`findPartBeginningWith;("abcabbbaccccaddd";2));
    (`equalItemPartStarts;enlist "baackkkegtt");
    (`equalItemPartEnds;enlist "baackkkegtt");
    (`runningParityOfParts;(1 0 0 1 1 1 0 0 1 0 1 1 0 0;1 0 0 0 0 1 0 0 0 0 1 0 0 0));
    (`groupsOfOnes;(0 0 0 1 1 1 0 1 1 1 0 1 1 1 1 1;0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 1));
    (`insertZerosAfterParts;(0 0 1 0 1 0 1 1;1 2 2 1));
    (`orScanParts;(1 0 0 1 0 1 0 0;1 0 1 0 0 0 1 0));
    (`andScanParts;(1 0 0 1 0 1 0 0;1 0 1 0 0 0 1 0));
    (`gthPart;( "abcdefghijk";1 0 0 1 0 1 0 0 0 1 0;2));
    (`insertAfterEachItem;("abc";"d"));
    (`appendItemsToEach;(1 3 5;2;10));
    (`prependItemsToEach;(1 3 5;2;10));
    (`insertAfterIndexes;("abc,def,gh";where "abc,def,gh"=","));
    (`insertCopiesBeforeIndexes;("1234,234,34";0 5 9;5;"*"))
    );

.solutions.partsItems.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.solutions.partsItems.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );