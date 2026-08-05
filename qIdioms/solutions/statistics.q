.solutions.statistics.easy: (!) . flip raze 2 cut
    (
    (`maximum;enlist 5 3 7 2;7);
    (`nonNegativeMaximum;enlist -1 -2 -3 -4 -5;0);
    (`maximumWeighted;((1 2 3 4 5);5 4 3 2 1);3);
    (`minimum;enlist 5 3 7 2;2);
    (`minimumWeighted;((1 2 3 4 5);5 4 3 2 1);1);
    (`average;enlist 1 10 100;37f);
    (`weightedAverage;((78 80 90 88 72);20 15 20 22 19);19.27451f);
    (`median;enlist 61 20 51 12 31 51 29 35 17 89;33f);
    (`standardDeviation;enlist 44 77 48 24 28 36 17 49 90 91;25.48411f);
    (`variance;enlist 44 77 48 24 28 36 17 49 90 91f;649.44f);
    (`runningSum;enlist 1 20 300 4000;1 21 321 4321);
    (`movingSum;((1 2 3 5 7 11);3);1 3 6 10 15 23);
    (`movingMaximum;((1 2 3 5 7 11);3);1 2 3 5 7 11);
    (`movingMinimum;((1 2 3 5 7 11);3);1 1 1 2 3 5);
    (`movingMaximumIndex;((1 2 3 5 7 11);3);0 1 2 3 4 5);
    (`movingMinimumIndex;((1 2 3 5 7 11);3);0 0 0 1 2 3)
    );

.solutions.statistics.medium: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );

.solutions.statistics.hard: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );