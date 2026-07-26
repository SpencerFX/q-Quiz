/Question Info ===============================================
/
Breaking the Records

Maria plays a series of games and records her score for each game.

She wants to track how many times she breaks her records for:
- The highest score
- The lowest score

At the start:
- The first score sets both the highest and lowest records

For each subsequent score:
- If the score is higher than the current maximum, it is a new high record
- If the score is lower than the current minimum, it is a new low record

Task:
- Count how many times Maria breaks her high score record
- Count how many times Maria breaks her low score record
- Return both counts

Example:
scores = 10 5 20 20 4 5 2 25 1

Process:
Start: high = 10, low = 10

5  → new low → lowCount = 1
20 → new high → highCount = 1
20 → no change
4  → new low → lowCount = 2
5  → no change
2  → new low → lowCount = 3
25 → new high → highCount = 2
1  → new low → lowCount = 4

Result:
2 4

Function Description:
breakingRecords takes:
  - scores: array of integers representing game scores

Returns:
  - array of two integers:
      [number of times highest record broken, number of times lowest record broken]

Input Format:
- First line: integer n (number of games)
- Second line: n space-separated integers (scores)

Output Format:
- Return two space-separated integers

Constraints:
- 1 ≤ n ≤ 1000
- 0 ≤ scores[i] ≤ 10^8

Notes:
- Initialize:
    high = scores[0]
    low = scores[0]
- Iterate through the array:
    if score > high → update high and increment highCount
    if score < low  → update low and increment lowCount
- Ignore equal values

Goal:
- Track record-breaking events correctly
- Return accurate counts for both high and low records
\
/=============================================================


/ Input Info ==================================================
input: 10 5 20 20 4 5 2 25 1;
/ =============================================================


/ Solution Info ===============================================
/ breakingTheRecords input
breakingTheRecords:{[scores]
  f:{[st;v]
    maxv:st 0;
    minv:st 1;
    maxc:st 2;
    minc:st 3;
    maxc+:v>maxv;
    minc+:v<minv;
    maxv:$[v>maxv; v; maxv];
    minv:$[v<minv; v; minv];
    (maxv; minv; maxc; minc)
  };
  res:f/[ (first scores; first scores; 0; 0); scores ];
  (res 2; res 3)
 };
/ =============================================================