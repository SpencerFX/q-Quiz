/ Question Info ===============================================
/ Binary Search Tree Insertion

/ You are given the root of a Binary Search Tree (BST) and a value
/ to insert into the tree.

/ A Binary Search Tree has the following properties:
/ - The left subtree of a node contains only values less than the node's value
/ - The right subtree contains only values greater than the node's value
/ - Both left and right subtrees are also BSTs

/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)

/ Task:
/ - Insert the given value into the BST
/ - Maintain the BST property
/ - Return the root of the updated tree

/ Example:
/ Input Tree:
/        4
/       / \
/      2   7
/     / \
/    1   3

/ Insert: 6

/ Result:
/        4
/       / \
/      2   7
/     / \  /
/    1   3 6

/ Function Description:
/ insert takes:
/   - root: reference to the root node of the BST
/   - data: integer value to insert

/ Returns:
/   - reference to the root of the updated BST

/ Input Format:
/ - First line: integer t (number of nodes)
/ - Next t lines: each line contains an integer to insert

/ Constraints:
/ - 1 ≤ t ≤ 1000
/ - 0 ≤ data ≤ 1000

/ Notes:
/ - If the tree is empty, the new node becomes the root
/ - Traverse the tree:
/     - Go left if data is less than current node
/     - Go right if data is greater than current node
/ - Insert at the correct null position

/ Goal:
/ - Maintain BST properties during insertion
/ - Return the updated tree structure
/ =============================================================


/ Input Info ==================================================
/root:();
/vals:4 2 7 1 3 6;
/binarySearchTreeInsertion/[root;vals]
/ treeLevelOrderTraversal binarySearchTreeInsertion/[root;vals];
/ =============================================================


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