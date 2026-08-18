//====================================================================
// Reverse a Doubly Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.reverseADoublyLinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.reverseADoublyLinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Reverse a Doubly Linked List";
    -1 "";
    -1 "You are given the head of a doubly linked list. Each node";
    -1 "contains a data value and pointers to both the next and";
    -1 "previous nodes.";
    -1 "";
    -1 "A doubly linked list node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null)";
    -1 "- prev: reference to the previous node (or null)";
    -1 "";
    -1 "Task:";
    -1 "- Reverse the doubly linked list";
    -1 "- Update both next and prev pointers for all nodes";
    -1 "- Return the new head of the reversed list";
    -1 "";
    -1 "Example:";
    -1 "Input List:";
    -1 "1 <-> 2 <-> 3 <-> 4";
    -1 "";
    -1 "Reversed List:";
    -1 "4 <-> 3 <-> 2 <-> 1";
    -1 "";
    -1 "Explanation:";
    -1 "- The original head (1) becomes the tail";
    -1 "- The original tail (4) becomes the new head";
    -1 "- All next and prev pointers are swapped";
    -1 "";
    -1 "Function Description:";
    -1 "reverseADoublyLinkedList takes:";
    -1 "  - x: array representing the doubly linked list, head first";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the reversed list, new head first";
    -1 "";
    -1 "Input Format:";
    -1 "- The test harness constructs a doubly linked list";
    -1 "- A reference to the head node is passed to the function";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= number of nodes <= 1000";
    -1 "- -10^5 <= node data <= 10^5";
    -1 "";
    -1 "Notes:";
    -1 "- You must reverse the list in-place (do not create a new list)";
    -1 "- Ensure both next and prev pointers are updated correctly";
    -1 "- Handle edge cases:";
    -1 "    - Empty list";
    -1 "    - Single node list";
    -1 "";
    -1 "Goal:";
    -1 "- Reverse the traversal direction of the list";
    -1 "- Maintain correct bidirectional links";
    -1 "- Return the new head (original tail)";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "x:1 4 1 2 3 4;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ reverseADoublyLinkedList x
reverseADoublyLinkedList:{distinct reverse x};
/ =============================================================
