/ Question Info ===============================================
/ Mini-Max Sum
/ Given five positive integers, find the minimum and maximum values
/ that can be calculated by summing exactly four of the five integers.
 
/ Then print the respective minimum and maximum values as a single
/ line of two space-separated long integers.

/ Task:
/ - From the 5 integers, compute all possible sums of exactly 4 elements
/ - Determine:
/     - The minimum possible sum
/     - The maximum possible sum
/ - Print both values on a single line

/ Example:
/ arr = 1 3 5 7 9

/ Possible sums:
/ - Exclude 1 → 3 + 5 + 7 + 9 = 24
/ - Exclude 3 → 1 + 5 + 7 + 9 = 22
/ - Exclude 5 → 1 + 3 + 7 + 9 = 20
/ - Exclude 7 → 1 + 3 + 5 + 9 = 18
/ - Exclude 9 → 1 + 3 + 5 + 7 = 16

/ Result:
/ 16 24

/ Function Description:
/ miniMaxSum takes:
/   - arr: array of 5 integers

/ Returns:
/   - None (prints two space-separated integers)
 
/ Input Format:
/ - A single line of five space-separated integers

/ Output Format:
/ - Print two space-separated integers:
/     - minimum sum
/     - maximum sum

/ Constraints:
/ - 1 ≤ arr[i] ≤ 10^9
/ - Exactly 5 integers are provided

/ Notes:
/ - Use 64-bit integers (long) to avoid overflow :contentReference[oaicite:1]{index=1}
/ - Efficient approach:
/     totalSum = sum(arr)
/     minSum = totalSum - max(arr)
/     maxSum = totalSum - min(arr)
/ - No need to compute all combinations explicitly

/ Goal:
/ - Efficiently compute min and max sums
/ - Handle large integer values correctly
/ =============================================================


/ Input Info ==================================================
input: 1 2 3 4 5;
/ =============================================================


/ Solution Info ===============================================
/ miniMaxSum input
miniMaxSum:{[arr]
  s:sum arr;
  mn:min arr;
  mx:max arr;
  (s-mx; s-mn)
 };
/ =============================================================