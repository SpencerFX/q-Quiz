//====================================================================
// Solve Me First
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.solveMeFirst.info[]
//====================================================================
.quiz.hackerRank.algorithms.solveMeFirst.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Solve Me First";
    -1 "";
    -1 "Complete the function that computes the sum of two integers.";
    -1 "";
    -1 "Task:";
    -1 "- Read two integers, num1 and num2";
    -1 "- Return their sum";
    -1 "";
    -1 "Example:";
    -1 "num1 = 2";
    -1 "num2 = 2";
    -1 "";
    -1 "Result:";
    -1 "4";
    -1 "";
    -1 "Function Description:";
    -1 "solveMeFirst takes:";
    -1 "  - num1: integer";
    -1 "  - num2: integer";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the sum of num1 and num2";
    -1 "";
    -1 "Input Format:";
    -1 "- Two space-separated integers, num1 and num2";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the sum";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= num1, num2 <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- This is a warm-up exercise - a direct addition is all that's needed";
    -1 "";
    -1 "Goal:";
    -1 "- Return the correct sum of the two inputs";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "num1:2;";
    -1 "num2:2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ solveMeFirst[num1; num2]
solveMeFirst:{[num1; num2]
  num1 + num2
 };
/ =============================================================


/ Solution Info (alternate) ====================================
/ Plus-reduce fold over the pair instead of direct addition.
/ solveMeFirst2[num1;num2]
solveMeFirst2:{[num1;num2]
  (+/) (num1;num2)
 };
/ =============================================================
