//====================================================================
// Compare Two Linked Lists
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.compareTwoLinkedLists.info[]
//====================================================================
.quiz.hackerRank.dataStructures.compareTwoLinkedLists.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Compare Two Linked Lists";
    -1 "";
    -1 "Given the heads of two singly linked lists, determine whether";
    -1 "the two lists are identical.";
    -1 "";
    -1 "Two linked lists are considered identical if:";
    -1 "- They have the same number of nodes";
    -1 "- Corresponding nodes contain the same data";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Compare the two linked lists node by node";
    -1 "- Return whether they are identical";
    -1 "";
    -1 "Example:";
    -1 "list1 = 1 -> 2 -> 3";
    -1 "list2 = 1 -> 2 -> 3";
    -1 "";
    -1 "Output:";
    -1 "1   (true)";
    -1 "";
    -1 "list1 = 1 -> 2 -> 3";
    -1 "list2 = 1 -> 2 -> 4";
    -1 "";
    -1 "Output:";
    -1 "0   (false)";
    -1 "";
    -1 "Function Description:";
    -1 "compareTwoLinkedLists takes:";
    -1 "  - input1: array representing the first list's values";
    -1 "  - input2: array representing the second list's values";
    -1 "";
    -1 "Returns:";
    -1 "  - 1 if the lists are identical";
    -1 "  - 0 otherwise";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements in first list)";
    -1 "- Next n lines: each line contains an integer";
    -1 "- Next line: integer m (number of elements in second list)";
    -1 "- Next m lines: each line contains an integer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n, m <= 1000";
    -1 "- Node values are integers";
    -1 "";
    -1 "Notes:";
    -1 "- Traverse both lists simultaneously";
    -1 "- If lengths differ, lists are not identical";
    -1 "- If any corresponding values differ, return false";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently compare both lists";
    -1 "- Ensure both structure and values match";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "input1:1 2 3;";
    -1 "input2:1 2 3;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ compareTwoLinkedLists[input1;input2]
compareTwoLinkedLists:{[input1; input2] min input1 = input2 };
/ =============================================================
