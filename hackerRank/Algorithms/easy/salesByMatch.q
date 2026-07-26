/Question Info ===============================================
/
Sales by Match (Sock Merchant)

There is a pile of socks, each with a color represented by an integer.

Your task is to determine how many matching pairs of socks there are.

A pair consists of two socks of the same color.

Task:
- Count how many pairs of matching socks exist in the array

Example:
ar = 10 20 20 10 10 30 50 10 20

Counts:
10 → 4 occurrences → 2 pairs
20 → 3 occurrences → 1 pair
30 → 1 occurrence  → 0 pairs
50 → 1 occurrence  → 0 pairs

Total pairs:
2 + 1 = 3

Result:
3

Function Description:
sockMerchant takes:
  - n: integer (number of socks)
  - ar: array of integers representing sock colors

Returns:
  - integer representing total number of matching pairs

Input Format:
- First line: integer n (number of socks)
- Second line: n space-separated integers (sock colors)

Output Format:
- Return a single integer representing the number of matching pairs

Constraints:
- 1 ≤ n ≤ 100
- 1 ≤ ar[i] ≤ 100

Notes:
- Count frequency of each color
- For each color:
    pairs = floor(count / 2)
- Sum pairs across all colors
- Efficient approach:
    - Use a frequency map or grouping
    - Time complexity O(n)

Goal:
- Accurately count matching pairs
- Handle multiple colors efficiently
\
/=============================================================


/ Input Info ==================================================
input:10 20 20 10 10 30 50 10 20
/ =============================================================


/ Solution Info ===============================================
/ salesByMatch input
salesByMatch:{sum floor {x%2}count each group x}
/ =============================================================