/Question Info ===============================================
/
Drawing Book

A teacher asks a student to open a book to a specific page.

The book has n pages, and pages are numbered from 1 to n.

When the book is opened:
- Pages are turned one at a time
- Each page turn flips two pages (one sheet)

The student can start turning pages from:
- The front of the book (page 1)
- The back of the book (page n)

Task:
- Determine the minimum number of page turns required
  to reach page p

Example:
n = 6
p = 2

From front:
Turn 1 → pages (1,2) → reached page 2 → 1 turn

From back:
Turn 1 → pages (5,6)
Turn 2 → pages (3,4)
Turn 3 → pages (1,2) → 3 turns

Minimum:
1

Result:
1

Function Description:
pageCount takes:
  - n: integer (total number of pages)
  - p: integer (target page)

Returns:
  - integer representing minimum number of page turns

Input Format:
- First line: integer n (total pages)
- Second line: integer p (target page)

Output Format:
- Return a single integer representing minimum page turns

Constraints:
- 1 ≤ n ≤ 10^5
- 1 ≤ p ≤ n

Notes:
- From front:
    turnsFront = floor(p / 2)
- From back:
    turnsBack = floor(n / 2) - floor(p / 2)
- Result:
    min(turnsFront, turnsBack)

Goal:
- Compute page turns efficiently without simulation
- Return the minimum number of turns
\
/=============================================================


/ Input Info ==================================================
input1:6;
input2:2;
/ =============================================================


/ Solution Info ===============================================
/ drawingBook[input1;input2]
drawingBook:{[n;p]
  front:p div 2;
  back:(n div 2) - front;
  min front,back
 }
/ =============================================================