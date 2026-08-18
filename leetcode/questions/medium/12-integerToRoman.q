/ Question Info ===============================================
/ Integer to Roman

/ Given an integer, convert it to a roman numeral.

/ Roman numerals use these symbols:
/ I=1, V=5, X=10, L=50, C=100, D=500, M=1000

/ Six pairs use subtractive notation: IV(4), IX(9), XL(40),
/ XC(90), CD(400), CM(900).

/ Task:
/ - Convert num into its roman numeral representation

/ Example 1:
/ Input: 58
/ Output: "LVIII"
/ (L=50, V=5, III=3)

/ Example 2:
/ Input: 1994
/ Output: "MCMXCIV"
/ (M=1000, CM=900, XC=90, IV=4)

/ Function Description:
/ intToRoman takes:
/   - num: integer

/ Returns:
/   - roman numeral (string)

/ Constraints:
/ - 1 ≤ num ≤ 3999

/ Notes:
/ - Greedily using the largest value/symbol pair that still
/   fits, repeatedly, produces a valid roman numeral

/ Goal:
/ - Solve with a fixed value/symbol table, not string
/   concatenation special-cased per digit position
/ =============================================================


/ Solution Info ===============================================
/ intToRoman 1994

intToRoman:{[num]
  vals:1000 900 500 400 100 90 50 40 10 9 5 4 1;
  syms:("M";"CM";"D";"CD";"C";"XC";"L";"XL";"X";"IX";"V";"IV";"I");
  step:{[vals;syms;acc;i]
    n:acc 0;
    res:acc 1;
    v:vals i;
    s:syms i;
    cnt:n div v;
    res:res,$[cnt=0;"";raze cnt#enlist s];
    n:n mod v;
    (n;res)
   }[vals;syms;;];
  final:step/[(num;"");til count vals];
  final 1
 }
/ =============================================================
