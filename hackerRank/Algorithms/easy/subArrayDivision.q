/Question Info ===============================================
/
Subarray Division (Birthday Chocolate)

Lily has a chocolate bar represented as a sequence of integers,
where each integer denotes the number on a square of chocolate.

She wants to share the chocolate with Ron for his birthday.

To do this, she must find a contiguous segment of the bar such that:
- The segment contains exactly m squares
- The sum of the integers in the segment is equal to d

Task:
- Determine how many ways Lily can divide the chocolate
- Return the number of valid segments

Example:
s = 1 2 1 3 2
d = 3
m = 2

Possible segments of length 2:
[1,2] → sum = 3 ✓
[2,1] → sum = 3 ✓
[1,3] → sum = 4 ✗
[3,2] → sum = 5 ✗

Result:
2

Function Description:
birthday takes:
  - s: array of integers (chocolate squares)
  - d: integer (target sum)
  - m: integer (segment length)

Returns:
  - integer count of valid segments

Input Format:
- First line: integer n (length of array)
- Second line: n space-separated integers (array s)
- Third line: two integers d and m

Output Format:
- Return a single integer representing the number of valid segments

Constraints:
- 1 ≤ n ≤ 100
- 1 ≤ s[i] ≤ 5
- 1 ≤ d ≤ 31
- 1 ≤ m ≤ n

Notes:
- Use a sliding window of size m
- For each window:
    compute sum of elements
    compare with d
- Efficient approach:
    - Compute initial window sum
    - Slide window by removing left element and adding next element
    - Time complexity: O(n)

Goal:
- Count all contiguous subarrays of length m with sum equal to d
- Implement efficiently using a sliding window approach
\
/=============================================================


/ Input Info ==================================================
input: 1 2 1 3 2;
/ =============================================================


/ Solution Info ===============================================
/ subArrayDivision[input; 3; 2]
subArrayDivision:{[s;d;m]
  n:count s;
  idx:til n-m+1;
  window:{[s;m;x] sum s[x + til m]}[s;m] each idx;
  sum window = d
 }
/ =============================================================