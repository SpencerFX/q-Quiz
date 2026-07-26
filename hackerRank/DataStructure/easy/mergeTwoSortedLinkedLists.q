/ Question Info ===============================================
/ Merge Two Sorted Linked Lists

/ Given the heads of two singly linked lists that are sorted
/ in non-decreasing order, merge them into a single sorted list.
 
/ The merged list should be made by reusing the existing nodes
/ and should also be sorted in non-decreasing order.
 
/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)
 
/ Task:
/ - Merge the two sorted linked lists
/ - Return the head of the merged sorted list

/ Example:
/ list1 = 1 -> 3 -> 5
/ list2 = 2 -> 4 -> 6

/ Result:
/ 1 -> 2 -> 3 -> 4 -> 5 -> 6

/ Explanation:
/ - Compare nodes from both lists
/ - Always take the smaller value
/ - Continue until all nodes are merged

/ Function Description:
/ mergeLists takes:
/   - head1: reference to the head of the first sorted list
/   - head2: reference to the head of the second sorted list

/ Returns:
/   - reference to the head of the merged sorted list

/ Input Format:
/ - First line: integer t (number of test cases)
/ - For each test case:
/   - First list elements
/   - Second list elements

/ Constraints:
/ - 0 ≤ number of nodes ≤ 1000
/ - Values are in non-decreasing order
 
/ Notes:
/ - You may reuse nodes (do not need to create new ones)
/ - Handle cases where one or both lists are empty
/ - Maintain sorted order throughout merging

/ Goal:
/ - Efficiently merge both lists into one sorted list
/ - Preserve node structure and ordering
/ =============================================================


/ Solution Info ===============================================
mergeTwoSortedLinkedLists:{[input1;input2] asc input1,input2};
/ =============================================================