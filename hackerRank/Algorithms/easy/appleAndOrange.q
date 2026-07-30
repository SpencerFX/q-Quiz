//====================================================================
// Apple and Orange
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.appleAndOrange.info[]
//====================================================================
.quiz.hackerRank.algorithms.appleAndOrange.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Apple and Orange";
    -1 "";
    -1 "Sam's house has an apple tree and an orange tree that yield fruit.";
    -1 "";
    -1 "- The house is located between points s and t (inclusive)";
    -1 "- The apple tree is located at point a";
    -1 "- The orange tree is located at point b";
    -1 "";
    -1 "When a fruit falls from its tree, it lands d units away from its tree.";
    -1 "";
    -1 "- Apples fall at distances given in array apples";
    -1 "- Oranges fall at distances given in array oranges";
    -1 "";
    -1 "Task:";
    -1 "- Determine how many apples and oranges land on Sam's house";
    -1 "";
    -1 "Example:";
    -1 "s = 7, t = 11";
    -1 "a = 5, b = 15";
    -1 "apples = -2 2 1";
    -1 "oranges = 5 -6";
    -1 "";
    -1 "Apple land positions:";
    -1 "5 + (-2) = 3";
    -1 "5 + 2 = 7";
    -1 "5 + 1 = 6";
    -1 "";
    -1 "-> Apples on house (7 to 11): 1";
    -1 "";
    -1 "Orange land positions:";
    -1 "15 + 5 = 20";
    -1 "15 + (-6) = 9";
    -1 "";
    -1 "-> Oranges on house (7 to 11): 1";
    -1 "";
    -1 "Result:";
    -1 "1";
    -1 "1";
    -1 "";
    -1 "Function Description:";
    -1 "countApplesAndOranges takes:";
    -1 "  - s: integer (start of house range)";
    -1 "  - t: integer (end of house range)";
    -1 "  - a: integer (position of apple tree)";
    -1 "  - b: integer (position of orange tree)";
    -1 "  - apples: array of integers (distances apples fall)";
    -1 "  - oranges: array of integers (distances oranges fall)";
    -1 "";
    -1 "Returns:";
    -1 "  - None (prints two integers on separate lines)";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: two integers s and t";
    -1 "- Second line: two integers a and b";
    -1 "- Third line: two integers m and n (counts of apples and oranges)";
    -1 "- Fourth line: m space-separated integers (apple distances)";
    -1 "- Fifth line: n space-separated integers (orange distances)";
    -1 "";
    -1 "Output Format:";
    -1 "- First line: number of apples on the house";
    -1 "- Second line: number of oranges on the house";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= s < t <= 10^5";
    -1 "- 1 <= a < b <= 10^5";
    -1 "- 1 <= m, n <= 10^5";
    -1 "- -10^5 <= apples[i], oranges[i] <= 10^5";
    -1 "";
    -1 "Notes:";
    -1 "- Final position of fruit:";
    -1 "    applePosition = a + apples[i]";
    -1 "    orangePosition = b + oranges[i]";
    -1 "- Count how many fall within range [s, t]";
    -1 "- Inclusive bounds: s <= position <= t";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly compute landing positions";
    -1 "- Efficiently count fruits within the house range";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "s:7;";
    -1 "t:11;";
    -1 "a:5;";
    -1 "b:15;";
    -1 "apples:-2 2 1;";
    -1 "oranges:5 -6;";
    -1 "/";
    -1 "/=============================================================";
 };
/=============================================================


/ Solution Info ===============================================
/appleAndOrange[s;t;a;b;apples;oranges]
appleAndOrange:{[s;t;a;b;apples;oranges]
  applePos:a + apples;
  orangePos:b + oranges;
  appleHits:sum ((applePos>=s) & (applePos<=t));
  orangeHits:sum ((orangePos>=s) & (orangePos<=t));
  (appleHits; orangeHits)
 };
/ =============================================================