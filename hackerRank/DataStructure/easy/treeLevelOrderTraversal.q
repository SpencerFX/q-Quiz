/ Question Info ===============================================
/ Tree: Level Order Traversal

/ Given the root of a binary tree, perform a level order traversal
/ (also known as breadth-first traversal) and print the values of
/ the nodes.
 
/ Level order traversal visits nodes level by level from left to right.
 
/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)
 
/ Task:
/ - Traverse the binary tree level by level
/ - Print the node values in traversal order

/ Example:
/        1
/       / \
/      2   3
/     / \
//    4   5

/ Level order traversal:
/ 1 2 3 4 5

/ Explanation:
/ - Visit root (1)
/ - Visit next level (2, 3)
/ - Visit next level (4, 5)
 
/ Function Description:
/ levelOrder takes:
/   - root: reference to the root node of the binary tree

/ Returns:
/   - None (prints values to standard output in order)
 
/ Input Format:
/ - First line: integer n (number of nodes)
/ - Next n lines: each line contains an integer to insert into the tree

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Use a queue to process nodes level by level
/ - Do not modify the tree
/ - Output values should be space-separated (or line-separated per platform)
 
/ Goal:
/ - Implement breadth-first traversal correctly
/ - Ensure nodes are visited level by level from left to right
/ =============================================================


/ Input Info ==================================================
t4:(`data`left`right)!(4;();());
t5:(`data`left`right)!(5;();());
t2:(`data`left`right)!(2;t4;t5);
t3:(`data`left`right)!(3;();());
t1:(`data`left`right)!(1;t2;t3);
/ =============================================================


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