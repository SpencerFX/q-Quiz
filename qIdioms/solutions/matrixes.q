.solutions.matrixes.easy: (!) . flip raze 2 cut
    (
    (`matrixCell;enlist (0 1 2 3;4 5 6 7;8 9 10 11));
    (`applyToDimension1;enlist 3 4#1+til 12);
    (`truthTable;enlist 3);
    (`upperTriangularMatrix;enlist 5);
    (`lowerTriangularMatrix;enlist 5);
    (`identityMatrix;enlist 5);
    (`hilbertMatrix;enlist 5);
    (`mainDiagonal;enlist 3 4#1+til 12);
    (`diagonalsFromColumns;enlist 5 5#1+til 25);
    (`columnsFromDiagonals;enlist (1 2 3 4 5;10 6 7 8 9;14 15 11 12 13;18 19 20 16 17;22 23 24 25 21));
    (`addVectorToMainDiagonal;(3 4#til 12;10 100 1000));
    (`extendDistanceTableToNextLeg;enlist (0 50 80 20 999;50 0 20 40 30;80 20 0 999 30;20 40 999 0 10;999 30 30 10 0));
    (`extendTransitiveBinaryRelation;enlist (0 1 0 0;0 0 1 1;1 0 0 0;0 0 1 0));
    (`firstColumnAsMatrix;enlist 3 4#til 12);
    (`twoByTwoDeterminant;enlist (13 21;34 55));
    (`shurSum;(3 2#til 6;2 4#1+til 8));
    (`shurProduct;(3 2#til 6;2 4#1+til 8))
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