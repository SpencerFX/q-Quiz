/ Question Info ===============================================
/ Reverse a Linked List

/ Given a singly linked list, reverse the list and return
/ the new head.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Reverse the direction of the linked list
/ - The last node becomes the new head
/ - Each node should point to its previous node

/ Example:
/ head = 1 -> 2 -> 3 -> 4 -> NULL

/ Result:
/ 4 -> 3 -> 2 -> 1 -> NULL

/ Function Description:
/ reverse takes:
/   - head: reference to the head node of the list

/ Returns:
/   - reference to the new head of the reversed list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Do not create a new list (reverse in place if possible)
/ - You may use iterative or recursive approaches
/ - Ensure all pointers are correctly reassigned

/ Goal:
/ - Reverse the list correctly
/ - Return the new head
/ =============================================================


/ Solution Info ===============================================
reverseALinkedList:{[input] reverse input};
/ =============================================================