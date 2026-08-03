.inputs.math.easy: (!) . flip raze 2 cut
    (
    (`betaFunction;(1;3));
    (`numberOfCombinations;(12;7));
    (`numberOfPermutations;(5;3));
    (`combinations;(4;3));
    (`permutations;enlist `a`b`c);
    (`invertPermutation;enlist 5 3 2 0 6 4 1);
    (`connectivityListFromMatrix;enlist (1 0 1;1 0 1));
    (`connectivityMatrixFromList;(3;(0 1;0 2;1 0;1 2;2 2)));
    (`nodeMatrixFromConnectionMatrix;enlist (1 1 0 0 0;0 -1 0 1 1;-1 0 1 -1 0;0 0 -1 0 -1));
    (`connectionMatrixFromNodeMatrix;enlist (0 0 2 1 1;2 1 3 2 3));
    (`fibonacciNumbers;enlist 10);
    (`maximumSeparation;enlist 17 14 14 17 14 17 18);
    (`partitions;(3;10));
    (`pascalsTriangle;enlist 4);
    (`pointerChasing;enlist (3*til 7) mod 7);
    (`polygonArea;enlist (10 5;6 8;3 6;4 3;7 2));
    (`quadraticSolution;(1;-8;15));
    (`saddlePointIndexes;enlist (4 2 4 4 2 4;5 3 5 5 3 5;4 2 4 4 2 4;1 2 4 4 2 4;5 3 5 5 3 5;4 2 4 4 2 4));
    (`setUnion;("12345";"4567890"));
    (`setDifference;("12345";"4567890"));
    (`setIntersection;("abcdefghijxyz";"yacqwopzbx"));
    (`rangeUnion;enlist (1 3;8 10;11 12;2 4));
    (`taylorSeries;(3;1 1 1));
    (`valueOfTaylorSeries;(12;7 5 6 6))
    );

.inputs.math.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.inputs.math.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );