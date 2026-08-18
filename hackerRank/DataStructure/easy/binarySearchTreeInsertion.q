//====================================================================
// Binary Search Tree Insertion
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.binarySearchTreeInsertion.info[]
//====================================================================
.quiz.hackerRank.dataStructures.binarySearchTreeInsertion.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Binary Search Tree Insertion";
    -1 "";
    -1 "You are given the root of a Binary Search Tree (BST) and a value";
    -1 "to insert into the tree.";
    -1 "";
    -1 "A Binary Search Tree has the following properties:";
    -1 "- The left subtree of a node contains only values less than the node's value";
    -1 "- The right subtree contains only values greater than the node's value";
    -1 "- Both left and right subtrees are also BSTs";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- left: reference to left child (or null)";
    -1 "- right: reference to right child (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Insert the given value into the BST";
    -1 "- Maintain the BST property";
    -1 "- Return the root of the updated tree";
    -1 "";
    -1 "Example:";
    -1 "Insert values 4 2 7 1 3 6 in order into an empty tree.";
    -1 "";
    -1 "Result (level order):";
    -1 "4 2 7 1 3 6";
    -1 "";
    -1 "Function Description:";
    -1 "binarySearchTreeInsertion takes:";
    -1 "  - root: reference to the root node of the BST (empty tree to start)";
    -1 "  - vals: array of integers to insert in order";
    -1 "";
    -1 "Returns:";
    -1 "  - the resulting tree's values in level order";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer t (number of values to insert)";
    -1 "- Next t lines: each line contains an integer to insert";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= t <= 1000";
    -1 "- 0 <= data <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- If the tree is empty, the new node becomes the root";
    -1 "- Traverse the tree:";
    -1 "    - Go left if data is less than current node";
    -1 "    - Go right if data is greater than current node";
    -1 "- Insert at the correct null position";
    -1 "";
    -1 "Goal:";
    -1 "- Maintain BST properties during insertion";
    -1 "- Return the updated tree structure";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "root:();";
    -1 "vals:4 2 7 1 3 6;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ binarySearchTreeInsertion[root;vals]
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

binarySearchTree:{[root;v]
  $[99h<>type root;
    (`data`left`right)!(v;();());
    $[v < root`data;
      (`data`left`right)!(root`data; binarySearchTree[root`left;v]; root`right);
      (`data`left`right)!(root`data; root`left; binarySearchTree[root`right;v])
    ]
  ]
 };

binarySearchTreeInsertion: {[root;vals] treeLevelOrderTraversal binarySearchTree/[root;vals]}
/ =============================================================
