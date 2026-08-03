.inputs.execution.easy: (!) . flip raze 2 cut
    (
        (`chooseDependingOnFlag;
            ("abcdef"; "xyz"; 0));

        (`reverseOnCondition;
            (1 2 3 4 5; 1));

        (`conditionalChangeOfSign;
            (5 -3 20 9 -10; 1 0 1 0 1));

        (`efficientExecutionRepeatedValues;
            enlist 1 2 3 2 3 2 1);

        (`errorToStopExecution;
            enlist `stop);

        (`executeRowsCharacterMatrix;
            (4; 9; 2 5#"y1:x1y2:x2"));

        (`sumNumbersCharacterMatrix;
            enlist string til 5)
    );

.inputs.execution.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.inputs.execution.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );