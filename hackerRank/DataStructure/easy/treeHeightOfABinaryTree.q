//====================================================================
// Tree: Height of a Binary Tree
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.treeHeightOfABinaryTree.info[]
//====================================================================
.quiz.hackerRank.dataStructures.treeHeightOfABinaryTree.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Tree: Height of a Binary Tree";
    -1 "";
    -1 "Given the root of a binary tree, determine the height of the tree.";
    -1 "";
    -1 "The height of a binary tree is defined as the number of edges";
    -1 "on the longest path from the root node to a leaf node.";
    -1 "";
    -1 "A leaf node is a node with no children.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- left: reference to left child (or null)";
    -1 "- right: reference to right child (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Compute and return the height of the binary tree";
    -1 "";
    -1 "Example:";
    -1 "       3";
    -1 "      / \\";
    -1 "     5   2";
    -1 "    / \\";
    -1 "   1   4";
    -1 "";
    -1 "Height = 2";
    -1 "";
    -1 "Explanation:";
    -1 "- Longest path: 3 -> 5 -> 1 (or 3 -> 5 -> 4)";
    -1 "- Number of edges = 2";
    -1 "";
    -1 "Function Description:";
    -1 "treeHeightOfABinaryTree takes:";
    -1 "  - x: reference to the root node of the binary tree (`v`l`r dict)";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the height of the tree";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of nodes)";
    -1 "- Next n lines: each line contains an integer to insert into the tree";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Height is measured in edges, not nodes";
    -1 "- A tree with only one node has height 0";
    -1 "- You may use recursion or iterative traversal (e.g., BFS/DFS)";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently compute the maximum depth of the tree";
    -1 "- Return the correct height based on definition";
    -1 "";
    -1 "NOTE: this problem's input tree isn't wired up in";
    -1 "hackerRank/Inputs/dataStructures.q yet, so it isn't gradable via";
    -1 "the web judge yet - the tree below is illustrative only.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "t4:(`v`l`r)!(4;();());";
    -1 "t3:(`v`l`r)!(3;();t4);";
    -1 "t6:(`v`l`r)!(6;();());";
    -1 "t5:(`v`l`r)!(5;t3;t6);";
    -1 "t2:(`v`l`r)!(2;();t5);";
    -1 "t1:(`v`l`r)!(1;();t2);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ treeHeightOfABinaryTree t1
treeHeightOfABinaryTree:{[x]
  $[99h=type x;
    1 + max(treeHeightOfABinaryTree[x`l]; treeHeightOfABinaryTree[x`r]);
    -1
  ]
 };
/ =============================================================
