/ Question Info ===============================================
/ Plus Minus
/ Given an array of integers, calculate the ratios of its elements
/ that are positive, negative, and zero.
 
/ Print the decimal value of each fraction on a new line with
/ 6 places after the decimal.
 
/ Task:
/ - Count the number of positive, negative, and zero elements
/ - Divide each count by the total number of elements
/ - Print the results in order:
/     1) positive ratio
/     2) negative ratio
/     3) zero ratio

/ Example:
/ arr = [-4, 3, -9, 0, 4, 1]

/ Output:
/ 0.500000
/ 0.333333
/ 0.166667

/ Explanation:
/ - positives: 3/6 = 0.500000
/ - negatives: 2/6 = 0.333333
/ - zeros:     1/6 = 0.166667

/ Function Description:
/ plusMinus takes:
/   - arr: array of integers

/ Returns:
/   - None (prints ratios to standard output)
 
/ Input Format:
/ - First line: integer n (number of elements)
/ - Second line: n space-separated integers

/ Constraints:
/ - 1 ≤ n ≤ 100
/ - -100 ≤ arr[i] ≤ 100

/ Notes:
/ - Output must be formatted to 6 decimal places
/ - Division should be performed in floating point
/ - Ensure correct handling of zero values

/ Goal:
/ - Accurately compute ratios of positives, negatives, and zeros
/ - Format output correctly
/ =============================================================


/ Input Info ==================================================
/ input: (-4 3 -9 0 4 1f);
/ =============================================================


/ Solution Info ===============================================
/ plusMinus input
plusMinus:{[arr]
  n:count arr;
  posNum:sum arr>0;
  negNum:sum arr<0;
  zer:sum arr=0;

  (posNum % n; negNum % n;zer % n)
 };
/ =============================================================