/ Question Info ===============================================
/ Tree: Postorder Traversal

/ Given the root of a binary tree, perform a postorder traversal
/ of the tree and print the values of the nodes.
 
/ Postorder traversal visits nodes in the following order:
/ - Left subtree
/ - Right subtree
/ - Root node

/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)
 
/ Task:
/ - Traverse the binary tree using postorder traversal
/ - Print the node values in the correct order

/ Example:
/        1
/         \
/          2
/         /
/        3

/ Postorder traversal:
/ 3 2 1

/ Explanation:
/ - Traverse left subtree (none for 1)
/ - Traverse right subtree:
/     - Traverse left child (3)
/     - Traverse right child (none)
/     - Visit root (2)
/ - Visit root (1)
 
/ Function Description:
/ postOrder takes:
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
/ - Correctly implement postorder traversal
/ - Ensure nodes are visited in left-right-root order
/ =============================================================


/ Input Info ==================================================
nullNode:()!();

t4:(`v`l`r)!(4;nullNode;nullNode);
t3:(`v`l`r)!(3;nullNode;t4);
t6:(`v`l`r)!(6;nullNode;nullNode);
t5:(`v`l`r)!(5;t3;t6);
t2:(`v`l`r)!(2;nullNode;t5);
t1:(`v`l`r)!(1;nullNode;t2);
/ =============================================================


/ Solution Info ===============================================
/ treePostorderTraversal t1
treePostorderTraversal:{
  if[0=count x; :()];
  treePostorderTraversal[x`l], treePostorderTraversal[x`r], enlist x`v
 };
/ =============================================================