/ Question Info ===============================================
/ Compare Two Linked Lists

/ Given the heads of two singly linked lists, determine whether
/ the two lists are identical.

/ Two linked lists are considered identical if:
/ - They have the same number of nodes
/ - Corresponding nodes contain the same data

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)

/ Task:
/ - Compare the two linked lists node by node
/ - Return whether they are identical

/ Example:
/ list1 = 1 -> 2 -> 3
/ list2 = 1 -> 2 -> 3

/ Output:
/ 1   (true)

/ list1 = 1 -> 2 -> 3
/ list2 = 1 -> 2 -> 4

/ Output:
/ 0   (false)

/ Function Description:
/ compareLists takes:
/   - head1: reference to the head of the first list
/   - head2: reference to the head of the second list

/ Returns:
/   - 1 if the lists are identical
/   - 0 otherwise

/ Input Format:
/ - First line: integer n (number of elements in first list)
/ - Next n lines: each line contains an integer
/ - Next line: integer m (number of elements in second list)
/ - Next m lines: each line contains an integer

/ Constraints:
/ - 1 ≤ n, m ≤ 1000
/ - Node values are integers

/ Notes:
/ - Traverse both lists simultaneously
/ - If lengths differ, lists are not identical
/ - If any corresponding values differ, return false

/ Goal:
/ - Efficiently compare both lists
/ - Ensure both structure and values match
/ =============================================================


/ Solution Info ===============================================
compareTwoLinkedLists:{[input1; input2] min input1 = input2 };
/ =============================================================