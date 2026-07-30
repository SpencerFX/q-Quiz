/ Question Info ===============================================
/ ZigZag Conversion

/ The string "PAYPALISHIRING" is written in a zigzag pattern
/ on a given number of rows and then read line by line.

/ Example of zigzag (numRows = 3):
/ P   A   H   N
/ A P L S I I G
/ Y   I   R

/ Result: "PAHNAPLSIIGYIR"

/ Task:
/ - Write a function that converts a string into a zigzag pattern
/ - Then read row-by-row to form the output string

/ Function Description:
/ convertZigZag takes:
/   - s: input string
/   - numRows: number of rows in zigzag pattern

/ Returns:
/   - string after zigzag conversion

/ Example 1:
/ Input: s = "PAYPALISHIRING", numRows = 3
/ Output: "PAHNAPLSIIGYIR"

/ Example 2:
/ Input: s = "PAYPALISHIRING", numRows = 4
/ Output: "PINALSIGYAHRPI"

/ Explanation:
/ The string is written in a zigzag pattern and then
/ concatenated row by row.

/ Constraints:
/ - 1 ≤ length(s) ≤ 1000
/ - s contains only English letters
/ - 1 ≤ numRows ≤ 1000

/ Goal:
/ - Simulate zigzag traversal efficiently
/ - Maintain row-wise accumulation of characters
/ =============================================================

/ Solution Info ===============================================
convertZigZag["PAYPALISHIRING"; 3]

convertZigZag:{[s;n]
  s:raze string s;
  n:"j"$n;

  if[(n=1) or n>=count s;:s];

  / state: (row;dir;rows;n)
  init:(0;1;n#enlist "";n);

  step:{[st;c]
    row:st[0];
    dir:st[1];
    rows:st[2];
    n:st[3];

    / rebuild rows immutably (THIS is the key fix)
    rows:rows@[row;:;rows[row],c];

    / direction flip
    dir:$[(row=0) or (row=n-1);neg dir;dir];

    / move row pointer
    row+:dir;

    (row;dir;rows;n)
  };

  final:step/[init;s];

  raze final[2]
 }
/ =============================================================