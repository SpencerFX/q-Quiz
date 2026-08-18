//====================================================================
// Delete a Node
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.deleteANode.info[]
//====================================================================
.quiz.hackerRank.dataStructures.deleteANode.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Delete a Node";
    -1 "";
    -1 "Given a singly linked list, delete the node at a specific position.";
    -1 "Positions are zero-based, where the head node is at position 0.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Delete the node at the given position";
    -1 "- Return the head of the updated linked list";
    -1 "";
    -1 "Example:";
    -1 "head = 8 -> 20 -> 6 -> 2 -> 19 -> 7 -> 4 -> 15 -> 9";
    -1 "position = 3";
    -1 "";
    -1 "Result:";
    -1 "20 -> 6 -> 2 -> 7 -> 4 -> 15 -> 9";
    -1 "";
    -1 "Explanation:";
    -1 "- The first element is dropped as the list's own head node";
    -1 "- The node at position 3 (value 19) is removed";
    -1 "- The remaining nodes are reconnected";
    -1 "";
    -1 "Function Description:";
    -1 "deleteANode takes:";
    -1 "  - l: array representing the linked list";
    -1 "  - p: integer index of the node to delete";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the head of the updated list";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "- Final line: integer position";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 0 <= position < n";
    -1 "";
    -1 "Notes:";
    -1 "- If position = 0, remove the head and return the next node";
    -1 "- Otherwise, traverse to the node before the target position";
    -1 "- Update pointers to skip the node being deleted";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly handle deletion at head and middle/end positions";
    -1 "- Maintain list integrity after removal";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "l:8 20 6 2 19 7 4 15 9;";
    -1 "p:3;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ deleteANode[l;p]
deleteANode:{[l;p]
  l:1_l;
  (p#l),(p+1)_l
 }
/ =============================================================
