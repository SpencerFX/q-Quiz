//====================================================================
// Divisible Sum Pairs
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.divisibleSumPairs.info[]
//====================================================================
.quiz.hackerRank.algorithms.divisibleSumPairs.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Divisible Sum Pairs";
    -1 "";
    -1 "You are given an array of integers and an integer k.";
    -1 "";
    -1 "A pair of indices (i, j) is considered valid if:";
    -1 "- i < j";
    -1 "- (arr[i] + arr[j]) is divisible by k";
    -1 "";
    -1 "Task:";
    -1 "- Determine the number of valid pairs";
    -1 "";
    -1 "Example:";
    -1 "n = 6";
    -1 "k = 3";
    -1 "arr = 1 3 2 6 1 2";
    -1 "";
    -1 "Pairs:";
    -1 "(1,3) -> 1+2=3 valid";
    -1 "(1,6) -> 1+2=3 valid";
    -1 "(3,6) -> 2+1=3 valid";
    -1 "(2,4) -> 3+6=9 valid";
    -1 "(4,5) -> 6+1=7 invalid";
    -1 "...";
    -1 "";
    -1 "Valid pairs count:";
    -1 "5";
    -1 "";
    -1 "Result:";
    -1 "5";
    -1 "";
    -1 "Function Description:";
    -1 "divisibleSumPairs takes:";
    -1 "  - n: integer (size of array)";
    -1 "  - k: integer (divisor)";
    -1 "  - arr: array of integers";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the number of valid pairs";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: two integers n and k";
    -1 "- Second line: n space-separated integers (array values)";
    -1 "";
    -1 "Output Format:";
    -1 "- Single integer: number of valid pairs";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "- 1 <= k <= 100";
    -1 "- 1 <= arr[i] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Only consider pairs where i < j (no duplicates or reverse pairs)";
    -1 "- A pair is valid if:";
    -1 "    (arr[i] + arr[j]) mod k = 0";
    -1 "- Brute force (O(n^2)) works within constraints";
    -1 "- Optimized approach uses remainder counting";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly identify valid index pairs";
    -1 "- Efficiently count pairs whose sum is divisible by k";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "k:3;";
    -1 "arr:1 3 2 6 1 2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/divisibleSumPairs[k;arr]
divisibleSumPairs:{[k;arr]
  comb:{[N;l]$[N=1;l;raze .z.s[N-1;l]{x,/:y where y>max x}\:l]};
  sum 0 = (sum each comb[2;arr]) mod k
 };
/ =============================================================
