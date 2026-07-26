/ Question Info ===============================================
/ Insert a Node at the Head of a Linked List

/ Given a singly linked list and a value, insert a new node
/ containing that value at the beginning (head) of the list.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if list ends)

/ Task:
/ - Create a new node with the given value
/ - Insert it at the front of the linked list
/ - Return the new head of the list

/ Example:
/ head = NULL
/ data = 1
/ Result: 1

/ head = 2 -> 3 -> 4
/ data = 1
/ Result: 1 -> 2 -> 3 -> 4

/ Function Description:
/ insertNodeAtHead takes:
/   - head: reference to the head node of the list
/   - data: integer value to insert

/ Returns:
/   - reference to the new head of the updated list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer to insert

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 1 ≤ data ≤ 1000

/ Notes:
/ - If the list is empty (head is null), the new node becomes the head
/ - Otherwise, the new node points to the current head
/ - The new node becomes the new head of the list

/ Goal:
/ - Correctly handle both empty and non-empty lists
/ - Ensure the new node is inserted at the head
/ =============================================================

/ Input Info ==================================================
/ input: 383 484 392 975 321;
/ =============================================================

/ Solution Info ===============================================
/ insertNodeAtTheHeadOfALinkedList[input]
insertNodeAtTheHeadOfALinkedList:{[v]
    list:reverse v;
    list
 };
/ =============================================================