/Question Info ===============================================
/
Number Line Jumps

You are choreographing a circus show with two kangaroos on a number line.

- The first kangaroo starts at position x1 and moves at a rate of v1 per jump
- The second kangaroo starts at position x2 and moves at a rate of v2 per jump

You want to determine if there exists a non-negative integer number of jumps
after which both kangaroos will land at the same location at the same time.

Task:
- Determine whether the two kangaroos can land on the same position
- Return "YES" if they can, otherwise return "NO"

Example:
x1 = 0, v1 = 3
x2 = 4, v2 = 2

After jumps:
Jump 1 → positions: 3 and 6
Jump 2 → positions: 6 and 8
Jump 3 → positions: 9 and 10
Jump 4 → positions: 12 and 12

Result:
YES

Function Description:
kangaroo takes:
  - x1: integer (starting position of kangaroo 1)
  - v1: integer (jump distance of kangaroo 1)
  - x2: integer (starting position of kangaroo 2)
  - v2: integer (jump distance of kangaroo 2)

Returns:
  - string: "YES" or "NO"

Input Format:
- A single line with four space-separated integers:
  x1 v1 x2 v2

Output Format:
- Print "YES" if the kangaroos land on the same location at the same time
- Otherwise print "NO"

Constraints:
- 0 ≤ x1 < x2 ≤ 10000
- 1 ≤ v1, v2 ≤ 10000

Notes:
- Positions after n jumps:
    kangaroo1 = x1 + n * v1
    kangaroo2 = x2 + n * v2
- Solve:
    x1 + n*v1 = x2 + n*v2
    → n = (x2 - x1) / (v1 - v2)
- Conditions:
    - n must be a non-negative integer
    - v1 must be greater than v2 (otherwise they never meet)

Goal:
- Determine if a valid integer solution exists
- Avoid brute-force simulation when possible
\
/=============================================================


/ Input Info ==================================================
input: (0;3;4;2);
/ =============================================================


/ Solution Info ===============================================
/ numberLineJumps[0;3;4;2]
numberLineJumps:{[x1;v1;x2;v2] $[(v1>v2) & 0=(x2-x1) mod (v1-v2); `YES; `NO]}
/ =============================================================