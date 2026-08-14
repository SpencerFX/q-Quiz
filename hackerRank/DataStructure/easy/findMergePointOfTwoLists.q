//====================================================================
// Find Merge Point of Two Lists
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.findMergePointOfTwoLists.info[]
//====================================================================
.quiz.hackerRank.dataStructures.findMergePointOfTwoLists.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Find Merge Point of Two Lists";
    -1 "";
    -1 "You are given the heads of two singly linked lists.";
    -1 "These two lists may merge at some point, forming a Y-shaped structure.";
    -1 "";
    -1 "After the merge point, both lists share the same nodes.";
    -1 "Your task is to find the data value of the node where the merge begins.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Identify the node where the two linked lists merge";
    -1 "- Return the data value stored in that node";
    -1 "";
    -1 "Example:";
    -1 "List A: 1 -> 2 -> 3 -\\";
    -1 "                       -> 7 -> 8 -> null";
    -1 "List B:        4 -> 5 -/";
    -1 "";
    -1 "Merge Point:";
    -1 "Node with value 7";
    -1 "";
    -1 "Result:";
    -1 "7";
    -1 "";
    -1 "Explanation:";
    -1 "- Both lists eventually point to the same node (by reference, not value)";
    -1 "- The first shared node is the merge point";
    -1 "";
    -1 "Function Description:";
    -1 "findMergePointOfTwoLists takes:";
    -1 "  - a: reference to head of first linked list";
    -1 "  - b: reference to head of second linked list";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing the data value at the merge point";
    -1 "";
    -1 "Input Format:";
    -1 "- The test harness constructs two linked lists";
    -1 "- Nodes are connected such that they share a common tail";
    -1 "- You are given references to the heads of both lists";
    -1 "";
    -1 "Constraints:";
    -1 "- The number of nodes in each list is at most 10^5";
    -1 "- Node values are integers";
    -1 "- There is guaranteed to be a merge point";
    -1 "";
    -1 "Notes:";
    -1 "- Comparison must be done using node reference, NOT node value";
    -1 "- Two nodes with the same value are not necessarily the same node";
    -1 "- Do not modify the linked lists";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently detect the merge point";
    -1 "- Avoid extra memory if possible";
    -1 "- Aim for O(n) time complexity";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n8:(`v`n)!(8;::);";
    -1 "n7:(`v`n)!(7;n8);";
    -1 "n3:(`v`n)!(3;n7);";
    -1 "n2:(`v`n)!(2;n3);";
    -1 "n1:(`v`n)!(1;n2);";
    -1 "n5:(`v`n)!(5;n7);";
    -1 "n4:(`v`n)!(4;n5);";
    -1 "/";
    -1 "/=============================================================";
 };


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
