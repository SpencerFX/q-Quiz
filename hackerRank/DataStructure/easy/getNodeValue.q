/ Question Info ===============================================
/ Get Node Value

/ Given a singly linked list and a position, determine the value
/ of the node at that position from the tail of the list.
 
/ Positions are zero-based:
/ - Position 0 refers to the last node (tail)
/ - Position 1 refers to the second-to-last node, and so on

/ Each node contains:
/ - data: integer value
/ - next: reference to the next node (or null if end of list)
 
/ Task:
/ - Find the node at the given position from the tail
/ - Return its data value

/ Example:
/ head = 1 -> 2 -> 3 -> 4
/ positionFromTail = 1

/ Result:
/ 3

/ Explanation:
/ - Tail node is 4 (position 0)
/ - Node before it is 3 (position 1)
 
/ Function Description:
/ getNode takes:
/   - head: reference to the head of the linked list
/   - positionFromTail: integer position from the tail

/ Returns:
/   - integer value of the specified node

/ Input Format:
/ - First line: integer t (number of test cases)
/ - For each test case:
/   - First line: integer n (number of elements)
/   - Next n lines: each line contains an integer
/   - Final line: integer positionFromTail

/ Constraints:
/ - 1 ≤ n ≤ 1000
/ - 0 ≤ positionFromTail < n

/ Notes:
/ - You may traverse the list more than once or use two pointers
/ - Do not modify the original list

/ Goal:
/ - Efficiently locate the node from the tail
/ - Return the correct value
/ =============================================================


/ Solution Info ===============================================
getNodeValue:{[list; positionFromTail] 1#(-1+neg positionFromTail)#list}
/ =============================================================