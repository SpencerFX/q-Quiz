//====================================================================
// Merge Two Sorted Linked Lists
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.mergeTwoSortedLinkedLists.info[]
//====================================================================
.quiz.hackerRank.dataStructures.mergeTwoSortedLinkedLists.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Merge Two Sorted Linked Lists";
    -1 "";
    -1 "Given the heads of two singly linked lists that are sorted";
    -1 "in non-decreasing order, merge them into a single sorted list.";
    -1 "";
    -1 "The merged list should be made by reusing the existing nodes";
    -1 "and should also be sorted in non-decreasing order.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Merge the two sorted linked lists";
    -1 "- Return the head of the merged sorted list";
    -1 "";
    -1 "Example:";
    -1 "list1 = 1 -> 3 -> 5";
    -1 "list2 = 2 -> 4 -> 6";
    -1 "";
    -1 "Result:";
    -1 "1 -> 2 -> 3 -> 4 -> 5 -> 6";
    -1 "";
    -1 "Explanation:";
    -1 "- Compare nodes from both lists";
    -1 "- Always take the smaller value";
    -1 "- Continue until all nodes are merged";
    -1 "";
    -1 "Function Description:";
    -1 "mergeTwoSortedLinkedLists takes:";
    -1 "  - input1: array representing the first sorted list";
    -1 "  - input2: array representing the second sorted list";
    -1 "";
    -1 "Returns:";
    -1 "  - array representing the merged sorted list";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer t (number of test cases)";
    -1 "- For each test case:";
    -1 "  - First list elements";
    -1 "  - Second list elements";
    -1 "";
    -1 "Constraints:";
    -1 "- 0 <= number of nodes <= 1000";
    -1 "- Values are in non-decreasing order";
    -1 "";
    -1 "Notes:";
    -1 "- You may reuse nodes (do not need to create new ones)";
    -1 "- Handle cases where one or both lists are empty";
    -1 "- Maintain sorted order throughout merging";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently merge both lists into one sorted list";
    -1 "- Preserve node structure and ordering";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "input1:1 3 5;";
    -1 "input2:2 4 6;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ mergeTwoSortedLinkedLists[input1;input2]
mergeTwoSortedLinkedLists:{[input1;input2] asc input1,input2};
/ =============================================================
