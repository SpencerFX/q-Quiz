//====================================================================
// Breaking the Records
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.breakingTheRecords.info[]
//====================================================================
.quiz.hackerRank.algorithms.breakingTheRecords.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Breaking the Records";
    -1 "";
    -1 "Maria plays a series of games and records her score for each game.";
    -1 "";
    -1 "She wants to track how many times she breaks her records for:";
    -1 "- The highest score";
    -1 "- The lowest score";
    -1 "";
    -1 "At the start:";
    -1 "- The first score sets both the highest and lowest records";
    -1 "";
    -1 "For each subsequent score:";
    -1 "- If the score is higher than the current maximum, it is a new high record";
    -1 "- If the score is lower than the current minimum, it is a new low record";
    -1 "";
    -1 "Task:";
    -1 "- Count how many times Maria breaks her high score record";
    -1 "- Count how many times Maria breaks her low score record";
    -1 "- Return both counts";
    -1 "";
    -1 "Example:";
    -1 "scores = 10 5 20 20 4 5 2 25 1";
    -1 "";
    -1 "Process:";
    -1 "Start: high = 10, low = 10";
    -1 "";
    -1 "5  -> new low -> lowCount = 1";
    -1 "20 -> new high -> highCount = 1";
    -1 "20 -> no change";
    -1 "4  -> new low -> lowCount = 2";
    -1 "5  -> no change";
    -1 "2  -> new low -> lowCount = 3";
    -1 "25 -> new high -> highCount = 2";
    -1 "1  -> new low -> lowCount = 4";
    -1 "";
    -1 "Result:";
    -1 "2 4";
    -1 "";
    -1 "Function Description:";
    -1 "breakingRecords takes:";
    -1 "  - scores: array of integers representing game scores";
    -1 "";
    -1 "Returns:";
    -1 "  - array of two integers:";
    -1 "      [number of times highest record broken, number of times lowest record broken]";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of games)";
    -1 "- Second line: n space-separated integers (scores)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return two space-separated integers";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 1000";
    -1 "- 0 <= scores[i] <= 10^8";
    -1 "";
    -1 "Notes:";
    -1 "- Initialize:";
    -1 "    high = scores[0]";
    -1 "    low = scores[0]";
    -1 "- Iterate through the array:";
    -1 "    if score > high -> update high and increment highCount";
    -1 "    if score < low  -> update low and increment lowCount";
    -1 "- Ignore equal values";
    -1 "";
    -1 "Goal:";
    -1 "- Track record-breaking events correctly";
    -1 "- Return accurate counts for both high and low records";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "scores:10 5 20 20 4 5 2 25 1;";
    -1 "/";
    -1 "/=============================================================";
 };


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


/ Solution Info (alternate) ====================================
/ Vectorised with running max/min (maxs/mins) instead of a fold:
/ a score at position i breaks a record iff it beats the running
/ max/min of everything strictly before it.
/ breakingTheRecords2 scores
breakingTheRecords2:{[scores]
  highCount:sum (1_scores) > -1_maxs scores;
  lowCount:sum (1_scores) < -1_mins scores;
  (highCount;lowCount)
 };
/ =============================================================
