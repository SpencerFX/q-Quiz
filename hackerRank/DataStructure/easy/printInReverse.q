//====================================================================
// Print in Reverse
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.printInReverse.info[]
//====================================================================
.quiz.hackerRank.dataStructures.printInReverse.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Print in Reverse";
    -1 "";
    -1 "Given a singly linked list, print the elements of the list";
    -1 "in reverse order.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Traverse the linked list";
    -1 "- Print the values of the nodes in reverse order";
    -1 "";
    -1 "Example:";
    -1 "head = 1 -> 2 -> 3 -> 4";
    -1 "";
    -1 "Output:";
    -1 "4";
    -1 "3";
    -1 "2";
    -1 "1";
    -1 "";
    -1 "Function Description:";
    -1 "printInReverse takes:";
    -1 "  - input: array representing the linked list";
    -1 "";
    -1 "Returns:";
    -1 "  - array of the values in reverse order";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Do not modify the original linked list";
    -1 "- You may use recursion or an auxiliary data structure (e.g., stack)";
    -1 "- Printing should be one value per line";
    -1 "";
    -1 "Goal:";
    -1 "- Output the elements in reverse order without altering the list";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "input:1 2 3 4;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ printInReverse input
printInReverse:{[input] reverse input};
/ =============================================================
