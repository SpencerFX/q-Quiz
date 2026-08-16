//====================================================================
// Compare the Triplets
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.compareTriplets.info[]
//====================================================================
.quiz.hackerRank.algorithms.compareTriplets.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Compare the Triplets";
    -1 "";
    -1 "Alice and Bob each created one problem for HackerRank. A reviewer";
    -1 "rates the two challenges, awarding points on a scale from 1 to 100";
    -1 "for three categories: problem clarity, originality, and difficulty.";
    -1 "";
    -1 "The rating for Alice's challenge is the triplet a = (a[0], a[1], a[2]),";
    -1 "and the rating for Bob's challenge is the triplet b = (b[0], b[1], b[2]).";
    -1 "";
    -1 "Task:";
    -1 "- Compare each category between a and b";
    -1 "- If a[i] > b[i], Alice is awarded 1 point";
    -1 "- If a[i] < b[i], Bob is awarded 1 point";
    -1 "- If a[i] = b[i], neither person receives a point";
    -1 "- Return the total points for Alice and Bob";
    -1 "";
    -1 "Example:";
    -1 "a = 5 6 7";
    -1 "b = 3 6 10";
    -1 "";
    -1 "Category by category:";
    -1 "index 0: a[0]=5 > b[0]=3  -> Alice +1";
    -1 "index 1: a[1]=6 = b[1]=6  -> no point";
    -1 "index 2: a[2]=7 < b[2]=10 -> Bob +1";
    -1 "";
    -1 "Result:";
    -1 "1 1";
    -1 "";
    -1 "Function Description:";
    -1 "compareTriplets takes:";
    -1 "  - a: array of 3 integers (Alice's challenge rating)";
    -1 "  - b: array of 3 integers (Bob's challenge rating)";
    -1 "";
    -1 "Returns:";
    -1 "  - array of 2 integers: [Alice's score, Bob's score]";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: three space-separated integers (a)";
    -1 "- Second line: three space-separated integers (b)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return two space-separated integers: Alice's score then Bob's score";
    -1 "";
    -1 "Constraints:";
    -1 "- a.length = b.length = 3";
    -1 "- 1 <= a[i], b[i] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Compare element-wise, not by summing the triplets";
    -1 "- Alice's score is the count of positions where a[i] > b[i]";
    -1 "- Bob's score is the count of positions where a[i] < b[i]";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly tally points for each category comparison";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "a:5 6 7;";
    -1 "b:3 6 10;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ compareTriplets[a;b]
compareTriplets:{[a;b]
  (sum a>b; sum a<b)
 };
/ =============================================================


/ Solution Info (alternate) ====================================
/ Uses signum of the element-wise difference instead of separate
/ greater-than/less-than comparisons.
/ compareTriplets2[a;b]
compareTriplets2:{[a;b]
  diffs:signum a-b;
  (sum diffs=1; sum diffs=-1)
 };
/ =============================================================
