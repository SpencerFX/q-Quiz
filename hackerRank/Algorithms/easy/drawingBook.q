//====================================================================
// Drawing Book
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.drawingBook.info[]
//====================================================================
.quiz.hackerRank.algorithms.drawingBook.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Drawing Book";
    -1 "";
    -1 "A teacher asks a student to open a book to a specific page.";
    -1 "";
    -1 "The book has n pages, and pages are numbered from 1 to n.";
    -1 "";
    -1 "When the book is opened:";
    -1 "- Pages are turned one at a time";
    -1 "- Each page turn flips two pages (one sheet)";
    -1 "";
    -1 "The student can start turning pages from:";
    -1 "- The front of the book (page 1)";
    -1 "- The back of the book (page n)";
    -1 "";
    -1 "Task:";
    -1 "- Determine the minimum number of page turns required";
    -1 "  to reach page p";
    -1 "";
    -1 "Example:";
    -1 "n = 6";
    -1 "p = 2";
    -1 "";
    -1 "From front:";
    -1 "Turn 1 -> pages (1,2) -> reached page 2 -> 1 turn";
    -1 "";
    -1 "From back:";
    -1 "Turn 1 -> pages (5,6)";
    -1 "Turn 2 -> pages (3,4)";
    -1 "Turn 3 -> pages (1,2) -> 3 turns";
    -1 "";
    -1 "Minimum:";
    -1 "1";
    -1 "";
    -1 "Result:";
    -1 "1";
    -1 "";
    -1 "Function Description:";
    -1 "pageCount takes:";
    -1 "  - n: integer (total number of pages)";
    -1 "  - p: integer (target page)";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing minimum number of page turns";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (total pages)";
    -1 "- Second line: integer p (target page)";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a single integer representing minimum page turns";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 10^5";
    -1 "- 1 <= p <= n";
    -1 "";
    -1 "Notes:";
    -1 "- From front:";
    -1 "    turnsFront = floor(p / 2)";
    -1 "- From back:";
    -1 "    turnsBack = floor(n / 2) - floor(p / 2)";
    -1 "- Result:";
    -1 "    min(turnsFront, turnsBack)";
    -1 "";
    -1 "Goal:";
    -1 "- Compute page turns efficiently without simulation";
    -1 "- Return the minimum number of turns";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n:6;";
    -1 "p:2;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ drawingBook[n;p]
drawingBook:{[n;p]
  front:p div 2;
  back:(n div 2) - front;
  min front,back
 }
/ =============================================================
