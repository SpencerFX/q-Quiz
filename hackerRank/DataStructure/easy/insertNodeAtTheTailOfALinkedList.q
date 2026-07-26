/ Question Info ===============================================
/ Insert a Node at the Tail of a Linked List

/ Given a singly linked list and a value, insert a new node
/ containing that value at the end (tail) of the list.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if tail)

/ Task:
/ - Create a new node with the given value
/ - Insert it at the end of the linked list
/ - Return the head of the updated list

/ Example:
/ head = NULL
/ data = 1
/ Result: 1

/ head = 1 -> 2 -> 3
/ data = 4
/ Result: 1 -> 2 -> 3 -> 4

/ Function Description:
/ insertNodeAtTail takes:
/   - head: reference to the head node of the list
/   - data: integer value to insert

/ Returns:
/   - reference to the head of the updated list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer to insert

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 1 ≤ data ≤ 1000

/ Notes:
/ - If the list is empty (head is null), the new node becomes the head
/ - Otherwise, traverse to the last node and append the new node
/ - Maintain the original head reference

/ Goal:
/ - Correctly handle both empty and non-empty lists
/ - Ensure the new node is appended at the tail
/ =============================================================

/ Input Info ==================================================
/data: 1 2 3;
/nextOne:  1 2 -1;   / -1 = null
/head: 0;
/node:{[d;nxt] (`data`next)!(d;nxt)}
input: 141 302 164 530 474;
/ =============================================================

/ Solution Info ===============================================
enlistItems:{[h;v]
  $[h~();
    enlist v;
    h,v
  ]
 };

insertNodeAtTheTailOfALinkedList:{enlistItems/[(); x]};
/ =============================================================