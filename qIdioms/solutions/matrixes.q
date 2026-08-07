.solutions.matrixes.easy: (!) . flip raze 2 cut
    (
    (`matrixCell;enlist 9);
    (`applyToDimension1;15 18 21 24);
    (`truthTable;(00001111b;00110011b;01010101b));
    (`upperTriangularMatrix;(11111b;01111b;00111b;00011b;00001b));
    (`lowerTriangularMatrix;(10000b;11000b;11100b;11110b;11111b));
    (`identityMatrix;(1 0 0 0 0;0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1));
    (`hilbertMatrix;(
        1         0.5       0.3333333 0.25      0.2;
        0.5       0.3333333 0.25      0.2       0.1666667;
        0.3333333 0.25      0.2       0.1666667 0.1428571;
        0.25      0.2       0.1666667 0.1428571 0.125;
        0.2       0.1666667 0.1428571 0.125     0.1111111
    ));
    (`mainDiagonal;1 6 11);
    (`diagonalsFromColumns;(
        1 2 3 4 5;
        10 6 7 8 9;
        14 15 11 12 13;
        18 19 20 16 17;
        22 23 24 25 21
    ));
    (`columnsFromDiagonals;(
        1 2 3 4 5;
        6 7 8 9 10;
        11 12 13 14 15;
        16 17 18 19 20;
        21 22 23 24 25
    ));
    (`addVectorToMainDiagonal;(
        10 1 2 3;
        4 105 6 7;
        8 9 1010 11
    ));
    (`extendDistanceTableToNextLeg;(
        0 50 70 20 30;
        50 0 20 40 30;
        70 20 0 40 30;
        20 40 40 0 10;
        30 30 30 10 0
    ));
    (`extendTransitiveBinaryRelation;(
        0011b;
        1010b;
        0100b;
        1000b
    ));
    (`firstColumnAsMatrix;(0;4;8));
    (`twoByTwoDeterminant;enlist 1);
    (`shurSum;(2 4;8 10));
    (`shurProduct;(1 4;15 24))
    );

.solutions.matrixes.medium: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );

.solutions.matrixes.hard: (!) . flip raze 2 cut
    (
    (`a; `);
    (`b; `)
    );