/ Question Info ===============================================
/ Reverse a Doubly Linked List

/ You are given the head of a doubly linked list. Each node
/ contains a data value and pointers to both the next and
/ previous nodes.
 
/ A doubly linked list node contains:
/ - data: integer value
/ - next: reference to the next node (or null)
/ - prev: reference to the previous node (or null)
 
/ Task:
/ - Reverse the doubly linked list
/ - Update both next and prev pointers for all nodes
/ - Return the new head of the reversed list
 
/ Example:
/ Input List:
/ 1 ⇄ 2 ⇄ 3 ⇄ 4
 
/ Reversed List:
/ 4 ⇄ 3 ⇄ 2 ⇄ 1
 
/ Explanation:
/ - The original head (1) becomes the tail
/ - The original tail (4) becomes the new head
/ - All next and prev pointers are swapped
 
/ Function Description:
/ reverse takes:
/   - head: reference to the head of the doubly linked list
 
/ Returns:
/   - reference to the head of the reversed doubly linked list
 
/ Input Format:
/ - The test harness constructs a doubly linked list
/ - A reference to the head node is passed to the function
 
/ Constraints:
/ - 1 ≤ number of nodes ≤ 1000
/ - -10^5 ≤ node data ≤ 10^5
 
/ Notes:
/ - You must reverse the list in-place (do not create a new list)
/ - Ensure both next and prev pointers are updated correctly
/ - Handle edge cases:
/     - Empty list
/     - Single node list
 
/ Goal:
/ - Reverse the traversal direction of the list
/ - Maintain correct bidirectional links
/ - Return the new head (original tail)
/==============================================================


/ Input Info ==================================================
/ input: 1 4 1 2 3 4
/ =============================================================


/ Solution Info ===============================================
/ reverseADoublyLinkedList input
reverseADoublyLinkedList:{distinct reverse x};
/ =============================================================