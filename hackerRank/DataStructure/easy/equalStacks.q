//====================================================================
// Equal Stacks
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.equalStacks.info[]
//====================================================================
.quiz.hackerRank.dataStructures.equalStacks.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Equal Stacks";
    -1 "";
    -1 "You are given three stacks of cylinders where each cylinder";
    -1 "has the same diameter but may have different heights.";
    -1 "The stacks are represented as arrays of integers, where each";
    -1 "integer denotes the height of a cylinder.";
    -1 "";
    -1 "The goal is to make all three stacks equal in height by removing";
    -1 "cylinders from the top of any stack.";
    -1 "";
    -1 "Task:";
    -1 "- Remove zero or more cylinders from the top of the stacks";
    -1 "- Ensure all three stacks have equal total height";
    -1 "- Return the maximum possible equal height";
    -1 "";
    -1 "Example:";
    -1 "h1 = 3 2 1 1 1";
    -1 "h2 = 4 3 2";
    -1 "h3 = 1 1 4 1";
    -1 "";
    -1 "Result:";
    -1 "5";
    -1 "";
    -1 "Explanation:";
    -1 "After removing cylinders from the top:";
    -1 "h1 -> 3 2";
    -1 "h2 -> 3 2";
    -1 "h3 -> 1 4";
    -1 "All stacks have height = 5";
    -1 "";
    -1 "Function Description:";
    -1 "equalStacks takes:";
    -1 "  - h1: array representing stack 1";
    -1 "  - h2: array representing stack 2";
    -1 "  - h3: array representing stack 3";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the maximum possible equal height";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: three integers n1, n2, n3 (sizes of stacks)";
    -1 "- Second line: n1 space-separated integers (stack h1)";
    -1 "- Third line: n2 space-separated integers (stack h2)";
    -1 "- Fourth line: n3 space-separated integers (stack h3)";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n1, n2, n3 <= 10^5";
    -1 "- 1 <= height of each cylinder <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- You can only remove cylinders from the top";
    -1 "- The order of cylinders must remain unchanged";
    -1 "- Total height of a stack is the sum of its elements";
    -1 "";
    -1 "Goal:";
    -1 "- Find the highest possible height where all stacks are equal";
    -1 "- Perform removals efficiently (avoid recomputing sums repeatedly)";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "h1:3 2 1 1 1;";
    -1 "h2:4 3 2;";
    -1 "h3:1 1 4 1;";
    -1 "/";
    -1 "/=============================================================";
 };


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
