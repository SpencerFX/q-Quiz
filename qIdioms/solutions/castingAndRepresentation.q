.solutions.castingAndRepresentation.easy: (!) . flip raze 2 cut
    (
    (`binaryFromInteger; enlist 1 0 1 0 0);
    (`integerFromBinary; enlist 157);
    (`hexadecimalFromInteger; enlist "12c");
    (`decimalDigitsFromInteger; enlist 1 2 3 4 5 6 7 8 9);
    (`hexadecimalFromDecimalCharacters; enlist " 47 4f 4c 44 45 4e");
    (`integerBase10_100_1000; enlist 4 56 789);
    (`integerInBaseY; enlist 1 0 0);
    (`integerFromHexadecimal; enlist 255 169 2220 65535);
    (`vectorFromDate; enlist 1998 5 22);
    (`integerFromDate; enlist "I"$string .z.d except ".");
    (`numberFromString; enlist 1998 51);
    (`numberFromStringDefault; enlist -1);
    (`numericCodesFromString; enlist 32 97 65 48);
    (`integerFromRoman; enlist 1909);
    (`numbersFromTextMatrix; enlist 1 12 0 0.5);
    (`numbersFromEvaluatingRowsOfTextMatrix; enlist (3 5;4 7))
    );

.solutions.castingAndRepresentation.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.solutions.castingAndRepresentation.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );