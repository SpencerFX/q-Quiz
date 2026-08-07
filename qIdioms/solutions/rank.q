.solutions.rank.easy: (!) . flip raze 2 cut
    (
    (`depth;3);
    (`depth;1);
    (`depth;1);
    (`depth;2);
    (`shape;2 3 4);
    (`shape;enlist 4);
    (`shape;4 5);
    (`shape;enlist 19);
    (`shape;`long$());
    (`first;3);
    (`razeOver;til 24);
    (`matrixColumn;0 4 8);
    (`oneRowMatrix;enlist 2 3 5 7 11);
    (`oneColumnMatrix;(34;31;51;29;35;17;89));
    (`twoColumnMatrix;("ae";"bf";"cg";"dh"));
    (`twoColumnFromVector;("ab";"cd";"ef";"gh";"i "));
    (`repeatRows;("abcd";"abcd";"abcd"));
    (`repeatColumns;("aaaa";"bbbb";"cccc"));
    (`diagonalMatrix;(
        5 0 0 0 0;
        0 9 0 0 0;
        0 0 6 0 0;
        0 0 0 7 0;
        0 0 0 0 2
    ));
    (`increaseRankFromVector;enlist "ijkl")
    );

.solutions.rank.medium: (!) . flip raze 2 cut
    (
    (`depth;enlist 2 1 2 1 3 1 4#0);
    (`shape;enlist 2 1 2 1 3 1 4#0);
    (`flattenText;enlist ("The quick brown fox ";"jumps over ";"the lazy dog."));
    (`flattenArray;enlist 3 2 2#til 12);
    (`matrixDiagonal;enlist 10 20 30 40 50);
    (`matrixColumn;(5 5#til 25;3));
    (`increaseRank;(2 3#til 6;1 2 3));
    (`repeatRows;("hello";5));
    (`repeatColumns;(6;"xyz"));
    (`twoColumnFromVector;enlist "abcdefghijkl")
    );

.solutions.rank.hard: (!) . flip raze 2 cut
    (
    (`depth;enlist (2 2 2#til 8;2 2 2#8+til 8));
    (`shape;enlist (2 2 2#til 8;2 2 2#8+til 8));
    (`flattenArray;enlist 2 2 3#til 12);
    (`increaseRank;((2 2 2#til 8);42));
    (`matrixDiagonal;enlist 1 4 9 16 25 36);
    (`matrixColumn;(6 4#til 24;2));
    (`repeatRows;("rank";8));
    (`repeatColumns;(8;"abcd"));
    (`twoColumnFromVector;enlist "abcdefghijklmnop");
    (`oneColumnMatrix;enlist 100 200 300 400 500 600)
    );