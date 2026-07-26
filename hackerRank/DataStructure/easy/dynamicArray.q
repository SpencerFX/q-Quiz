/ Question Info ===============================================
/ Dynamic Array

/ You are given a list of sequences, initially all empty.
/ There are N sequences, indexed from 0 to N-1.
/ You are also given Q queries of two types:
 
/ Query Type 1:
/   1 x y
/   - Find the sequence index:
/       idx = (x XOR lastAnswer) % N
/   - Append integer y to sequence[idx]

/ Query Type 2:
/   2 x y
/   - Find the sequence index:
/       idx = (x XOR lastAnswer) % N
/   - Let size be the length of sequence[idx]
/   - Update:
/       lastAnswer = sequence[idx][y % size]
/   - Print lastAnswer

/ Notes:
/ - lastAnswer starts at 0
/ - XOR is bitwise exclusive OR
/ - % is modulo

/ Goal:
/ - Process all queries
/ - Output each lastAnswer from type 2 queries in order

/ Example:
/ N = 2
/ Queries:
/ 1 0 5
/ 1 1 7
/ 1 0 3
/ 2 1 0
/ 2 1 1

/ Output:
/ 7
/ 3

/ Function Description:
/ dynamicArray takes:
/   - n: number of sequences
/   - queries: list of queries

/ Returns:
/   - list of integers (results from type 2 queries)
/ =============================================================

/ Input =======================================================
input:(1 0 5; 1 1 7; 1 0 3; 2 1 0; 2 1 1)
/ =============================================================

/ Solution Info ===============================================
/ dynamicArray[2; input]
/ bxor:{[x;y] (x|y) - (x&y) };
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