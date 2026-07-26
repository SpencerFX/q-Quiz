/Question Info ===============================================
/
Birthday Cake Candles

You are in charge of the cake for a child's birthday. The cake has
candles, and each candle has a height.

The child can only blow out the tallest candles.

Your task is to determine how many candles are the tallest.

Task:
- Identify the maximum height among the candles
- Count how many candles have that height
- Return that count

Example:
candles = 4 4 1 3

Tallest height = 4
Count = 2

Result:
2

Function Description:
birthdayCakeCandles takes:
  - candles: array of integers representing candle heights

Returns:
  - integer count of the tallest candles

Input Format:
- First line: integer n (number of candles)
- Second line: n space-separated integers representing heights

Output Format:
- Return a single integer representing the count of tallest candles

Constraints:
- 1 ≤ n ≤ 10^5
- 1 ≤ candles[i] ≤ 10^7

Notes:
- A simple approach:
    maxHeight = max(candles)
    count = number of occurrences of maxHeight
- Efficient solution should run in O(n)

Goal:
- Correctly identify the maximum value
- Count its frequency efficiently
\
/=============================================================


/ Input Info ==================================================
input: 4 4 1 3f;
/ =============================================================


/ Solution Info ===============================================
/ birthdayCakeCandles input 
birthdayCakeCandles:{[heights] sum heights = max heights};
/ =============================================================