//====================================================================
// Tree: Top View
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.treeTopView.info[]
//====================================================================
.quiz.hackerRank.dataStructures.treeTopView.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Tree: Top View";
    -1 "";
    -1 "Given the root of a binary tree, print the top view of the tree.";
    -1 "";
    -1 "The top view of a binary tree is the set of nodes visible when";
    -1 "the tree is viewed from above.";
    -1 "";
    -1 "For each horizontal distance from the root, only the first node";
    -1 "encountered (from top to bottom) is included in the top view.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- left: reference to left child (or null)";
    -1 "- right: reference to right child (or null)";
    -1 "";
    -1 "Horizontal Distance (HD):";
    -1 "- Root node has HD = 0";
    -1 "- Left child has HD = parent HD - 1";
    -1 "- Right child has HD = parent HD + 1";
    -1 "";
    -1 "Task:";
    -1 "- Determine the top view of the binary tree";
    -1 "- Print node values from leftmost HD to rightmost HD";
    -1 "";
    -1 "Example:";
    -1 "        1";
    -1 "       / \\";
    -1 "      2   3";
    -1 "       \\   \\";
    -1 "        4   5";
    -1 "           /";
    -1 "          6";
    -1 "";
    -1 "Top View:";
    -1 "2 1 3 5";
    -1 "";
    -1 "Explanation:";
    -1 "- HD -1: node 2";
    -1 "- HD  0: node 1";
    -1 "- HD +1: node 3";
    -1 "- HD +2: node 5";
    -1 "- Nodes 4 and 6 are hidden from the top view";
    -1 "";
    -1 "Function Description:";
    -1 "treeTopView takes:";
    -1 "  - root: reference to the root node of the binary tree (`data`left`right dict)";
    -1 "";
    -1 "Returns:";
    -1 "  - array of node values, ordered by horizontal distance";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of nodes)";
    -1 "- Next n lines: each line contains an integer to insert into the tree";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Use a breadth-first traversal (level order) to ensure top-most nodes";
    -1 "  are recorded first at each horizontal distance";
    -1 "- Track horizontal distance for each node";
    -1 "- Store the first node encountered at each HD";
    -1 "- Output should be ordered from smallest to largest HD";
    -1 "";
    -1 "Goal:";
    -1 "- Identify visible nodes from the top perspective";
    -1 "- Maintain correct horizontal ordering";
    -1 "";
    -1 "NOTE: this problem's input tree isn't wired up in";
    -1 "hackerRank/Inputs/dataStructures.q yet, so it isn't gradable via";
    -1 "the web judge yet - the tree below is illustrative only.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "t6:(`data`left`right)!(6;();());";
    -1 "t5:(`data`left`right)!(5;t6;());";
    -1 "t4:(`data`left`right)!(4;();());";
    -1 "t3:(`data`left`right)!(3;();t5);";
    -1 "t2:(`data`left`right)!(2;();t4);";
    -1 "t1:(`data`left`right)!(1;t2;t3);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ treeTopView t1
treeTopView:{[root]
  q:enlist (root;0);
  seen:()!();

  while[count q;
    cur:first q;
    q:1_ q;

    n:cur 0;
    h:cur 1;

    if[99h=type n;
      if[not h in key seen; seen:@[seen;h;:;n`data]];

      if[99h=type n`left; q,:enlist (n`left;h-1)];
      if[99h=type n`right; q,:enlist (n`right;h+1)]
    ]
  ];

  seen[asc key seen]
 };
/ =============================================================
