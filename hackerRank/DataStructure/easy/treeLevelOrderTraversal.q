//====================================================================
// Tree: Level Order Traversal
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.treeLevelOrderTraversal.info[]
//====================================================================
.quiz.hackerRank.dataStructures.treeLevelOrderTraversal.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Tree: Level Order Traversal";
    -1 "";
    -1 "Given the root of a binary tree, perform a level order traversal";
    -1 "(also known as breadth-first traversal) and print the values of";
    -1 "the nodes.";
    -1 "";
    -1 "Level order traversal visits nodes level by level from left to right.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- left: reference to left child (or null)";
    -1 "- right: reference to right child (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Traverse the binary tree level by level";
    -1 "- Print the node values in traversal order";
    -1 "";
    -1 "Example:";
    -1 "       1";
    -1 "      / \\";
    -1 "     2   3";
    -1 "    / \\";
    -1 "   4   5";
    -1 "";
    -1 "Level order traversal:";
    -1 "1 2 3 4 5";
    -1 "";
    -1 "Explanation:";
    -1 "- Visit root (1)";
    -1 "- Visit next level (2, 3)";
    -1 "- Visit next level (4, 5)";
    -1 "";
    -1 "Function Description:";
    -1 "treeLevelOrderTraversal takes:";
    -1 "  - root: reference to the root node of the binary tree (`data`left`right dict)";
    -1 "";
    -1 "Returns:";
    -1 "  - array of node values in level order";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of nodes)";
    -1 "- Next n lines: each line contains an integer to insert into the tree";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Use a queue to process nodes level by level";
    -1 "- Do not modify the tree";
    -1 "- Output values should be space-separated (or line-separated per platform)";
    -1 "";
    -1 "Goal:";
    -1 "- Implement breadth-first traversal correctly";
    -1 "- Ensure nodes are visited level by level from left to right";
    -1 "";
    -1 "NOTE: this problem's input tree isn't wired up in";
    -1 "hackerRank/Inputs/dataStructures.q yet, so it isn't gradable via";
    -1 "the web judge yet - the tree below is illustrative only.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "t4:(`data`left`right)!(4;();());";
    -1 "t5:(`data`left`right)!(5;();());";
    -1 "t2:(`data`left`right)!(2;t4;t5);";
    -1 "t3:(`data`left`right)!(3;();());";
    -1 "t1:(`data`left`right)!(1;t2;t3);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ treeLevelOrderTraversal t1
treeLevelOrderTraversal:{[root]
  q:enlist root;
  res:();

  while[count q;
    n:first q;
    q:1_ q;

    if[99h=type n;
      res,:enlist n`data;

      if[99h=type n`left;  q,:enlist n`left];
      if[99h=type n`right; q,:enlist n`right]
    ]
  ];

  res
 };
/ =============================================================
