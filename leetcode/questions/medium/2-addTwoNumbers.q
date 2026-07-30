/ Question Info ===============================================
/ Add Two Numbers

/ You are given two non-empty lists of integers representing
/ two non-negative integers.

/ The digits are stored in reverse order, and each element
/ in the list contains a single digit.

/ Add the two numbers and return the sum as a list of digits,
/ also in reverse order.

/ Task:
/ - Add the two numbers represented by the two lists
/ - Return the result as a list of digits in reverse order

/ Example:
/ l1 = [2, 4, 3]
/ l2 = [5, 6, 4]

/ Number 1: 342
/ Number 2: 465

/ Sum: 807

/ Result (reversed):
/ [7, 0, 8]

/ Function Description:
/ addTwoNumbers takes:
/   - l1: list of digits (reversed)
/   - l2: list of digits (reversed)

/ Returns:
/   - list of digits representing the sum (reversed)

/ Input Format:
/ - First line contains integers for l1
/ - Second line contains integers for l2

/ Constraints:
/ - 1 ≤ length of lists ≤ 100
/ - 0 ≤ digit ≤ 9
/ - The numbers do not contain leading zeros except for 0 itself

/ Notes:
/ - Digits are stored in reverse order
/ - Each position must handle carry from previous addition
/ - Output must also be in reverse order
/ - Lists may be of different lengths

/ Goal:
/ - Correctly handle digit-wise addition with carry
/ - Efficiently process lists of unequal length
/ =============================================================


/ Solution Info ===============================================
/ addTwoNumbers[2 4 3; 5 6 4]

addTwoNumbers:{[l1;l2]
  n:max count each (l1;l2);

  x:l1,(n-count l1)#0;
  y:l2,(n-count l2)#0;

  s:x+y;

  / state = (result list; carry)
  state:{
    res:x 0;
    carry:x 1;
    v:y+carry;
    ((res,v mod 10); v div 10)
  }/[(() ; 0); s];

  res:first state;
  carry:last state;

  $[carry>0; res,carry; res]
 }
/ =============================================================