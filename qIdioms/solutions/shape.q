.solutions.shape.easy: (!) . flip raze 2 cut
    (
    (`conformTableRows;((3 3#1+til 9);1 2 3 4));
    (`conformTableColumns;((4 2#9);5#8));
    (`emptyVectorBoolean;enlist 0#0b);
    (`emptyVectorFloat;enlist 0#0.0);
    (`listFromAtom;enlist 42);
    (`listFromList;enlist 42 43);
    (`cyclicRepetitions;("abcd";3));
    (`arrayWithShapeRows;((3 4#til 12);"abcd"));
    (`replicateVector;((3 4 2);10 20 30));
    (`joinAtomToEachListItem;("a";"XYZ"));
    (`appendRowToMatrix;((4 3#1+til 12);13 14 15));
    (`fillToLength;("quiz";9));
    (`appendEmptyRowChars;enlist ("ab";"cd";"ef"));
    (`appendEmptyRowMatrix;enlist 3 4#til 12);
    (`countItemsVector;enlist "abcd");
    (`countItemsList;enlist (1;2 3;4 5 6));
    (`countCells;enlist 2 3 4#til 24);
    (`countAtoms;enlist (1 2;(3 4;5)));
    (`firstAtom;enlist (("The";"quick");"brown";"fox";(("jumps";"over");(("the";"lazy");"dog"))));
    (`countRows;enlist 2 7#" ");
    (`countColumns;enlist 2 7#" ");
    (`countLastDimension;enlist 1 1 1 1 1 678#0);
    (`allAxes;enlist 2 3 4 5#til 120);
    (`dropRows;((6 3#til 18);2));
    (`dropColumns;enlist 3 4#til 12);
    (`conditionalDropRows;((4 3#til 12);1;2));
    (`conditionalDropLast;((4 3#til 12);1));
    (`removeColumns;enlist 2 3 4#1+til 24);
    (`conditionalTranspose;((2 3#til 6);1));
    (`transposePlanes;enlist 2 3 4#1+til 24);
    (`treeFromDepthValue;((0 1 2 2 1 1);0 1 2 3 4 5));
    (`depthFromTree;enlist (0;(1;,2;,3);,4;,5));
    (`valueFromTree;enlist (0;(1;,2;,3);,4;,5))
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