//====================================================================
// Tree: Postorder Traversal
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.treePostorderTraversal.info[]
//====================================================================
.quiz.hackerRank.dataStructures.treePostorderTraversal.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Tree: Postorder Traversal";
    -1 "";
    -1 "Given the root of a binary tree, perform a postorder traversal";
    -1 "of the tree and print the values of the nodes.";
    -1 "";
    -1 "Postorder traversal visits nodes in the following order:";
    -1 "- Left subtree";
    -1 "- Right subtree";
    -1 "- Root node";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- left: reference to left child (or null)";
    -1 "- right: reference to right child (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Traverse the binary tree using postorder traversal";
    -1 "- Print the node values in the correct order";
    -1 "";
    -1 "Example:";
    -1 "     1";
    -1 "      \\";
    -1 "       2";
    -1 "      /";
    -1 "     3";
    -1 "";
    -1 "Postorder traversal:";
    -1 "3 2 1";
    -1 "";
    -1 "Explanation:";
    -1 "- Traverse left subtree (none for 1)";
    -1 "- Traverse right subtree:";
    -1 "    - Traverse left child (3)";
    -1 "    - Traverse right child (none)";
    -1 "    - Visit root (2)";
    -1 "- Visit root (1)";
    -1 "";
    -1 "Function Description:";
    -1 "treePostorderTraversal takes:";
    -1 "  - x: reference to the root node of the binary tree (`v`l`r dict)";
    -1 "";
    -1 "Returns:";
    -1 "  - array of node values in postorder sequence";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of nodes)";
    -1 "- Next n lines: each line contains an integer to insert into the tree";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Do not modify the tree";
    -1 "- You may use recursion or an explicit stack";
    -1 "- Output values should be space-separated (or line-separated per platform)";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly implement postorder traversal";
    -1 "- Ensure nodes are visited in left-right-root order";
    -1 "";
    -1 "NOTE: this problem's input tree isn't wired up in";
    -1 "hackerRank/Inputs/dataStructures.q yet, so it isn't gradable via";
    -1 "the web judge yet - the tree below is illustrative only.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "nullNode:()!();";
    -1 "t4:(`v`l`r)!(4;nullNode;nullNode);";
    -1 "t3:(`v`l`r)!(3;nullNode;t4);";
    -1 "t6:(`v`l`r)!(6;nullNode;nullNode);";
    -1 "t5:(`v`l`r)!(5;t3;t6);";
    -1 "t2:(`v`l`r)!(2;nullNode;t5);";
    -1 "t1:(`v`l`r)!(1;nullNode;t2);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ treePostorderTraversal t1
treePostorderTraversal:{
  if[0=count x; :()];
  treePostorderTraversal[x`l], treePostorderTraversal[x`r], enlist x`v
 };
/ =============================================================
