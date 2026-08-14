//====================================================================
// Insert a Node at the Head of a Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.insertNodeAtTheHeadOfALinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.insertNodeAtTheHeadOfALinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Insert a Node at the Head of a Linked List";
    -1 "";
    -1 "Given a singly linked list and a value, insert a new node";
    -1 "containing that value at the beginning (head) of the list.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if list ends)";
    -1 "";
    -1 "Task:";
    -1 "- Create a new node with the given value";
    -1 "- Insert it at the front of the linked list";
    -1 "- Return the new head of the list";
    -1 "";
    -1 "Example:";
    -1 "head = null";
    -1 "data = 1";
    -1 "Result: 1";
    -1 "";
    -1 "head = 2 -> 3 -> 4";
    -1 "data = 1";
    -1 "Result: 1 -> 2 -> 3 -> 4";
    -1 "";
    -1 "Function Description:";
    -1 "insertNodeAtTheHeadOfALinkedList takes:";
    -1 "  - v: array of values to insert, one at a time, at the head";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the resulting list, head first";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer to insert";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 1 <= data <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- If the list is empty (head is null), the new node becomes the head";
    -1 "- Otherwise, the new node points to the current head";
    -1 "- The new node becomes the new head of the list";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly handle both empty and non-empty lists";
    -1 "- Ensure the new node is inserted at the head";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "v:383 484 392 975 321;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ insertNodeAtTheHeadOfALinkedList v
insertNodeAtTheHeadOfALinkedList:{[v]
    list:reverse v;
    list
 };
/ =============================================================
