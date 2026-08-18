//====================================================================
// Dynamic Array
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.dynamicArray.info[]
//====================================================================
.quiz.hackerRank.dataStructures.dynamicArray.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Dynamic Array";
    -1 "";
    -1 "You are given a list of sequences, initially all empty.";
    -1 "There are N sequences, indexed from 0 to N-1.";
    -1 "You are also given Q queries of two types:";
    -1 "";
    -1 "Query Type 1:";
    -1 "  1 x y";
    -1 "  - Find the sequence index:";
    -1 "      idx = (x XOR lastAnswer) % N";
    -1 "  - Append integer y to sequence[idx]";
    -1 "";
    -1 "Query Type 2:";
    -1 "  2 x y";
    -1 "  - Find the sequence index:";
    -1 "      idx = (x XOR lastAnswer) % N";
    -1 "  - Let size be the length of sequence[idx]";
    -1 "  - Update:";
    -1 "      lastAnswer = sequence[idx][y % size]";
    -1 "  - Print lastAnswer";
    -1 "";
    -1 "Notes:";
    -1 "- lastAnswer starts at 0";
    -1 "- XOR is bitwise exclusive OR";
    -1 "- % is modulo";
    -1 "";
    -1 "Task:";
    -1 "- Process all queries";
    -1 "- Output each lastAnswer from type 2 queries in order";
    -1 "";
    -1 "Example:";
    -1 "N = 2";
    -1 "Queries:";
    -1 "1 0 5";
    -1 "1 1 7";
    -1 "1 0 3";
    -1 "2 1 0";
    -1 "2 1 1";
    -1 "";
    -1 "Output:";
    -1 "7";
    -1 "3";
    -1 "";
    -1 "Function Description:";
    -1 "dynamicArray takes:";
    -1 "  - n: number of sequences";
    -1 "  - queries: list of queries";
    -1 "";
    -1 "Returns:";
    -1 "  - list of integers (results from type 2 queries)";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: two integers n and q (number of sequences, number of queries)";
    -1 "- Next q lines: each line contains a query in the form above";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 1 <= q <= 1000";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly track sequence state and lastAnswer across all queries";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n:2;";
    -1 "queries:(1 0 5; 1 1 7; 1 0 3; 2 1 0; 2 1 1);";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ dynamicArray[n; queries]
dynamicArray:{[n;queries]
  seqs:n#enlist();
  lastAnswer:0;
  result:();
  i:0;
  bxor:{[x;y] (x|y) - (x&y) };
  while[i<count queries;
    q:queries i;
    t:q 0;
    x:q 1;
    y:q 2;
    idx:(bxor[x;lastAnswer]) mod n;
    if[t=1;
      seqs[idx],:y;
    ];
    if[t=2;
      s:seqs idx;
      pos:y mod count s;
      lastAnswer:s pos;
      result,:lastAnswer;
    ];
    i+:1;
  ];
  result
 };
/ =============================================================
