//====================================================================
// Subarray Division (Birthday Chocolate)
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.subArrayDivision.info[]
//====================================================================
.quiz.hackerRank.algorithms.subArrayDivision.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Subarray Division (Birthday Chocolate)";
    -1 "";
    -1 "Lily has a chocolate bar represented as a sequence of integers,";
    -1 "where each integer denotes the number on a square of chocolate.";
    -1 "";
    -1 "She wants to share the chocolate with Ron for his birthday.";
    -1 "";
    -1 "To do this, she must find a contiguous segment of the bar such that:";
    -1 "- The segment contains exactly m squares";
    -1 "- The sum of the integers in the segment is equal to d";
    -1 "";
    -1 "Task:";
    -1 "- Determine how many ways Lily can divide the chocolate";
    -1 "- Return the number of valid segments";
    -1 "";
    -1 "Example:";
    -1 "s = 1 2 1 3 2";
    -1 "d = 3";
    -1 "m = 2";
    -1 "";
    -1 "Possible segments of length 2:";
    -1 "[1,2] -> sum = 3 valid";
    -1 "[2,1] -> sum = 3 valid";
    -1 "[1,3] -> sum = 4 invalid";
    -1 "[3,2] -> sum = 5 invalid";
    -1 "";
    -1 "Result:";
    -1 "2";
    -1 "";
    -1 "Function Description:";
    -1 "birthday takes:";
    -1 "  - s: array of integers (chocolate squares)";
    -1 "  - d: integer (target sum)";
    -1 "  - m: integer (segment length)";
    -1 "";
    -1 "Returns:";
    -1 "  - integer count of valid segments";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (length of array)";
    -1 "- Second line: n space-separated integers (array s)";
    -1 "- Third line: two integers d and m";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the number of valid segments";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "- 1 <= s[i] <= 5";
    -1 "- 1 <= d <= 31";
    -1 "- 1 <= m <= n";
    -1 "";
    -1 "Notes:";
    -1 "- Use a sliding window of size m";
    -1 "- For each window:";
    -1 "    compute sum of elements";
    -1 "    compare with d";
    -1 "- Efficient approach:";
    -1 "    - Compute initial window sum";
    -1 "    - Slide window by removing left element and adding next element";
    -1 "    - Time complexity: O(n)";
    -1 "";
    -1 "Goal:";
    -1 "- Count all contiguous subarrays of length m with sum equal to d";
    -1 "- Implement efficiently using a sliding window approach";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "s:1 2 1 3 2;";
    -1 "d:3;";
    -1 "m:2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ subArrayDivision[s; d; m]
subArrayDivision:{[s;d;m]
  n:count s;
  idx:til n-m+1;
  window:{[s;m;x] sum s[x + til m]}[s;m] each idx;
  sum window = d
 }
/ =============================================================
