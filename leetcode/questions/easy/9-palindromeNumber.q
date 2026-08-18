/ Question Info ===============================================
/ Palindrome Number

/ Given an integer x, return true if x reads the same
/ forwards and backwards.

/ Task:
/ - Determine whether x is a palindrome without extra
/   thought needed for negative numbers - handle them directly

/ Example 1:
/ Input: 121
/ Output: true

/ Example 2:
/ Input: -121
/ Output: false
/ (reads "121-" backwards, so it isn't a palindrome)

/ Example 3:
/ Input: 10
/ Output: false

/ Function Description:
/ isPalindromeNumber takes:
/   - x: integer

/ Returns:
/   - boolean

/ Constraints:
/ - -2^31 ≤ x ≤ 2^31 - 1

/ Notes:
/ - Negative numbers are never palindromes (the minus sign
/   only appears on one side)

/ Goal:
/ - Solve without converting back and forth more than once
/ =============================================================


/ Solution Info ===============================================
/ isPalindromeNumber 121

isPalindromeNumber:{[x]
  if[x<0; :0b];
  s:string x;
  s~reverse s
 }
/ =============================================================
