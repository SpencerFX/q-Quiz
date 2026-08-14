//====================================================================
// Left Rotation
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.leftRotation.info[]
//====================================================================
.quiz.hackerRank.dataStructures.leftRotation.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Left Rotation";
    -1 "";
    -1 "Given an array of integers and a number of rotations,";
    -1 "perform left rotations on the array.";
    -1 "";
    -1 "A left rotation shifts each element of the array to the left";
    -1 "by one position. The first element moves to the end of the array.";
    -1 "";
    -1 "Task:";
    -1 "- Rotate the array to the left by d positions";
    -1 "- Return the resulting array";
    -1 "";
    -1 "Example:";
    -1 "arr = 1 2 3 4 5";
    -1 "d = 2";
    -1 "";
    -1 "After 1 rotation: 2 3 4 5 1";
    -1 "After 2 rotations: 3 4 5 1 2";
    -1 "";
    -1 "Result:";
    -1 "3 4 5 1 2";
    -1 "";
    -1 "Function Description:";
    -1 "leftRotation takes:";
    -1 "  - d: number of left rotations";
    -1 "  - arr: array of integers";
    -1 "";
    -1 "Returns:";
    -1 "  - array of integers after rotation";
    -1 "";
    -1 "Input Format:";
    -1 "- First line contains two integers n and d";
    -1 "- Second line contains n space-separated integers";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 10^5";
    -1 "- 1 <= d <= n";
    -1 "";
    -1 "Notes:";
    -1 "- Rotations wrap around the array";
    -1 "- Rotating by n results in the same array";
    -1 "- Rotating by d > n is equivalent to d mod n";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently perform the rotation";
    -1 "- Avoid unnecessary repeated shifts";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "d:2;";
    -1 "arr:1 2 3 4 5;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ leftRotation[d;arr]
leftRotation:{[d;arr]
  / (d mod count arr) rotate arr
  d rotate arr
 }
/ =============================================================
