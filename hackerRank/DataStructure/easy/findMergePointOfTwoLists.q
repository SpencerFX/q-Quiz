/ Question Info ===============================================
/ Find Merge Point of Two Lists

/ You are given the heads of two singly linked lists.
/ These two lists may merge at some point, forming a Y-shaped structure.
 
/ After the merge point, both lists share the same nodes.
/ Your task is to find the data value of the node where the merge begins.
 
/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null)
 
/ Task:
/ - Identify the node where the two linked lists merge
/ - Return the data value stored in that node
 
/ Example:
/ List A: 1 → 2 → 3 \
/                      → 7 → 8 → null
/ List B:       4 → 5 /
 
/ Merge Point:
/// Node with value 7
 
/ Result:
/ 7
 
/ Explanation:
/ - Both lists eventually point to the same node (by reference, not value)
/ - The first shared node is the merge point
 
/ Function Description:
/ findMergeNode takes:
/   - headA: reference to head of first linked list
/   - headB: reference to head of second linked list
 
/ Returns:
/   - integer representing the data value at the merge point
 
/ Input Format:
/ - The test harness constructs two linked lists
/ - Nodes are connected such that they share a common tail
/ - You are given references to the heads of both lists
 
/ Constraints:
/ - The number of nodes in each list ≤ 10^5
/ - Node values are integers
/ - There is guaranteed to be a merge point
 
/ Notes:
/ - Comparison must be done using node reference, NOT node value
/ - Two nodes with the same value are not necessarily the same node
/ - Do not modify the linked lists
 
/ Goal:
/ - Efficiently detect the merge point
/ - Avoid extra memory if possible
/ - Aim for O(n) time complexity
/==============================================================


/ Input Info ==================================================
/ shared tail
n8:(`v`n)!(8;::);
n7:(`v`n)!(7;n8);

/ list A
n3:(`v`n)!(3;n7);
n2:(`v`n)!(2;n3);
n1:(`v`n)!(1;n2);

/ list B
n5:(`v`n)!(5;n7);
n4:(`v`n)!(4;n5);
/ =============================================================


/ Solution Info ===============================================
/ findMergePointOfTwoLists[n1;n3]
findMergePointOfTwoLists:{[a;b]
  pa:a;
  pb:b;
  while[not pa ~ pb;
    pa:$[99h = type pa; pa`n; b];
    pb:$[99h = type pb; pb`n; a];
  ];
  pa`v
 };
/ =============================================================