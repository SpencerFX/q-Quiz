.inputs.flags.easy: (!) . flip raze 2 cut
    (
        (`invertZerosAfterFirstOne; enlist 0 0 1 0 0 1 1);
        (`invertOnesAfterFirstOne; enlist 0 0 1 1 0 1);
        (`invertZerosAfterFirstZero; enlist 1 0 0 1 1 0);
        (`invertOnesAfterFirstZero; enlist 1 1 0 1 0 1 0);
        (`smearOnesBetweenPairs; enlist 0 1 0 0 1 0 1 0 1 0 1 1 0);
        (`invertFieldsBetweenPairs; enlist 1 0 1 0 0 1 0 0 1);
        (`invertAllButFirstInGroup; enlist 0 0 1 1 1 0 1 1 0 1);
        (`insertZeroAfterIndexes; (10#1; 1 3 7));
        (`zeroAllItems; enlist 0 1 0 1 1 0 0 1 1 1 0);
        (`flagsAtIndexes; ("abcdefghijklmn"; 3 7 9));
        (`vectorLengthOnesAtIndexes; (10; 1 3 7));
        (`vectorLengthZerosAtIndexes; (1 3 7; 10));
        (`onesFollowedByZeros; (5; 9));
        (`zerosFollowedByOnes; (3; 9));
        (`onesPrecededByZeros; (3; 9));
        (`zerosPrecededByOnes; (5; 9));
        (`interlaceRuns; (1 3; 2 4));
        (`alternateRuns; enlist 1 2 3 4 5);
        (`flagPositiveIntegers; enlist 2 3 3 -2 4 4 -1);
        (`countOnes; enlist 1 0 0 1 0 1 1);
        (`lengthsOfGroupsOfOnes; enlist 0 0 1 1 1 0 0 1 1 1 1 0 1);
        (`firstOne; enlist 0 0 1 0 1 0 0 1 1 0);
        (`firstOneAfterIndex; (1 0 0 1 1 0 1 1 0; 3));
        (`ythOne; (1 0 0 1 1 0 1 1 0; 3));
        (`allFlagsMixed; enlist 1 1 0 1);
        (`allFlagsAllOnes; enlist 1 1 1 1);
        (`allFlagsAllZeros; enlist 0 0 0 0);
        (`anyFlagsTrue; enlist 1 0 1);
        (`anyFlagsFalse; enlist 0 0 0);
        (`noneFlagsTrue; enlist 7#0);
        (`noneFlagsMixed; enlist 0 1 0 1 0 1 0);
        (`implies; (0 1 0 1; 0 0 1 1));
        (`butNot; (0 1 0 1; 0 0 1 1));
        (`exclusiveOr; (0 0 1 1; 0 1 0 1));
        (`kroneckerDelta; (0 0 1 1; 0 1 0 1));
        (`simpleParity; enlist til 8);
        (`runningParity; enlist 0 1 1 1 1 0 1 0 0);
        (`firstGroupOfOnes; enlist 0 0 0 1 1 0 1);
        (`firstOnesInGroups; enlist 0 1 1 0 1 1 1 0 0 1);
        (`lastOnesInGroups; enlist 0 1 1 0 1 1 1 0 0 1);
        (`selectItemsFlagged; (2 3 4#1+til 24; 1 0 0 1))
    );

.inputs.algorithms.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.inputs.algorithms.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );