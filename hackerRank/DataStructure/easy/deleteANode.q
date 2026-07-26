/ Question Info ===============================================
/ Delete a Node

/ Given a singly linked list, delete the node at a specific position.
/ Positions are zero-based, where the head node is at position 0.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Delete the node at the given position
/ - Return the head of the updated linked list

/ Example:
/ head = 20 -> 6 -> 2 -> 19 -> 7 -> 4
/ position = 3

/ Result:
/ 20 -> 6 -> 2 -> 7 -> 4

/ Explanation:
/ - Node at position 3 has value 19
/ - Remove it and reconnect the list

/ Function Description:
/ deleteNode takes:
/   - head: reference to the head node
/   - position: integer index of the node to delete

/ Returns:
/   - reference to the head of the updated list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer
/ - Final line: integer position

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 0 ≤ position < n

/ Notes:
/ - If position = 0, remove the head and return the next node
/ - Otherwise, traverse to the node before the target position
/ - Update pointers to skip the node being deleted

/ Goal:
/ - Correctly handle deletion at head and middle/end positions
/ - Maintain list integrity after removal
/ =============================================================

/ Input Info ===============================================
/input1:16 13 7;
/input2:1;
/input1: 8 20 6 2 19 7 4 15 9;
/input2: 3;
/ =============================================================

/ Solution Info ===============================================
/ deleteANode[input1;input2]
deleteANode:{[l;p]
  l:1_l;
  (p#l),(p+1)_l
 }
/ =============================================================