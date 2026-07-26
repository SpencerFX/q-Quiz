/ Question Info ===============================================
/
Divisible Sum Pairs

You are given an array of integers and an integer k.

A pair of indices (i, j) is considered valid if:
- i < j
- (arr[i] + arr[j]) is divisible by k

Task:
- Determine the number of valid pairs

Example:
n = 6
k = 3
arr = 1 3 2 6 1 2

Pairs:
(1,3) → 1+2=3 ✔
(1,6) → 1+2=3 ✔
(3,6) → 2+1=3 ✔
(2,4) → 3+6=9 ✔
(4,5) → 6+1=7 ✘
...

Valid pairs count:
5

Result:
5

Function Description:
divisibleSumPairs takes:
  - n: integer (size of array)
  - k: integer (divisor)
  - arr: array of integers

Returns:
  - integer representing the number of valid pairs

Input Format:
- First line: two integers n and k
- Second line: n space-separated integers (array values)

Output Format:
- Single integer: number of valid pairs

Constraints:
- 1 ≤ n ≤ 100
- 1 ≤ k ≤ 100
- 1 ≤ arr[i] ≤ 100

Notes:
- Only consider pairs where i < j (no duplicates or reverse pairs)
- A pair is valid if:
    (arr[i] + arr[j]) mod k = 0
- Brute force (O(n^2)) works within constraints
- Optimized approach uses remainder counting

Goal:
- Correctly identify valid index pairs
- Efficiently count pairs whose sum is divisible by k
\
/=============================================================

/ Input Info ==================================================
/input1:3
/input2:1 3 2 6 1 2
/ =============================================================


/ Solution Info ===============================================
/divisibleSumPairs[input1;input2]
divisibleSumPairs:{[k;arr]
  comb:{[N;l]$[N=1;l;raze .z.s[N-1;l]{x,/:y where y>max x}\:l]};
  sum 0 = (sum each comb[2;input2]) mod k
 };
/ =============================================================