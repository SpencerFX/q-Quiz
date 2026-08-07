.solutions.shape.easy: flip raze 2 cut
    (
    (`conformTableRows;4 3#1 2 3 4 5 6 7 8 9 0 0 0);
    (`conformTableColumns;4 5#9 9 0 0 0 9 9 0 0 0 9 9 0 0 0 9 9 0 0 0);
    (`emptyVectorBoolean;0#0b);
    (`emptyVectorFloat;0#0.0);
    (`listFromAtom;42);
    (`listFromList;42 43);
    (`cyclicRepetitions;"abcdabcdabcd");
    (`arrayWithShapeRows;("abcd";"abcd";"abcd"));
    (`replicateVector;10 10 10 20 20 20 20 30 30);
    (`joinAtomToEachListItem;("aX";"aY";"aZ"));
    (`appendRowToMatrix;(1 2 3;4 5 6;7 8 9;10 11 12;13 14 15));
    (`fillToLength;"quizzzzzz");
    (`appendEmptyRowChars;("ab";"cd";"ef";"  "));
    (`appendEmptyRowMatrix;(0 1 2 3;4 5 6 7;8 9 10 11;0 0 0 0));
    (`countItemsVector;4);
    (`countItemsList;3);
    (`countCells;24);
    (`countAtoms;5);
    (`firstAtom;"T");
    (`countRows;2);
    (`countColumns;7);
    (`countLastDimension;678);
    (`allAxes;0 1 2 3);
    (`dropRows;(6 7 8;9 10 11;12 13 14;15 16 17));
    (`dropColumns;(2 3;6 7;10 11));
    (`conditionalDropRows;(6 7 8;9 10 11));
    (`conditionalDropLast;(0 1 2;3 4 5;6 7 8));
    (`removeColumns;(2 4 6 8 10 12;14 16 18 20 22 24));
    (`conditionalTranspose;(0 3;1 4;2 5));
    (`transposePlanes;(1 5 9;2 6 10;3 7 11;4 8 12;13 17 21;14 18 22;15 19 23;16 20 24));
    (`treeFromDepthValue;(0;(1;2;3);4;5));
    (`depthFromTree;0 1 2 2 1 1);
    (`valueFromTree;0 1 2 3 4 5)
    );

.solutions.shape.medium: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );

.solutions.shape.hard: (!) . flip raze 2 cut
    (
    (`a;`);
    (`b;`)
    );