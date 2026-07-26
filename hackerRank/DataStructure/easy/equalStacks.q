/ Question Info ===============================================
/ Equal Stacks

/ You are given three stacks of cylinders where each cylinder
/ has the same diameter but may have different heights.
/ The stacks are represented as arrays of integers, where each
/ integer denotes the height of a cylinder.

/ The goal is to make all three stacks equal in height by removing
/ cylinders from the top of any stack.

/ Task:
/ - Remove zero or more cylinders from the top of the stacks
/ - Ensure all three stacks have equal total height
/ - Return the maximum possible equal height

/ Example:
/ h1 = [3, 2, 1, 1, 1]
/ h2 = [4, 3, 2]
/ h3 = [1, 1, 4, 1]

/ Result:
/ 5

/ Explanation:
/ After removing cylinders from the top:
/ h1 -> [3, 2]
/ h2 -> [3, 2]
/ h3 -> [1, 4]
/ All stacks have height = 5

/ Function Description:
/ equalStacks takes:
/   - h1: array representing stack 1
/   - h2: array representing stack 2
/   - h3: array representing stack 3

/ Returns:
/   - integer representing the maximum possible equal height

/ Input Format:
/ - First line: three integers n1, n2, n3 (sizes of stacks)
/ - Second line: n1 space-separated integers (stack h1)
/ - Third line: n2 space-separated integers (stack h2)
/ - Fourth line: n3 space-separated integers (stack h3)

/ Constraints:
/ - 1 ≤ n1, n2, n3 ≤ 10^5
/ - 1 ≤ height of each cylinder ≤ 100

/ Notes:
/ - You can only remove cylinders from the top
/ - The order of cylinders must remain unchanged
/ - Total height of a stack is the sum of its elements

/ Goal:
/ - Find the highest possible height where all stacks are equal
/ - Perform removals efficiently (avoid recomputing sums repeatedly)
/ =============================================================


/ Input Info ==================================================
/h1:3 2 1 1 1;
/h2:4 3 2;
/h3:1 1 4 1;
/((3 2 1 1 1);(4 3 2);(1 1 4 1))
/ =============================================================


/ Solution Info ===============================================
/ equalStacks[h1;h2;h3]
equalStacks:{[h1;h2;h3]
  / possible heights for each stack
  p1:(sum h1) - sums h1;
  p2:(sum h2) - sums h2;
  p3:(sum h3) - sums h3;

  / include full height as well
  p1:distinct p1,sum h1;
  p2:distinct p2,sum h2;
  p3:distinct p3,sum h3;

  / find common heights
  common: p1 inter p2 inter p3;

  / return max or 0 if none
  $[count common; max common; 0]
 };
/ =============================================================