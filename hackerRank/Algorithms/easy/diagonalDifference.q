//====================================================================
// Diagonal Difference
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.diagonalDifference.info[]
//====================================================================
.quiz.hackerRank.algorithms.diagonalDifference.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Diagonal Difference";
    -1 "";
    -1 "Given a square matrix, calculate the absolute difference between";
    -1 "the sums of its two diagonals.";
    -1 "";
    -1 "Task:";
    -1 "- Compute the sum of the primary diagonal (top-left to bottom-right)";
    -1 "- Compute the sum of the secondary diagonal (top-right to bottom-left)";
    -1 "- Return the absolute difference between the two sums";
    -1 "";
    -1 "Example:";
    -1 "n = 3";
    -1 "matrix =";
    -1 "  11  2  4";
    -1 "   4  5  6";
    -1 "  10  8 -12";
    -1 "";
    -1 "Primary diagonal:   11 + 5 + (-12) = 4";
    -1 "Secondary diagonal:  4 + 5 + 10    = 19";
    -1 "";
    -1 "Result:";
    -1 "abs(4 - 19) = 15";
    -1 "";
    -1 "Function Description:";
    -1 "diagonalDifference takes:";
    -1 "  - x: a list whose first element is n (the matrix size) followed";
    -1 "       by n rows, each a list of n integers";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the absolute difference between the diagonal sums";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n";
    -1 "- Next n lines: n space-separated integers (a row of the matrix)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "- -100 <= matrix[i][j] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- The primary diagonal takes element i from row i";
    -1 "- The secondary diagonal takes element (n-1-i) from row i";
    -1 "- Sum both diagonals, then return the absolute value of their difference";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly identify both diagonals for an n x n matrix";
    -1 "- Compute the absolute difference between their sums";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "x:(3; 11 2 4; 4 5 6; 10 8 -12);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ diagonalDifference x
diagonalDifference:{[x]
  n:first x;
  m:1_x;
  idx:til n;

  d1:sum {y[x]}'[idx;m];                / primary diagonal
  d2:sum {y[x]}'[reverse idx;m];        / secondary diagonal

  abs d1 - d2
 }
/ =============================================================
