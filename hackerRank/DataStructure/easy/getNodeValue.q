//====================================================================
// Get Node Value
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.getNodeValue.info[]
//====================================================================
.quiz.hackerRank.dataStructures.getNodeValue.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Get Node Value";
    -1 "";
    -1 "Given a singly linked list and a position, determine the value";
    -1 "of the node at that position from the tail of the list.";
    -1 "";
    -1 "Positions are zero-based:";
    -1 "- Position 0 refers to the last node (tail)";
    -1 "- Position 1 refers to the second-to-last node, and so on";
    -1 "";
    -1 "Each node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null if end of list)";
    -1 "";
    -1 "Task:";
    -1 "- Find the node at the given position from the tail";
    -1 "- Return its data value";
    -1 "";
    -1 "Example:";
    -1 "head = 1 -> 2 -> 3 -> 4";
    -1 "positionFromTail = 1";
    -1 "";
    -1 "Result:";
    -1 "3";
    -1 "";
    -1 "Explanation:";
    -1 "- Tail node is 4 (position 0)";
    -1 "- Node before it is 3 (position 1)";
    -1 "";
    -1 "Function Description:";
    -1 "getNodeValue takes:";
    -1 "  - list: array representing the linked list";
    -1 "  - positionFromTail: integer position from the tail";
    -1 "";
    -1 "Returns:";
    -1 "  - integer value of the specified node";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of elements)";
    -1 "- Next n lines: each line contains an integer";
    -1 "- Final line: integer positionFromTail";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 0 <= positionFromTail < n";
    -1 "";
    -1 "Notes:";
    -1 "- You may traverse the list more than once or use two pointers";
    -1 "- Do not modify the original list";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently locate the node from the tail";
    -1 "- Return the correct value";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "list:1 2 3 4;";
    -1 "positionFromTail:1;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ getNodeValue[list;positionFromTail]
getNodeValue:{[list; positionFromTail] 1#(-1+neg positionFromTail)#list}
/ =============================================================
