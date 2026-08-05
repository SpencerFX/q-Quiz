.solutions.shape.easy: (!) . flip raze 2 cut
    (
    (`conformTableRows;((3 3#1+til 9);1 2 3 4);4 3#1 2 3 4 5 6 7 8 9 0 0 0);
    (`conformTableColumns;((4 2#9);5#8);4 5#9 9 0 0 0 9 9 0 0 0 9 9 0 0 0 9 9 0 0 0);
    (`emptyVectorBoolean;enlist 0#0b;0#0b);
    (`emptyVectorFloat;enlist 0#0.0;0#0.0);
    (`listFromAtom;enlist 42;,42);
    (`listFromList;enlist 42 43;42 43);
    (`cyclicRepetitions;("abcd";3);"abcdabcdabcd");
    (`arrayWithShapeRows;((3 4#til 12);"abcd");("abcd";"abcd";"abcd"));
    (`replicateVector;((3 4 2);10 20 30);10 10 10 20 20 20 20 30 30);
    (`joinAtomToEachListItem;("a";"XYZ");("aX";"aY";"aZ"));
    (`appendRowToMatrix;((4 3#1+til 12);13 14 15);(1 2 3;4 5 6;7 8 9;10 11 12;13 14 15));
    (`fillToLength;("quiz";9);"quizzzzzz");
    (`appendEmptyRowChars;enlist ("ab";"cd";"ef");("ab";"cd";"ef";"  "));
    (`appendEmptyRowMatrix;enlist 3 4#til 12;(0 1 2 3;4 5 6 7;8 9 10 11;0 0 0 0));
    (`countItemsVector;enlist "abcd";4);
    (`countItemsList;enlist (1;2 3;4 5 6);3);
    (`countCells;enlist 2 3 4#til 24;24);
    (`countAtoms;enlist (1 2;(3 4;5));5);
    (`firstAtom;enlist (("The";"quick");"brown";"fox";(("jumps";"over");(("the";"lazy");"dog")));"T");
    (`countRows;enlist 2 7#" ";2);
    (`countColumns;enlist 2 7#" ";7);
    (`countLastDimension;enlist 1 1 1 1 1 678#0;678);
    (`allAxes;enlist 2 3 4 5#til 120;0 1 2 3);
    (`dropRows;((6 3#til 18);2);(6 7 8;9 10 11;12 13 14;15 16 17));
    (`dropColumns;enlist 3 4#til 12;(2 3;6 7;10 11));
    (`conditionalDropRows;((4 3#til 12);1;2);(6 7 8;9 10 11));
    (`conditionalDropLast;((4 3#til 12);1);(0 1 2;3 4 5;6 7 8));
    (`removeColumns;enlist 2 3 4#1+til 24;(2 4 6 8 10 12;14 16 18 20 22 24));
    (`conditionalTranspose;((2 3#til 6);1);(0 3;1 4;2 5));
    (`transposePlanes;enlist 2 3 4#1+til 24;(1 5 9;2 6 10;3 7 11;4 8 12;13 17 21;14 18 22;15 19 23;16 20 24));
    (`treeFromDepthValue;((0 1 2 2 1 1);0 1 2 3 4 5);(0;(1;,2;,3);,4;,5));
    (`depthFromTree;enlist (0;(1;,2;,3);,4;,5);0 1 2 2 1 1);
    (`valueFromTree;enlist (0;(1;,2;,3);,4;,5);0 1 2 3 4 5)
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