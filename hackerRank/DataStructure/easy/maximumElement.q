//====================================================================
// Maximum Element
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.maximumElement.info[]
//====================================================================
.quiz.hackerRank.dataStructures.maximumElement.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Maximum Element";
    -1 "";
    -1 "You have an empty stack and must process a sequence of queries.";
    -1 "Each query is one of the following types:";
    -1 "";
    -1 "1 x  -> Push the element x onto the stack";
    -1 "2    -> Delete (pop) the element at the top of the stack";
    -1 "3    -> Print the maximum element currently in the stack";
    -1 "";
    -1 "Task:";
    -1 "- Process each query in order";
    -1 "- For every query of type 3, output the current maximum element";
    -1 "";
    -1 "Example:";
    -1 "Queries:";
    -1 "1 97";
    -1 "2";
    -1 "1 20";
    -1 "2";
    -1 "1 26";
    -1 "1 20";
    -1 "2";
    -1 "3";
    -1 "";
    -1 "Output:";
    -1 "26";
    -1 "";
    -1 "Function Description:";
    -1 "maximumElement takes:";
    -1 "  - ops: list of queries, each query itself a list";
    -1 "";
    -1 "Returns:";
    -1 "  - list of integers representing results of type 3 queries";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of queries)";
    -1 "- Next n lines: each line contains a query";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 10^5";
    -1 "- 1 <= x <= 10^9";
    -1 "";
    -1 "Notes:";
    -1 "- Stack follows LIFO (Last In, First Out)";
    -1 "- A naive approach may be too slow for repeated max queries";
    -1 "- Consider maintaining an auxiliary structure to track maximums";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently support push, pop, and max retrieval";
    -1 "- Avoid recomputing maximum on every query";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "ops:((1;97);(2);(1;20);(2);(1;26);(1;20);(2);(3));";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ maximumElement ops
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
