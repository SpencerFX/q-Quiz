//====================================================================
// Print the Elements of a Linked List
//
// Displays the HackerRank problem statement.
//
// Note: this file was missing entirely - printTheElementsOfALinkedList
// is a distinct, separately-wired problem from printLinkedList (see its
// own entry in hackerRank/Inputs/dataStructures.q), so it needs its own
// solution/info file rather than reusing printLinkedList's.
//
// Usage:
//      .quiz.hackerRank.dataStructures.printTheElementsOfALinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.printTheElementsOfALinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Print the Elements of a Linked List";
    -1 "";
    -1 "Given a pointer to the head node of a linked list, print each";
    -1 "element of the list on a new line.";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if tail)";
    -1 "";
    -1 "Task:";
    -1 "- Traverse the linked list starting from the head";
    -1 "- Print the data value of each node on a new line";
    -1 "";
    -1 "Example:";
    -1 "head = 16 -> 13 -> 7 -> null";
    -1 "";
    -1 "Output:";
    -1 "16";
    -1 "13";
    -1 "7";
    -1 "";
    -1 "Function Description:";
    -1 "printTheElementsOfALinkedList takes:";
    -1 "  - head: array representing the linked list, head first";
    -1 "";
    -1 "Returns:";
    -1 "  - the same list (its values are what gets printed, in order)";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 1 <= data <= 1000";
    -1 "";
    -1 "Notes:";
    -1 "- Do NOT read input inside the function";
    -1 "- Only print each value on a new line";
    -1 "- Stop traversal when reaching null";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly traverse the list from head to tail";
    -1 "- Print all values in order without modification";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "head:16 13 7;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ printTheElementsOfALinkedList head
printTheElementsOfALinkedList:{[head] head};
/ =============================================================
