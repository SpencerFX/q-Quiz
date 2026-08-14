//====================================================================
// Number Line Jumps
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.numberLineJumps.info[]
//====================================================================
.quiz.hackerRank.algorithms.numberLineJumps.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Number Line Jumps";
    -1 "";
    -1 "You are choreographing a circus show with two kangaroos on a number line.";
    -1 "";
    -1 "- The first kangaroo starts at position x1 and moves at a rate of v1 per jump";
    -1 "- The second kangaroo starts at position x2 and moves at a rate of v2 per jump";
    -1 "";
    -1 "You want to determine if there exists a non-negative integer number of jumps";
    -1 "after which both kangaroos will land at the same location at the same time.";
    -1 "";
    -1 "Task:";
    -1 "- Determine whether the two kangaroos can land on the same position";
    -1 "- Return \"YES\" if they can, otherwise return \"NO\"";
    -1 "";
    -1 "Example:";
    -1 "x1 = 0, v1 = 3";
    -1 "x2 = 4, v2 = 2";
    -1 "";
    -1 "After jumps:";
    -1 "Jump 1 -> positions: 3 and 6";
    -1 "Jump 2 -> positions: 6 and 8";
    -1 "Jump 3 -> positions: 9 and 10";
    -1 "Jump 4 -> positions: 12 and 12";
    -1 "";
    -1 "Result:";
    -1 "YES";
    -1 "";
    -1 "Function Description:";
    -1 "kangaroo takes:";
    -1 "  - x1: integer (starting position of kangaroo 1)";
    -1 "  - v1: integer (jump distance of kangaroo 1)";
    -1 "  - x2: integer (starting position of kangaroo 2)";
    -1 "  - v2: integer (jump distance of kangaroo 2)";
    -1 "";
    -1 "Returns:";
    -1 "  - string: \"YES\" or \"NO\"";
    -1 "";
    -1 "Input Format:";
    -1 "- A single line with four space-separated integers:";
    -1 "  x1 v1 x2 v2";
    -1 "";
    -1 "Output Format:";
    -1 "- Print \"YES\" if the kangaroos land on the same location at the same time";
    -1 "- Otherwise print \"NO\"";
    -1 "";
    -1 "Constraints:";
    -1 "- 0 <= x1 < x2 <= 10000";
    -1 "- 1 <= v1, v2 <= 10000";
    -1 "";
    -1 "Notes:";
    -1 "- Positions after n jumps:";
    -1 "    kangaroo1 = x1 + n * v1";
    -1 "    kangaroo2 = x2 + n * v2";
    -1 "- Solve:";
    -1 "    x1 + n*v1 = x2 + n*v2";
    -1 "    -> n = (x2 - x1) / (v1 - v2)";
    -1 "- Conditions:";
    -1 "    - n must be a non-negative integer";
    -1 "    - v1 must be greater than v2 (otherwise they never meet)";
    -1 "";
    -1 "Goal:";
    -1 "- Determine if a valid integer solution exists";
    -1 "- Avoid brute-force simulation when possible";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "x1:0;";
    -1 "v1:3;";
    -1 "x2:4;";
    -1 "v2:2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ numberLineJumps[x1;v1;x2;v2]
numberLineJumps:{[x1;v1;x2;v2] $[(v1>v2) & 0=(x2-x1) mod (v1-v2); `YES; `NO]}
/ =============================================================
