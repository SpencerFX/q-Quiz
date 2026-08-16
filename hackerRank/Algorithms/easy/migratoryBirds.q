//====================================================================
// Migratory Birds
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.migratoryBirds.info[]
//====================================================================
.quiz.hackerRank.algorithms.migratoryBirds.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Migratory Birds";
    -1 "";
    -1 "Given an array of bird sightings where each element represents";
    -1 "the type ID of a bird, determine the most frequently sighted type.";
    -1 "";
    -1 "If more than one type has the highest frequency, choose the one";
    -1 "with the smallest ID.";
    -1 "";
    -1 "Task:";
    -1 "- Count the frequency of each bird type";
    -1 "- Identify the type with the highest frequency";
    -1 "- If there is a tie, return the smallest type ID";
    -1 "";
    -1 "Example:";
    -1 "arr = 1 4 4 4 5 3";
    -1 "";
    -1 "Frequencies:";
    -1 "1 -> 1";
    -1 "3 -> 1";
    -1 "4 -> 3";
    -1 "5 -> 1";
    -1 "";
    -1 "Result:";
    -1 "4";
    -1 "";
    -1 "Function Description:";
    -1 "migratoryBirds takes:";
    -1 "  - arr: array of integers representing bird type IDs";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the most frequently sighted bird type";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of sightings)";
    -1 "- Second line: n space-separated integers (bird type IDs)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the most common bird type";
    -1 "";
    -1 "Constraints:";
    -1 "- 5 <= n <= 2 x 10^5";
    -1 "- 1 <= arr[i] <= 5";
    -1 "";
    -1 "Notes:";
    -1 "- Bird type IDs are limited to values 1 through 5";
    -1 "- Efficient approach:";
    -1 "    - Use a frequency count array of size 5";
    -1 "    - Track counts for each type";
    -1 "    - Find the maximum frequency";
    -1 "    - Return the smallest ID among those with max frequency";
    -1 "- Time complexity should be O(n)";
    -1 "";
    -1 "Goal:";
    -1 "- Accurately count occurrences";
    -1 "- Resolve ties by selecting the smallest ID";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "arr:1 4 4 4 5 3;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ migratoryBirds arr
migratoryBirds:{[arr]
  t:count each group arr;
  where t=max t
  };
/ =============================================================


/ Solution Info (alternate) ====================================
/ Counts against a fixed 1-5 ID range directly (as the question's
/ own notes suggest) instead of grouping by observed value - also
/ correctly resolves ties to the smallest ID, since ids is already
/ ascending.
/ migratoryBirds2 arr
migratoryBirds2:{[arr]
  ids:1+til 5;
  counts:{[arr;id] sum arr=id}[arr;] each ids;
  ids first where counts=max counts
 };
/ =============================================================
