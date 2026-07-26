/ Question Info ===============================================
/ Tree: Preorder Traversal

/ Given the root of a binary tree, perform a preorder traversal
/ of the tree and print the values of the nodes.
 
/ Preorder traversal visits nodes in the following order:
/ - Root node
/ - Left subtree
/ - Right subtree

/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)
 
/ Task:
/ - Traverse the binary tree using preorder traversal
/ - Print the node values in the correct order

/ Example:
/        1
/         \
/          2
/         /
/        3

/ Preorder traversal:
/ 1 2 3

/ Explanation:
/ - Visit root (1)
/ - Traverse right subtree:
/     - Visit root (2)
/     - Traverse left child (3)
 
/ Function Description:
/ preOrder takes:
/   - root: reference to the root node of the binary tree

/ Returns:
/   - None (prints values to standard output in order)
 
/ Input Format:
/ - First line: integer n (number of nodes)
/ - Next n lines: each line contains an integer to insert into the tree

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Do not modify the tree
/ - You may use recursion or an explicit stack
/ - Output values should be space-separated (or line-separated per platform)

/ Goal:
/ - Correctly implement preorder traversal
/ - Ensure nodes are visited in root-left-right order
/ =============================================================


/ Input Info ==================================================
t4:(`v`l`r)!(4;0N;0N);
t3:(`v`l`r)!(3;0N;t4);
t6:(`v`l`r)!(6;0N;0N);
t5:(`v`l`r)!(5;t3;t6);
t2:(`v`l`r)!(2;0N;t5);
t1:(`v`l`r)!(1;0N;t2);
/ =============================================================


/ Solution Info ===============================================
/ treePreorderTraversal t1
treePreorderTraversal:{
  if[x~0N; :()];
  (enlist x`v), treePreorderTraversal[x`l], treePreorderTraversal[x`r]
 };
/ =============================================================