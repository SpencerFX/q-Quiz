//====================================================================
// Staircase
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.staircase.info[]
//====================================================================
.quiz.hackerRank.algorithms.staircase.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Staircase";
    -1 "";
    -1 "Given a positive integer n, print a staircase of height n using";
    -1 "the '#' symbol and spaces.";
    -1 "";
    -1 "The staircase should be right-aligned, meaning:";
    -1 "- The last line has n '#' characters";
    -1 "- Each preceding line has one fewer '#'";
    -1 "- Leading spaces are used to align the staircase to the right";
    -1 "";
    -1 "Task:";
    -1 "- Print n lines";
    -1 "- For each line i (1 to n):";
    -1 "    - Print (n - i) spaces followed by i '#' characters";
    -1 "";
    -1 "Example:";
    -1 "n = 4";
    -1 "";
    -1 "Output:";
    -1 "   #";
    -1 "  ##";
    -1 " ###";
    -1 "####";
    -1 "";
    -1 "Explanation:";
    -1 "- Line 1: 3 spaces + 1 '#'";
    -1 "- Line 2: 2 spaces + 2 '#'";
    -1 "- Line 3: 1 space  + 3 '#'";
    -1 "- Line 4: 0 spaces + 4 '#'";
    -1 "";
    -1 "Function Description:";
    -1 "staircase takes:";
    -1 "  - n: integer height of the staircase";
    -1 "";
    -1 "Returns:";
    -1 "  - None (prints pattern to standard output)";
    -1 "";
    -1 "Input Format:";
    -1 "- A single integer n";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Use spaces (' ') for padding";
    -1 "- Ensure right alignment";
    -1 "- Each line should be printed separately";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly format and print the staircase pattern";
    -1 "- Maintain proper spacing and alignment";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n:6;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ staircase n
staircase:{[n] {((x-y)#" "), y#"#"}[n;]each 1+til n};
/ =============================================================


/ Solution Info (alternate) ====================================
/ Over-builds "n spaces + i hashes" then right-truncates to n
/ chars with a negative take, instead of computing the pad
/ length directly.
/ staircase2 n
staircase2:{[n]
  {[n;i] (neg n)#(n#" "),i#"#"}[n;] each 1+til n
 };
/ =============================================================
