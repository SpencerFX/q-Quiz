//====================================================================
// Insert a Node at a Specific Position in a Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.insertANodeAtASpecificPositionInALinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.insertANodeAtASpecificPositionInALinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Insert a Node at a Specific Position in a Linked List";
    -1 "";
    -1 "Given a singly linked list, insert a new node with a given value";
    -1 "at a specific position.";
    -1 "Positions are zero-based, where the head node is at position 0.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Create a new node with the given value";
    -1 "- Insert it at the specified position";
    -1 "- Return the head of the updated linked list";
    -1 "";
    -1 "Example:";
    -1 "head = 16 -> 13 -> 7";
    -1 "data = 1";
    -1 "position = 2";
    -1 "";
    -1 "Result:";
    -1 "16 -> 13 -> 1 -> 7";
    -1 "";
    -1 "Explanation:";
    -1 "- Insert the new node at position 2";
    -1 "- Shift existing nodes accordingly";
    -1 "";
    -1 "Function Description:";
    -1 "insertANodeAtASpecificPositionInALinkedList takes:";
    -1 "  - l: array representing the linked list";
    -1 "  - v: integer value to insert";
    -1 "  - p: index at which to insert the new node";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the head of the updated list";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "- Next line: integer data (value to insert)";
    -1 "- Final line: integer position";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 0 <= position <= n";
    -1 "";
    -1 "Notes:";
    -1 "- If position = 0, insert at the head";
    -1 "- Otherwise, traverse to the node before the given position";
    -1 "- Update pointers to insert the new node";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly insert the node at the specified position";
    -1 "- Maintain list integrity";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "l:16 13 7;";
    -1 "v:1;";
    -1 "p:2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ insertANodeAtASpecificPositionInALinkedList[l;v;p]
insertANodeAtASpecificPositionInALinkedList:{[l;v;p]
  (p#l),v,(p _ l)
 }
/ =============================================================
