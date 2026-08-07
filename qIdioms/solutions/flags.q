.solutions.flags.easy.part1: (!) . flip raze 2 cut
    (
    (`invertZerosAfterFirstOne;
         0 0 1 1 1 1 1b);
    (`invertOnesAfterFirstOne;
         0 0 1 0 0 0b);
    (`invertZerosAfterFirstZero;
         1 0 1 1 1 1b);
    (`invertOnesAfterFirstZero;
         1 1 0 0 0 0 0b);
    (`smearOnesBetweenPairs;
         0 1 1 1 1 0 1 1 1 0 1 1 0b);
    (`invertFieldsBetweenPairs;
         0 1 0 0 0 0 1 1 0b);
    (`invertAllButFirstInGroup;
         0 0 1 0 0 0 1 0 0 1b);
    (`insertZeroAfterIndexes;
         1 1 0 1 1 0 1 1 1 1 0 1 1);
    (`zeroAllItems;
         11#0);
    (`flagsAtIndexes;
         00010001010000b);
    (`vectorLengthOnesAtIndexes;
         0101000100b);
    (`vectorLengthZerosAtIndexes;
         1010111011b);
    (`onesFollowedByZeros;
         111110000b);
    (`zerosFollowedByOnes;
         000111111b);
    (`onesPrecededByZeros;
         000000111b);
    (`zerosPrecededByOnes;
         111100000b);
    (`interlaceRuns;
         1 0 0 1 1 1 0 0 0 0);
    (`alternateRuns;
         1 0 0 1 1 1 0 0 0 0 1 1 1 1 1);
    (`flagPositiveIntegers;
         0011111b);
    (`countOnes;
         enlist 4);
    (`lengthsOfGroupsOfOnes;
         3 4 1);
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
         1011b);
    (`butNot;
         0100b);
    (`exclusiveOr;
         0110b);
    (`kroneckerDelta;
         1001b);
    (`simpleParity;
         0 1 1 0 1 0 0 1);
    (`runningParity;
         0 1 0 1 0 0 1 1 1);
    (`firstGroupOfOnes;
         0 0 0 1 1 0 0b);
    (`firstOnesInGroups;
         0100100001b);
    (`lastOnesInGroups;
         0010001001b);
    (`selectItemsFlagged;
         (1 4 5 8 9 12;13 16 17 20 21 24))
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