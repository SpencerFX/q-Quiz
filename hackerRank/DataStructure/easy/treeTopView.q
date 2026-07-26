/ Question Info ===============================================
/ Tree: Top View

/ Given the root of a binary tree, print the top view of the tree.
 
/ The top view of a binary tree is the set of nodes visible when
/ the tree is viewed from above.
 
/ For each horizontal distance from the root, only the first node
/ encountered (from top to bottom) is included in the top view.
 
/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)
 
/ Horizontal Distance (HD):
/ - Root node has HD = 0
/ - Left child has HD = parent HD - 1
/ - Right child has HD = parent HD + 1

/ Task:
/ - Determine the top view of the binary tree
/ - Print node values from leftmost HD to rightmost HD

/ Example:
/         1
/        / \
/       2   3
/        \   \
/         4   5
/            /
/           6

/ Top View:
/ 2 1 3 5

/ Explanation:
/ - HD -1: node 2
/ - HD  0: node 1
/ - HD +1: node 3
/ - HD +2: node 5
/ - Nodes 4 and 6 are hidden from the top view

/ Function Description:
/ topView takes:
/   - root: reference to the root node of the binary tree

/ Returns:
/   - None (prints values to standard output in order)
 
/ Input Format:
/ - First line: integer n (number of nodes)
/ - Next n lines: each line contains an integer to insert into the tree

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Use a breadth-first traversal (level order) to ensure top-most nodes
/ - Track horizontal distance for each node
/ - Store the first node encountered at each HD
/ - Output should be ordered from smallest to largest HD

/ Goal:
/ - Identify visible nodes from the top perspective
/ - Maintain correct horizontal ordering
/ =============================================================


/ Input Info ==================================================
/ define nodes with data/left/right
t6:(`data`left`right)!(6;();());
t5:(`data`left`right)!(5;t6;());
t4:(`data`left`right)!(4;();());
t3:(`data`left`right)!(3;();t5);
t2:(`data`left`right)!(2;();t4);
t1:(`data`left`right)!(1;t2;t3);
/ =============================================================


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