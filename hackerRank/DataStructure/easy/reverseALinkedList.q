//====================================================================
// Reverse a Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.reverseALinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.reverseALinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Reverse a Linked List";
    -1 "";
    -1 "Given a singly linked list, reverse the list and return";
    -1 "the new head.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Reverse the direction of the linked list";
    -1 "- The last node becomes the new head";
    -1 "- Each node should point to its previous node";
    -1 "";
    -1 "Example:";
    -1 "head = 1 -> 2 -> 3 -> 4 -> null";
    -1 "";
    -1 "Result:";
    -1 "4 -> 3 -> 2 -> 1 -> null";
    -1 "";
    -1 "Function Description:";
    -1 "reverseALinkedList takes:";
    -1 "  - input: array representing the linked list, head first";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the reversed list, new head first";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Do not create a new list (reverse in place if possible)";
    -1 "- You may use iterative or recursive approaches";
    -1 "- Ensure all pointers are correctly reassigned";
    -1 "";
    -1 "Goal:";
    -1 "- Reverse the list correctly";
    -1 "- Return the new head";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "input:1 2 3 4;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ reverseALinkedList input
reverseALinkedList:{[input] reverse input};
/ =============================================================
