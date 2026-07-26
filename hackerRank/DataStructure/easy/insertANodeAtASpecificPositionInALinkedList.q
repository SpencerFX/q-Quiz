/ Question Info ===============================================
/ Insert a Node at a Specific Position in a Linked List

/ Given a singly linked list, insert a new node with a given value
/ at a specific position.
/ Positions are zero-based, where the head node is at position 0.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Create a new node with the given value
/ - Insert it at the specified position
/ - Return the head of the updated linked list

/ Example:
/ head = 16 -> 13 -> 7
/ data = 1
/ position = 2

/ Result:
/ 16 -> 13 -> 1 -> 7

/ Explanation:
/ - Insert the new node at position 2
/ - Shift existing nodes accordingly

/ Function Description:
/ insertNodeAtPosition takes:
/   - head: reference to the head node
/   - data: integer value to insert
/   - position: index at which to insert the new node

/ Returns:
/   - reference to the head of the updated list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer
/ - Final line: integer data (value to insert)
/ - Final line: integer position

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 0 ≤ position ≤ n

/ Notes:
/ - If position = 0, insert at the head
/ - Otherwise, traverse to the node before the given position
/ - Update pointers to insert the new node

/ Goal:
/ - Correctly insert the node at the specified position
/ - Maintain list integrity
/ =============================================================

/ Input Info ==================================================
/input1: 1 2 3;
/input2: 4;
/l:16 13 7
/p:2
/v:1
/ =============================================================

/ Solution Info ===============================================
/insertANodeAtASpecificPositionInALinkedList[l;v;p]
insertANodeAtASpecificPositionInALinkedList:{[l;v;p]
  (p#l),v,(p _ l)
 }
/ =============================================================