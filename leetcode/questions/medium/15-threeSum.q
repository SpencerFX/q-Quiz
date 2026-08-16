/ Question Info ===============================================
/ 3Sum

/ Given a list of integers, find all unique triplets that sum
/ to zero.

/ Task:
/ - Find every distinct triplet [a, b, c] from nums such that
/   a + b + c = 0
/ - No duplicate triplets in the result

/ Example 1:
/ Input: [-1, 0, 1, 2, -1, -4]
/ Output: [[-1, -1, 2], [-1, 0, 1]]

/ Example 2:
/ Input: [0, 1, 1]
/ Output: []
/ (no triplet sums to zero)

/ Function Description:
/ threeSum takes:
/   - nums: list of integers

/ Returns:
/   - list of triplets (each a 3-element list), no duplicates

/ Constraints:
/ - 3 ≤ count nums ≤ 3000
/ - -10^5 ≤ nums[i] ≤ 10^5

/ Notes:
/ - The same value may appear multiple times in nums but a
/   triplet of *values* should never be reported twice

/ Goal:
/ - Sort first, then use a two-pointer sweep per anchor index
/   rather than a brute-force O(n^3) triple loop
/ =============================================================


/ Solution Info ===============================================
/ threeSum -1 0 1 2 -1 -4

threeSum:{[nums]
  s:asc nums;
  n:count s;
  result:();
  i:0;
  while[i<n-2;
    lo:i+1;
    hi:n-1;
    while[lo<hi;
      sum3:s[i]+s[lo]+s[hi];
      if[sum3=0;
        result,:enlist (s[i];s[lo];s[hi]);
        lo+:1;
        hi-:1
       ];
      if[sum3<0; lo+:1];
      if[sum3>0; hi-:1];
     ];
    i+:1;
   ];
  distinct result
 }
/ =============================================================
