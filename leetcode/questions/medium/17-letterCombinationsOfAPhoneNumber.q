/ Question Info ===============================================
/ Letter Combinations of a Phone Number

/ Given a string of digits from 2-9, return every possible
/ letter combination the digits could represent, using the
/ standard phone keypad mapping:

/ 2:abc  3:def  4:ghi  5:jkl  6:mno  7:pqrs  8:tuv  9:wxyz

/ Task:
/ - For each digit, look up its candidate letters
/ - Return every combination of one letter per digit

/ Example 1:
/ Input: "23"
/ Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

/ Example 2:
/ Input: ""
/ Output: []

/ Function Description:
/ letterCombinations takes:
/   - digits: string of digit characters, 2-9

/ Returns:
/   - list of strings, one per possible combination

/ Constraints:
/ - 0 ≤ length(digits) ≤ 4
/ - digits[i] is one of '2'..'9'

/ Notes:
/ - An empty input produces an empty list, not a list
/   containing the empty string

/ Goal:
/ - Build the combinations with a fold over the digits, rather
/   than digit-count-specific nested loops
/ =============================================================


/ Solution Info ===============================================
/ letterCombinations "23"

letterCombinations:{[digits]
  if[0=count digits; :()];
  mapping:"23456789"!("abc";"def";"ghi";"jkl";"mno";"pqrs";"tuv";"wxyz");
  letterSets:mapping digits;
  extend:{[acc;letters] raze {[acc;c] acc,\:c}[acc;] each letters};
  extend/[enlist "";letterSets]
 }
/ =============================================================
