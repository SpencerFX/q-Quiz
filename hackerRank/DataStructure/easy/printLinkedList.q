/ Question Info ===============================================
/ Print the Elements of a Linked List

/ Given a pointer to the head node of a linked list,
/ print each element of the list on a new line.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if tail)

/ Task:
/ - Traverse the linked list starting from the head
/ - Print the data value of each node on a new line

/ Example:
/ head = 16 -> 13 -> NULL
/ Output:
/ 16
/ 13

/ Function Description:
/ printLinkedList takes:
/   - head: reference to the head node of the list

/ Returns:
/   - nothing (prints output directly)

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 1 ≤ data ≤ 1000

/ Notes:
/ - Do NOT read input inside the function
/ - Do NOT return anything
/ - Only print each value on a new line
/ - Stop traversal when reaching null

/ Goal:
/ - Correctly traverse the list from head to tail
/ - Print all values in order without modification
/ =============================================================

/ Input Info ==================================================
/ input: 16 13;
/ =============================================================

/ Solution Info ===============================================
/ printLinkedList input
printLinkedList:{[l] l};
/ =============================================================