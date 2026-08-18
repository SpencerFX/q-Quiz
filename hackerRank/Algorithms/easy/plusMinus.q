//====================================================================
// Plus Minus
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.plusMinus.info[]
//====================================================================
.quiz.hackerRank.algorithms.plusMinus.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Plus Minus";
    -1 "";
    -1 "Given an array of integers, calculate the ratios of its elements";
    -1 "that are positive, negative, and zero.";
    -1 "";
    -1 "Print the decimal value of each fraction on a new line with";
    -1 "6 places after the decimal.";
    -1 "";
    -1 "Task:";
    -1 "- Count the number of positive, negative, and zero elements";
    -1 "- Divide each count by the total number of elements";
    -1 "- Print the results in order:";
    -1 "    1) positive ratio";
    -1 "    2) negative ratio";
    -1 "    3) zero ratio";
    -1 "";
    -1 "Example:";
    -1 "arr = -4 3 -9 0 4 1";
    -1 "";
    -1 "Output:";
    -1 "0.500000";
    -1 "0.333333";
    -1 "0.166667";
    -1 "";
    -1 "Explanation:";
    -1 "- positives: 3/6 = 0.500000";
    -1 "- negatives: 2/6 = 0.333333";
    -1 "- zeros:     1/6 = 0.166667";
    -1 "";
    -1 "Function Description:";
    -1 "plusMinus takes:";
    -1 "  - arr: array of integers";
    -1 "";
    -1 "Returns:";
    -1 "  - None (prints ratios to standard output)";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Second line: n space-separated integers";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "- -100 <= arr[i] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Output must be formatted to 6 decimal places";
    -1 "- Division should be performed in floating point";
    -1 "- Ensure correct handling of zero values";
    -1 "";
    -1 "Goal:";
    -1 "- Accurately compute ratios of positives, negatives, and zeros";
    -1 "- Format output correctly";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "arr:-4 3 -9 0 4 1f;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ plusMinus arr
plusMinus:{[arr]
  n:count arr;
  posNum:sum arr>0;
  negNum:sum arr<0;
  zer:sum arr=0;

  (posNum % n; negNum % n;zer % n)
 };
/ =============================================================


/ Solution Info (alternate) ====================================
/ Uses avg over each boolean mask (mean of a boolean vector is
/ exactly its true-ratio) instead of manual count/n division.
/ plusMinus2 arr
plusMinus2:{[arr]
  (avg arr>0; avg arr<0; avg arr=0)
 };
/ =============================================================
