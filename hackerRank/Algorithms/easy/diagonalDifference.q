/ Question Info ===============================================
/ Diagonal Difference

/ Given a square matrix:
/ - Compute primary diagonal sum
/ - Compute secondary diagonal sum
/ - Return absolute difference
/ =============================================================


/ Input Info ==================================================
input: (3; 11 2 4; 4 5 6; 10 8 -12)
/ =============================================================


/ Solution Info ===============================================
/ Note: This is a hard-coded solution. Need to find a more optimal path
/ diagonalDifference input 
diagonalDifference:{[x]
  n:first x;
  m:1_x;
  idx:til n;

  d1:sum {y[x]}'[idx;m];                / primary diagonal
  d2:sum {y[x]}'[reverse idx;m];        / secondary diagonal

  abs d1 - d2
 }
/ =============================================================