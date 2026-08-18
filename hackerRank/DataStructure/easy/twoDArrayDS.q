//====================================================================
// 2D Array - DS (Hourglass Sum)
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.twoDArrayDS.info[]
//====================================================================
.quiz.hackerRank.dataStructures.twoDArrayDS.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "2D Array - DS (Hourglass Sum)";
    -1 "";
    -1 "Given a 6x6 2D array, an hourglass is a subset of values with";
    -1 "indices falling in this pattern:";
    -1 "";
    -1 "a b c";
    -1 "  d";
    -1 "e f g";
    -1 "";
    -1 "There are multiple hourglasses in a 6x6 array. The hourglass sum";
    -1 "is the sum of the values in an hourglass.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the hourglass sum for every hourglass in the array";
    -1 "- Return the maximum hourglass sum";
    -1 "";
    -1 "Example:";
    -1 "m =";
    -1 "  1 1 1 0 0 0";
    -1 "  0 1 0 0 0 0";
    -1 "  1 1 1 0 0 0";
    -1 "  0 0 2 4 4 0";
    -1 "  0 0 0 2 0 0";
    -1 "  0 0 1 2 4 0";
    -1 "";
    -1 "Result:";
    -1 "19";
    -1 "";
    -1 "Function Description:";
    -1 "twoDArrayDS takes:";
    -1 "  - m: a 6x6 array of integers";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the maximum hourglass sum";
    -1 "";
    -1 "Input Format:";
    -1 "- 6 lines, each with 6 space-separated integers";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the maximum hourglass sum";
    -1 "";
    -1 "Constraints:";
    -1 "- The array is always 6x6";
    -1 "- -9 <= m[i][j] <= 9";
    -1 "";
    -1 "Notes:";
    -1 "- There are 4x4 = 16 possible hourglasses in a 6x6 array";
    -1 "- An hourglass at top-left corner (i,j) uses:";
    -1 "    row i:   j, j+1, j+2";
    -1 "    row i+1: j+1";
    -1 "    row i+2: j, j+1, j+2";
    -1 "- Slide the hourglass across all valid positions and track the max sum";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly compute every hourglass sum";
    -1 "- Return the maximum";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "m:(1 1 1 0 0 0; 0 1 0 0 0 0; 1 1 1 0 0 0; 0 0 2 4 4 0; 0 0 0 2 0 0; 0 0 1 2 4 0);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ twoDArrayDS m
twoDArrayDS:{[m]
  rN:count m;
  cN:count first m;

  best:-1e9;

  i:0;
  while[i<rN-2;
    j:0;
    while[j<cN-2;
      s:(m[i;j] + m[i;j+1] + m[i;j+2]) +
        m[i+1;j+1] +
        (m[i+2;j] + m[i+2;j+1] + m[i+2;j+2]);
      if[s>best; best:s];
      j+:1;
    ];
    i+:1;
  ];

  best
 };
/ =============================================================
