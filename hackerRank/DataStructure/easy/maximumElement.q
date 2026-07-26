/ Question Info ===============================================
/ Maximum Element

/ You have an empty stack and must process a sequence of queries.
/ Each query is one of the following types:
 
/ 1 x  -> Push the element x onto the stack
/ 2    -> Delete (pop) the element at the top of the stack
/ 3    -> Print the maximum element currently in the stack

/ Task:
/ - Process each query in order
/ - For every query of type 3, output the current maximum element

/ Example:
/ Queries:
/ 1 97
/ 2
/ 1 20
/ 2
/ 1 26
/ 1 20
/ 2
/ 3

/ Output:
/ 26

/ Function Description:
/ getMax takes:
/   - operations: list of queries

/ Returns:
/   - list of integers representing results of type 3 queries

/ Input Format:
/ - First line: integer n (number of queries)
/ - Next n lines: each line contains a query

/ Constraints:
/ - 1 ≤ n ≤ 10^5
/ - 1 ≤ x ≤ 10^9

/ Notes:
/ - Stack follows LIFO (Last In, First Out)
/ - A naive approach may be too slow for repeated max queries
/ - Consider maintaining an auxiliary structure to track maximums

/ Goal:
/ - Efficiently support push, pop, and max retrieval
/ - Avoid recomputing maximum on every query
/ =============================================================


/ Input Info ==================================================
/ input:((1;97);(2);(1;20);(2);(1;26);(1;20);(2);(3));
/ =============================================================


/ Solution Info ===============================================
/ maximumElement input
maximumElement:{[ops]
  f:{
    s:x 0;
    m:x 1;
    o:x 2;

    t:first y;

    if[t=1;
      v:y 1;
      newMax:$[count m; (last m) | v; v];
      : (s,enlist v; m,enlist newMax; o)
    ];

    if[t=2;
      : (-1 _ s; -1 _ m; o)
    ];

    / t = 3
    (s; m; o,enlist last m)
  };

  first last f/[ ((`int$());(`int$());()); ops ]
 };
/ =============================================================