.inputs.arithmetic: (!) . flip raze 2 cut
    (
        (`sumAVector; enlist 1 2 3 4 5);
        (`sumColumnsMatrix; enlist 1+3 4#til 12);
        (`sumRowsMatrix; enlist 1+3 4#til 12);
        (`sumItemsGrouped; enlist log 1+til 5);
        (`addVectorToRows; (1+til 4;3 4#2+til 12));
        (`addVectorToColumns; (1+til 2; 2 5#3+til 10));
        (`addToLastItem; (100; 1 2 3 4 5));
        (`sumReciprocalSeries;(10 9 10 7 8; 80 63 70 63 64));
        (`sumOverSubsets; (`float$1+3 4#til 12;`float$4 3#1 0));
        (`sumSquares; enlist 1 2 3 4 5);
        (`alternatingSum; enlist 1+til 10);
        (`alternatingSumSeries;enlist 1+til 10);
        (`increaseAbsoluteValueWithoutSignChange;(0 -1 2 -3 4 -5;10));
        (`vectorNegative; enlist 1 -3 5);
        (`numericArrayNegative;enlist 3+3 4#til 12);
        (`firstDifference; enlist sums 1 2 3 4 5);
        (`pairwiseDifference; enlist 9 3 5 2 0);
        (`zeroArray; enlist 3 4#til 12);
        (`product; enlist 1 2 3 4 5);
        (`multiplicationTable; enlist 5);
        (`squareRetainingSign; enlist 0 -1 2 -3 4);
        (`multiplyEachColumn;(2 5#1+til 10;10 100));
        (`multiplyEachRow; (3 4#1+til 12; 1 10 100 10000));
        (`vectorCrossProduct;( 2 8 5 6 3 1 7 7 10 4; 6 9 1 1 6 7 1 4 1 5));
        (`alternatingProduct; enlist 1 2 3 4 5);
        (`directMatrixProduct; (1+3 2#til 6; 1+2 4#til 8));
        (`matrixProduct;(`float$(1 2 3;4 5 6);`float$(1 2;3 4;5 6)));
        (`dotProduct;(1 2 3 4 5; 10 20 30 40 50));
        (`productOverSubsets;(1+3 4#til 12;4 3#1 0)) 
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