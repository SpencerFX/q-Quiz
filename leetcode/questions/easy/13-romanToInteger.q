/ Question Info ===============================================
/ Roman to Integer

/ Given a roman numeral, convert it to an integer.

/ Roman numerals use these symbols:
/ I=1, V=5, X=10, L=50, C=100, D=500, M=1000

/ Usually symbols are added left to right (VI = 5+1 = 6), but
/ six pairs use subtractive notation instead: IV, IX, XL, XC,
/ CD, CM - the smaller symbol appears before the larger one and
/ is subtracted rather than added.

/ Task:
/ - Parse the roman numeral left to right
/ - Add a symbol's value, unless it is smaller than the symbol
/   immediately following it, in which case subtract it

/ Example 1:
/ Input: "III"
/ Output: 3

/ Example 2:
/ Input: "LVIII"
/ Output: 58
/ (L=50, V=5, III=3)

/ Example 3:
/ Input: "MCMXCIV"
/ Output: 1994
/ (M=1000, CM=900, XC=90, IV=4)

/ Function Description:
/ romanToInt takes:
/   - s: roman numeral (string)

/ Returns:
/   - integer value

/ Constraints:
/ - 1 ≤ length(s) ≤ 15
/ - s is a valid roman numeral in the range [1, 3999]

/ Notes:
/ - Only the six pairs listed above ever subtract - no other
/   symbol pair does

/ Goal:
/ - Solve in a single left-to-right pass
/ =============================================================


/ Solution Info ===============================================
/ romanToInt "MCMXCIV"

romanToInt:{[s]
  vals:("IVXLCDM"!1 5 10 50 100 500 1000) s;
  n:count vals;
  terms:{[vals;n;i] $[(i<n-1) and vals[i]<vals[i+1]; neg vals[i]; vals[i]]}[vals;n;] each til n;
  sum terms
 }
/ =============================================================
