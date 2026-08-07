.solutions.flags.easy.part1: (!) . flip raze 2 cut
    (
    (`invertZerosAfterFirstOne;
        enlist 0 0 1 1 1 1 1b);
    (`invertOnesAfterFirstOne;
        enlist 0 0 1 0 0 0b);
    (`invertZerosAfterFirstZero;
        enlist 1 0 1 1 1 1b);
    (`invertOnesAfterFirstZero;
        enlist 1 1 0 0 0 0 0b);
    (`smearOnesBetweenPairs;
        enlist 0 1 1 1 1 0 1 1 1 0 1 1 0b);
    (`invertFieldsBetweenPairs;
        enlist 0 1 0 0 0 0 1 1 0b);
    (`invertAllButFirstInGroup;
        enlist 0 0 1 0 0 0 1 0 0 1b);
    (`insertZeroAfterIndexes;
        enlist 1 1 0 1 1 0 1 1 1 1 0 1 1);
    (`zeroAllItems;
        enlist 11#0);
    (`flagsAtIndexes;
        enlist 00010001010000b);
    (`vectorLengthOnesAtIndexes;
        enlist 0101000100b);
    (`vectorLengthZerosAtIndexes;
        enlist 1010111011b);
    (`onesFollowedByZeros;
        enlist 111110000b);
    (`zerosFollowedByOnes;
        enlist 000111111b);
    (`onesPrecededByZeros;
        enlist 000000111b);
    (`zerosPrecededByOnes;
        enlist 111100000b);
    (`interlaceRuns;
        enlist 1 0 0 1 1 1 0 0 0 0);
    (`alternateRuns;
        enlist 1 0 0 1 1 1 0 0 0 0 1 1 1 1 1);
    (`flagPositiveIntegers;
        enlist 0011111b);
    (`countOnes;
        enlist 4);
    (`lengthsOfGroupsOfOnes;
        enlist 3 4 1);
    (`firstOne;
        enlist 2);
    (`firstOneAfterIndex;
        enlist 4);
    (`ythOne;
        enlist 4);
    (`allFlagsMixed;
        enlist 0b);
    (`allFlagsAllOnes;
        enlist 1b);
    (`allFlagsAllZeros;
        enlist 0b);
    (`anyFlagsTrue;
        enlist 1b);
    (`anyFlagsFalse;
        enlist 0b);
    (`noneFlagsTrue;
        enlist 1b);
    (`noneFlagsMixed;
        enlist 0b);
    (`implies;
        enlist 1011b);
    (`butNot;
        enlist 0100b);
    (`exclusiveOr;
        enlist 0110b);
    (`kroneckerDelta;
        enlist 1001b);
    (`simpleParity;
        enlist 0 1 1 0 1 0 0 1);
    (`runningParity;
        enlist 0 1 0 1 0 0 1 1 1);
    (`firstGroupOfOnes;
        enlist 0 0 0 1 1 0 0b);
    (`firstOnesInGroups;
        enlist 0100100001b);
    (`lastOnesInGroups;
        enlist 0010001001b);
    (`selectItemsFlagged;
        enlist (1 4 5 8 9 12;13 16 17 20 21 24))
    );

.solutions.flags.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.solutions.flags.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );