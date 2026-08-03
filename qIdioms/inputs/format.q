.inputs.format.easy: (!) . flip raze 2 cut
    (
    (`formattedIntegers; enlist 14 13 9 74 55);
    (`countOfFormat; enlist 12.345);
    (`leadingZerosPositiveIntegers; (3;12 10 1 26 9 26 26 37 20 29));
    (`numberOfDecimals; enlist 1.4321 1.21 10f);
    (`numberOfDecimalsMaximum; (1.4321 1.21 10f;3));
    (`positionsNonNegativeInteger; enlist 0 13 523 16008);
    (`positionsInteger; enlist 1234 -1234 0 7 12345678);
    (`timeFromInteger; enlist 121129);
    (`dateFromInteger; enlist 20190507);
    (`indexingPlottingCharacters; enlist 1200);
    (`histogram; enlist 8 3 11 9 9 4 6 6 3 3 9 7 9);
    (`barChartIntegerList; enlist 2 5 7 4 9 3 6);
    (`horizontalBarChartIntegers; enlist 2 8 5 6 3 1 7 7 10 4);
    (`horizontalBarChartNormalized; (2 8 5 6 3 1 7 7 10 4;5))
    );

.inputs.format.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.inputs.format.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );