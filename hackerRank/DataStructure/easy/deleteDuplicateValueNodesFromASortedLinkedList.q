//====================================================================
// Delete Duplicate Value Nodes from a Sorted Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.deleteDuplicateValueNodesFromASortedLinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.deleteDuplicateValueNodesFromASortedLinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Delete Duplicate Value Nodes from a Sorted Linked List";
    -1 "";
    -1 "Given the head of a sorted singly linked list, remove all duplicate";
    -1 "nodes such that each value appears only once.";
    -1 "";
    -1 "The linked list is sorted in non-decreasing order, so duplicate values";
    -1 "will appear consecutively.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Traverse the linked list";
    -1 "- Remove duplicate nodes in place";
    -1 "- Return the head of the updated list";
    -1 "";
    -1 "Example:";
    -1 "head = 1 -> 1 -> 2 -> 3 -> 3";
    -1 "";
    -1 "Result:";
    -1 "1 -> 2 -> 3";
    -1 "";
    -1 "Explanation:";
    -1 "- Remove consecutive duplicate values";
    -1 "- Keep only one instance of each value";
    -1 "";
    -1 "Function Description:";
    -1 "deleteDuplicateValueNodesFromASortedLinkedList takes:";
    -1 "  - input: array representing the sorted list's values";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the updated list, with duplicates removed";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer (sorted order)";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- Values are in non-decreasing order";
    -1 "";
    -1 "Notes:";
    -1 "- Since the list is sorted, duplicates are adjacent";
    -1 "- Compare current node with next node";
    -1 "- Skip nodes with duplicate values by updating pointers";
    -1 "- Do not create a new list (modify in place)";
    -1 "";
    -1 "Goal:";
    -1 "- Remove all duplicate nodes efficiently";
    -1 "- Maintain the sorted order of the list";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "input:1 1 2 3 3;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ deleteDuplicateValueNodesFromASortedLinkedList input
deleteDuplicateValueNodesFromASortedLinkedList:{[input] distinct input};
/ =============================================================
