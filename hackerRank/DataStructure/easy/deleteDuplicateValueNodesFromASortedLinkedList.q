/ Question Info ===============================================
/ Delete Duplicate Value Nodes from a Sorted Linked List

/ Given the head of a sorted singly linked list, remove all duplicate
/ nodes such that each value appears only once.

/ The linked list is sorted in non-decreasing order, so duplicate values
/ will appear consecutively.

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Traverse the linked list
/ - Remove duplicate nodes in place
/ - Return the head of the updated list

/ Example:
/ head = 1 -> 1 -> 2 -> 3 -> 3

/ Result:
/ 1 -> 2 -> 3

/ Explanation:
/ - Remove consecutive duplicate values
/ - Keep only one instance of each value

/ Function Description:
/ removeDuplicates takes:
/   - head: reference to the head node of the sorted list

/ Returns:
/   - reference to the head of the updated list

/ Input Format:
/ - First line: integer n (number of elements)
/ - Next n lines: each line contains an integer (sorted order)

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - Values are in non-decreasing order

/ Notes:
/ - Since the list is sorted, duplicates are adjacent
/ - Compare current node with next node
/ - Skip nodes with duplicate values by updating pointers
/ - Do not create a new list (modify in place)

/ Goal:
/ - Remove all duplicate nodes efficiently
/ - Maintain the sorted order of the list
/ =============================================================


/ Solution Info ===============================================
deleteDuplicateValueNodesFromASortedLinkedList:{[input] distinct input};
/ =============================================================