.quiz.hackerRank.sql.binaryTreeNodes.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Binary Tree Nodes";
    -1 "======================================";
    -1 "";
    -1 "BST holds the nodes of a binary tree, where N is a node and P";
    -1 "is its parent (null for the root). Classify every node as";
    -1 "Root (no parent), Leaf (has a parent, but is nobody's parent),";
    -1 "or Inner (has a parent and is at least one other node's";
    -1 "parent).";
    -1 "";
    -1 "Table: BST(N;P)";
    -1 "";
    -1 "Task:";
    -1 "- Classify every N, sorted by N ascending";
    -1 "";
    -1 "Function Description:";
    -1 "binaryTreeNodes takes no arguments - query the global BST table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per node, \"N Role\", sorted by N";
 };


/ Solution Info ===============================================
/ binaryTreeNodes[]

binaryTreeNodes:{[]
  parents:exec P from BST;
  {[parents;row]
    role:$[null row`P; `Root; (row`N) in parents; `Inner; `Leaf];
    " " sv (string row`N; string role)
   }[parents;] each `N xasc BST
 };
/ =============================================================
