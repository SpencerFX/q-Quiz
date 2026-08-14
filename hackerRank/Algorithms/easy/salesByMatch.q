//====================================================================
// Sales by Match (Sock Merchant)
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.salesByMatch.info[]
//====================================================================
.quiz.hackerRank.algorithms.salesByMatch.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Sales by Match (Sock Merchant)";
    -1 "";
    -1 "There is a pile of socks, each with a color represented by an integer.";
    -1 "";
    -1 "Your task is to determine how many matching pairs of socks there are.";
    -1 "";
    -1 "A pair consists of two socks of the same color.";
    -1 "";
    -1 "Task:";
    -1 "- Count how many pairs of matching socks exist in the array";
    -1 "";
    -1 "Example:";
    -1 "ar = 10 20 20 10 10 30 50 10 20";
    -1 "";
    -1 "Counts:";
    -1 "10 -> 4 occurrences -> 2 pairs";
    -1 "20 -> 3 occurrences -> 1 pair";
    -1 "30 -> 1 occurrence  -> 0 pairs";
    -1 "50 -> 1 occurrence  -> 0 pairs";
    -1 "";
    -1 "Total pairs:";
    -1 "2 + 1 = 3";
    -1 "";
    -1 "Result:";
    -1 "3";
    -1 "";
    -1 "Function Description:";
    -1 "sockMerchant takes:";
    -1 "  - n: integer (number of socks)";
    -1 "  - ar: array of integers representing sock colors";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing total number of matching pairs";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of socks)";
    -1 "- Second line: n space-separated integers (sock colors)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing the number of matching pairs";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 100";
    -1 "- 1 <= ar[i] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Count frequency of each color";
    -1 "- For each color:";
    -1 "    pairs = floor(count / 2)";
    -1 "- Sum pairs across all colors";
    -1 "- Efficient approach:";
    -1 "    - Use a frequency map or grouping";
    -1 "    - Time complexity O(n)";
    -1 "";
    -1 "Goal:";
    -1 "- Accurately count matching pairs";
    -1 "- Handle multiple colors efficiently";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "ar:10 20 20 10 10 30 50 10 20;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ salesByMatch ar
salesByMatch:{sum floor {x%2}count each group x}
/ =============================================================
