/Question Info ===============================================
/
Between Two Sets

There are two arrays of integers, a and b.

We say that an integer x is between the two arrays if:
- All elements in array a are factors of x
- x is a factor of all elements in array b

Task:
- Determine how many integers satisfy these conditions
- Return the count of such integers

Example:
a = 2 4
b = 16 32 96

Valid integers:
x = 4, 8, 16

Check:
- For a:
    2 divides x and 4 divides x
- For b:
    x divides 16, 32, and 96

Result:
3

Function Description:
getTotalX takes:
  - a: array of integers
  - b: array of integers

Returns:
  - integer count of valid integers

Input Format:
- First line: two integers n and m (sizes of arrays a and b)
- Second line: n space-separated integers (array a)
- Third line: m space-separated integers (array b)

Output Format:
- Return a single integer representing the count of valid integers

Constraints:
- 1 ≤ n, m ≤ 10
- 1 ≤ a[i], b[j] ≤ 100

Notes:
- A brute-force approach:
    - Iterate x from max(a) to min(b)
    - Check:
        all x mod a[i] = 0
        all b[j] mod x = 0
- Optimized approach:
    - Compute LCM of array a
    - Compute GCD of array b
    - Count multiples of LCM that evenly divide GCD

Goal:
- Identify all integers satisfying both factor conditions
- Implement efficiently using number theory where possible
\
/=============================================================


/ Input Info ==================================================
input1:2 4;
input2:16 32 96;
/ =============================================================


/ Solution Info ===============================================
/ betweenTwoSets[input1; input2]
betweenTwoSets:{[a;b]
  lo:max a;
  hi:min b;
  c:lo * (1 + til hi div lo);
  sum (all each (c mod\: a)=0) & (all each (b mod/: c)=0)
 };
/ =============================================================