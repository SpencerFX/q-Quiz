//====================================================================
// QHEAP1
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.qHeap1.info[]
//====================================================================
.quiz.hackerRank.dataStructures.qHeap1.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "QHEAP1";
    -1 "";
    -1 "You are given an empty heap and a sequence of queries.";
    -1 "Each query is one of the following types:";
    -1 "";
    -1 "1 v  -> Insert value v into the heap";
    -1 "2 v  -> Delete one occurrence of value v from the heap";
    -1 "3    -> Print the minimum element in the heap";
    -1 "";
    -1 "The heap should always maintain the min-heap property,";
    -1 "where the smallest element can be accessed efficiently.";
    -1 "";
    -1 "Task:";
    -1 "- Process each query in order";
    -1 "- For every query of type 3, output the minimum element";
    -1 "";
    -1 "Example:";
    -1 "Queries:";
    -1 "1 4";
    -1 "1 9";
    -1 "3";
    -1 "2 4";
    -1 "3";
    -1 "";
    -1 "Output:";
    -1 "4";
    -1 "9";
    -1 "";
    -1 "Function Description:";
    -1 "qHeap1 takes:";
    -1 "  - qs: list of queries, each query itself a list";
    -1 "";
    -1 "Returns:";
    -1 "  - list of integers representing results of type 3 queries";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer q (number of queries)";
    -1 "- Next q lines: each line contains a query";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= q <= 10^5";
    -1 "- 1 <= v <= 10^9";
    -1 "";
    -1 "Notes:";
    -1 "- The heap must support efficient insertion, deletion, and minimum retrieval";
    -1 "- Deletion removes only one instance of the value";
    -1 "- A naive approach may be too slow for large inputs";
    -1 "- Consider using a min-heap with additional structure for deletions";
    -1 "";
    -1 "Goal:";
    -1 "- Efficiently maintain a dynamic set of integers";
    -1 "- Support fast min retrieval under frequent updates";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "qs:((1;4);(1;9);(3);(2;4);(3));";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ qHeap1 qs
qHeap1:{[qs]
  f:{
    h:x 0;
    o:x 1;
    t:first y;

    if[t=1;
      v:y 1;
      : (asc h, v; o)
    ];

    if[t=2;
      v:y 1;
      idx:h? v;
      : ( $[idx<count h; (idx#h),1 _ idx _ h; h]; o )
    ];

    / t = 3
    (h; o,enlist first h)
  };

  last f/[ ((`int$());()); qs ]
 };
/ =============================================================
