//====================================================================
// Mini-Max Sum
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.miniMaxSum.info[]
//====================================================================
.quiz.hackerRank.algorithms.miniMaxSum.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Mini-Max Sum";
    -1 "";
    -1 "Given five positive integers, find the minimum and maximum values";
    -1 "that can be calculated by summing exactly four of the five integers.";
    -1 "";
    -1 "Then print the respective minimum and maximum values as a single";
    -1 "line of two space-separated long integers.";
    -1 "";
    -1 "Task:";
    -1 "- From the 5 integers, compute all possible sums of exactly 4 elements";
    -1 "- Determine:";
    -1 "    - The minimum possible sum";
    -1 "    - The maximum possible sum";
    -1 "- Print both values on a single line";
    -1 "";
    -1 "Example:";
    -1 "arr = 1 3 5 7 9";
    -1 "";
    -1 "Possible sums:";
    -1 "- Exclude 1 -> 3 + 5 + 7 + 9 = 24";
    -1 "- Exclude 3 -> 1 + 5 + 7 + 9 = 22";
    -1 "- Exclude 5 -> 1 + 3 + 7 + 9 = 20";
    -1 "- Exclude 7 -> 1 + 3 + 5 + 9 = 18";
    -1 "- Exclude 9 -> 1 + 3 + 5 + 7 = 16";
    -1 "";
    -1 "Result:";
    -1 "16 24";
    -1 "";
    -1 "Function Description:";
    -1 "miniMaxSum takes:";
    -1 "  - arr: array of 5 integers";
    -1 "";
    -1 "Returns:";
    -1 "  - None (prints two space-separated integers)";
    -1 "";
    -1 "Input Format:";
    -1 "- A single line of five space-separated integers";
    -1 "";
    -1 "Output Format:";
    -1 "- Print two space-separated integers:";
    -1 "    - minimum sum";
    -1 "    - maximum sum";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= arr[i] <= 10^9";
    -1 "- Exactly 5 integers are provided";
    -1 "";
    -1 "Notes:";
    -1 "- Use 64-bit integers (long) to avoid overflow";
    -1 "- Efficient approach:";
    -1 "    totalSum = sum(arr)";
    -1 "    minSum = totalSum - max(arr)";
    -1 "    maxSum = totalSum - min(arr)";
    -1 "- No need to compute all combinations explicitly";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently compute min and max sums";
    -1 "- Handle large integer values correctly";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "arr:1 2 3 4 5;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ miniMaxSum arr
miniMaxSum:{[arr]
  s:sum arr;
  mn:min arr;
  mx:max arr;
  (s-mx; s-mn)
 };
/ =============================================================
