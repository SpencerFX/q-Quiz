.inputs.castingAndRepresentation.easy: (!) . flip raze 2 cut
    (
        (`binaryFromInteger; enlist 20);
        (`integerFromBinary; enlist 1 0 0 1 1 1 0 1);
        (`hexadecimalFromInteger; enlist 300);
        (`decimalDigitsFromInteger; enlist 123456789);
        (`hexadecimalFromDecimalCharacters; enlist "GOLDEN");
        (`integerBase10_100_1000; enlist 123456789);
        (`integerInBaseY; (16;256));
        (`integerFromHexadecimal; enlist ("ff";"a9";"8ac";"ffff"));
        (`vectorFromDate; enlist 19980522);
        (`integerFromDate; enlist .z.d);
        (`numberFromString; enlist "1998 51");
        (`numberFromStringDefault; ("";"-1"));
        (`numericCodesFromString; enlist " aA0");
        (`integerFromRoman; enlist "MCMIX");
        (`numbersFromTextMatrix; enlist 4 3#" 1 12 0.5");
        (`numbersFromEvaluatingRowsOfTextMatrix; enlist 2 5#"1+2 41+3 6")
    );

.inputs.castingAndRepresentation.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.inputs.castingAndRepresentation.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );