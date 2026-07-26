/ Question Info ===============================================
/ Print in Reverse

/ Given a singly linked list, print the elements of the list
/ in reverse order.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Traverse the linked list
/ - Print the values of the nodes in reverse order

/ Example:
/ head = 1 -> 2 -> 3 -> 4

/ Output:
/ 4
/ 3
/ 2
/ 1

/ Function Description:
/ reversePrint takes:
/   - head: reference to the head node of the list

/ Returns:
/   - None (prints values to standard output)

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer

/ Constraints:
/ - 1 ≤ n ≤ 1000

/ Notes:
/ - Do not modify the original linked list
/ - You may use recursion or an auxiliary data structure (e.g., stack)
/ - Printing should be one value per line

/ Goal:
/ - Output the elements in reverse order without altering the list
/ =============================================================


/ Solution Info ===============================================
printInReverse:{[input] reverse input};
/ =============================================================