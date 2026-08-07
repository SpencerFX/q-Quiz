.solutions.finance.easy: (!) . flip raze 2 cut
    (
    (`presentValueCashFlows;
        enlist 0.9729);
    (`futureValueCashFlows;
        enlist 74.11375);
    (`compoundInterest;
        (
            100.5 101 101.51 101 102.01 103.03 101.5 103.02 104.57 102 104.04 106.12;
            201 202 203.02 202 204.02 206.06 203 206.04 209.14 204 208.08 212.24;
            301.5 303.01 304.52 303 306.03 309.09 304.5 309.07 313.7 306 312.12 318.36;
            402 404.01 406.03 404 408.04 412.12 406 412.09 418.27 408 416.16 424.48
        ));
    (`annuityCoefficient;
        (
            0.149 0.156 0.163 0.199;
            0.117 0.124 0.131 0.171;
            0.102 0.11 0.117 0.16;
            0.0937 0.102 0.11 0.155
        ));
    (`fifoStockDecrement;
         0 0 1 4 5);
    (`payback;
         840 567 175.35 -25.8825);
    (`paybackEndOfPeriod;
         850 592.5 222.125 33.23125);
    (`paybackVariableRates;
         840 561.6 171.296 -30.1392);
    (`paybackVariableRatesEndOfPeriod;
         850 584 219.04 29.992);
    (`roundNearestInteger;
         5 3 81 -2 -10);
    (`roundNearestEvenInteger;
         0 2 2 4 0 -2);
    (`roundHalfToEven;
         24 40 3 -14 4 4);
    (`roundTwoDecimalPlaces;
         3.14 2.72 -12.67);
    (`roundToNDecimals;
        enlist 3.326);
    (`roundLargeNumberNDecimals;
        enlist 123123123123.12);
    (`roundNearestMultiple;
        enlist 96);
    (`roundNearestCurrencyMultiple;
        enlist 11.52);
    (`roundSmallMagnitudesToZero;
         0.0001 -1e-08 0 0);
    (`roundSummandsSet1;
         42 39 19);
    (`roundSummandsSet2;
         43 37 20)
    );

.solutions.algorithms.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.solutions.algorithms.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );