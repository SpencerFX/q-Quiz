/ Question Info ===============================================
/ Reverse Integer

/ Given a 32-bit signed integer x, return x with its digits
/ reversed. If reversing overflows the signed 32-bit range,
/ return 0.

/ Task:
/ - Reverse the digits of x, preserving the sign
/ - Return 0 if the reversed value falls outside
/   [-2^31, 2^31 - 1]

/ Example 1:
/ Input: 123
/ Output: 321

/ Example 2:
/ Input: -123
/ Output: -321

/ Example 3:
/ Input: 120
/ Output: 21
/ (trailing zero is dropped once reversed)

/ Function Description:
/ reverseInteger takes:
/   - x: 32-bit signed integer

/ Returns:
/   - x with its digits reversed, or 0 on overflow

/ Constraints:
/ - -2^31 ≤ x ≤ 2^31 - 1

/ Notes:
/ - The sign is never part of the digit reversal itself

/ Goal:
/ - Handle the overflow case explicitly, don't just let it wrap
/ =============================================================


/ Solution Info ===============================================
/ reverseInteger 123

reverseInteger:{[x]
  sign:$[x<0;-1;1];
  val:"J"$reverse string abs x;
  result:sign*val;
  intMin:-2147483648;
  intMax:2147483647;
  $[(result<intMin) or result>intMax; 0; result]
 }
/ =============================================================
