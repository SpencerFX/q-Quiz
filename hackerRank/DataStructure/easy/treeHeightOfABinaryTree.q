/ Question Info ===============================================
/ Tree: Height of a Binary Tree

/ Given the root of a binary tree, determine the height of the tree.
 
/ The height of a binary tree is defined as the number of edges
/ on the longest path from the root node to a leaf node.
 
/ A leaf node is a node with no children.
 
/ Each node contains:
/ - data: integer value
/ - left: reference to left child (or null)
/ - right: reference to right child (or null)
 
/ Task:
/ - Compute and return the height of the binary tree

/ Example:
/        3
/       / \
/      5   2
/     / \
/    1   4

/ Height = 2

/ Explanation:
/ - Longest path: 3 -> 5 -> 1 (or 3 -> 5 -> 4)
/ - Number of edges = 2

/ Function Description:
/ height takes:
/   - root: reference to the root node of the binary tree

/ Returns:
/   - integer representing the height of the tree

/ Input Format:
/ - First line: integer n (number of nodes)
/ - Next n lines: each line contains an integer to insert into the tree

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Height is measured in edges, not nodes
/ - A tree with only one node has height 0
/ - You may use recursion or iterative traversal (e.g., BFS/DFS)

/ Goal:
/ - Efficiently compute the maximum depth of the tree
/ - Return the correct height based on definition
/ =============================================================


/ Input Info ==================================================
/ nullNode:()!();
t4:(`v`l`r)!(4;();());
t3:(`v`l`r)!(3;();t4);
t6:(`v`l`r)!(6;();());
t5:(`v`l`r)!(5;t3;t6);
t2:(`v`l`r)!(2;();t5);
t1:(`v`l`r)!(1;();t2);
/ =============================================================

/ Solution Info ===============================================
/ treeHeightOfABinaryTree t1
treeHeightOfABinaryTree:{[x]
  $[99h=type x;
    1 + max(treeHeightOfABinaryTree[x`l]; treeHeightOfABinaryTree[x`r]);
    -1
  ]
 };
/ =============================================================