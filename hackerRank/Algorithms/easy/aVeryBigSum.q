//====================================================================
// A Very Big Sum
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.aVeryBigSum.info[]
//====================================================================
.quiz.hackerRank.algorithms.aVeryBigSum.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "A Very Big Sum";
    -1 "";
    -1 "You are given an array of integers, each up to nine digits long.";
    -1 "";
    -1 "The sum of these integers can be large enough that it will not fit";
    -1 "in a 32-bit integer, so it needs to be handled as a 64-bit value.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the sum of all elements in the array";
    -1 "- Print the sum";
    -1 "";
    -1 "Example:";
    -1 "x = 1000000001 1000000002 1000000003 1000000004 1000000005";
    -1 "";
    -1 "Result:";
    -1 "5000000015";
    -1 "";
    -1 "Function Description:";
    -1 "aVeryBigSum takes:";
    -1 "  - x: array of integers";
    -1 "";
    -1 "Returns:";
    -1 "  - long integer representing the sum of the array elements";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (size of the array)";
    -1 "- Second line: n space-separated integers";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the sum";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 10";
    -1 "- 0 <= x[i] <= 10^9";
    -1 "";
    -1 "Notes:";
    -1 "- Each individual element fits in a 32-bit integer";
    -1 "- The sum of all elements may not, so use a 64-bit (long) accumulator";
    -1 "- q's long type handles this without any extra work";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly sum the array without overflow";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "x:1000000001 1000000002 1000000003 1000000004 1000000005;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ aVeryBigSum x
aVeryBigSum:{[x]
  sum x
 };
/ =============================================================
