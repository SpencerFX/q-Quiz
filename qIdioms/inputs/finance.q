.inputs.finance.easy: (!) . flip raze 2 cut
    (
        (`presentValueCashFlows; (0.1 0.1 1.1; 1 2 3; 0.9));
        (`futureValueCashFlows; (10 15 20 25; 5));
        (`compoundInterest; (1 2 3; 100 200 300 400; 0.5 1 1.5 2));
        (`annuityCoefficient; (10 15 20 25; 8 9 10 15));
        (`fifoStockDecrement; (5; 1 2 3 4 5));
        (`payback; (1000; 0; 0.05; 200 300 400 200));
        (`paybackEndOfPeriod; (1000; 1; 0.05; 200 300 400 200));
        (`paybackVariableRates; (1000; 0; 0.05 0.04 0.06 0.05; 200 300 400 200));
        (`paybackVariableRatesEndOfPeriod; (1000; 1; 0.05 0.04 0.06 0.05; 200 300 400 200));
        (`roundNearestInteger; enlist 4.5 3.21 80.9 -2.4 -9.6);
        (`roundNearestEvenInteger; enlist 0.9 1 2.5 3.1 -0.2 -1.9);
        (`roundHalfToEven; enlist 23.6 40.5 3.2 -14.02 3.5 4.5);
        (`roundTwoDecimalPlaces; enlist 3.1414 2.71828 -12.66666);
        (`roundToNDecimals; (3; 3.3256789));
        (`roundLargeNumberNDecimals; (2; 123123123123.123123));
        (`roundNearestMultiple; (100; 12));
        (`roundNearestCurrencyMultiple; (11.50; 0.12));
        (`roundSmallMagnitudesToZero; (1e-4 -1e-8 -1e-12 1e-16; 1e-9));
        (`roundSummandsSet1; (1; 42.35 38.45 19.20));
        (`roundSummandsSet2; (1; 42.65 37.60 19.75))
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