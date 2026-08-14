//====================================================================
// Counting Valleys
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.countingValleys.info[]
//====================================================================
.quiz.hackerRank.algorithms.countingValleys.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Counting Valleys";
    -1 "";
    -1 "An avid hiker keeps track of their hikes using a sequence of steps.";
    -1 "";
    -1 "- Each step is represented by a character:";
    -1 "    'U' -> step up";
    -1 "    'D' -> step down";
    -1 "";
    -1 "A valley is defined as a sequence of consecutive steps below sea level,";
    -1 "starting with a step down from sea level and ending with a step up to sea level.";
    -1 "";
    -1 "Task:";
    -1 "- Determine the number of valleys walked through during the hike";
    -1 "";
    -1 "Example:";
    -1 "steps = 8";
    -1 "path = \"UDDDUDUU\"";
    -1 "";
    -1 "Process:";
    -1 "Start at sea level (0)";
    -1 "";
    -1 "U -> 1";
    -1 "D -> 0";
    -1 "D -> -1 (enter valley)";
    -1 "D -> -2";
    -1 "U -> -1";
    -1 "D -> -2";
    -1 "U -> -1";
    -1 "U -> 0 (exit valley -> count = 1)";
    -1 "";
    -1 "Result:";
    -1 "1";
    -1 "";
    -1 "Function Description:";
    -1 "countingValleys takes:";
    -1 "  - steps: integer (number of steps)";
    -1 "  - path: string of 'U' and 'D'";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing number of valleys";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer steps";
    -1 "- Second line: string path";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing number of valleys";
    -1 "";
    -1 "Constraints:";
    -1 "- 2 <= steps <= 10^6";
    -1 "- path consists only of characters 'U' and 'D'";
    -1 "";
    -1 "Notes:";
    -1 "- Track current altitude starting at 0";
    -1 "- A valley is counted when:";
    -1 "    - A step up ('U') brings altitude from -1 to 0";
    -1 "- Efficient approach:";
    -1 "    - Iterate once through path";
    -1 "    - Update altitude for each step";
    -1 "    - Count valley exits";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly track altitude changes";
    -1 "- Identify valley transitions accurately";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "path:\"UDDDUDUU\";";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ countingValleys input
countingValleys:{[p]
  steps:1 - 2 *' (p="D");
  level:sums steps;
  sum (level=0) & (steps=1)
 };
/ =============================================================
