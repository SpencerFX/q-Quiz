/ Question Info ===============================================
/ Merge Two Sorted Lists

/ You are given two lists of integers, each already sorted in
/ ascending order. Merge them into a single sorted list.

/ Task:
/ - Combine both lists into one, in ascending order

/ Example 1:
/ l1 = [1, 2, 4]
/ l2 = [1, 3, 4]

/ Result:
/ [1, 1, 2, 3, 4, 4]

/ Example 2:
/ l1 = []
/ l2 = []

/ Result:
/ []

/ Function Description:
/ mergeTwoLists takes:
/   - l1: sorted list of integers
/   - l2: sorted list of integers

/ Returns:
/   - single sorted list containing every element of both

/ Constraints:
/ - 0 ≤ length of each list ≤ 50
/ - Both lists are already sorted ascending

/ Notes:
/ - This is the classic "merge two sorted linked lists" problem,
/   represented here as plain lists rather than linked nodes -
/   q has no pointer-based list type, so the merge itself (not
/   node-splicing) is what's being tested

/ Goal:
/ - Return a single fully-sorted list
/ =============================================================


/ Solution Info ===============================================
/ mergeTwoLists[1 2 4; 1 3 4]

mergeTwoLists:{[l1;l2] asc l1,l2}
/ =============================================================
