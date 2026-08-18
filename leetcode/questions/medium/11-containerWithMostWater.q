/ Question Info ===============================================
/ Container With Most Water

/ You are given a list of non-negative integers, where each
/ value represents the height of a vertical line drawn at that
/ index. Find two lines that, together with the x-axis, form a
/ container that holds the most water.

/ Task:
/ - Choose two indices i and j
/ - The container's area is (j - i) * min(height[i], height[j])
/ - Return the maximum possible area

/ Example 1:
/ Input: [1, 8, 6, 2, 5, 4, 8, 3, 7]
/ Output: 49
/ (lines at index 1 (height 8) and index 8 (height 7):
/  width 7 * height 7 = 49)

/ Example 2:
/ Input: [1, 1]
/ Output: 1

/ Function Description:
/ maxArea takes:
/   - height: list of non-negative integers

/ Returns:
/   - the maximum container area (integer)

/ Constraints:
/ - 2 ≤ count height ≤ 10^5
/ - 0 ≤ height[i] ≤ 10^4

/ Notes:
/ - The container can't be tilted - area is strictly
/   width * the shorter of the two lines

/ Goal:
/ - Solve in O(n) with a two-pointer sweep, not O(n^2)
/ =============================================================


/ Solution Info ===============================================
/ maxArea 1 8 6 2 5 4 8 3 7

maxArea:{[height]
  n:count height;
  l:0;
  r:n-1;
  best:0;
  while[l<r;
    area:(r-l)*height[l]&height[r];
    best:best|area;
    $[height[l]<height[r]; l+:1; r-:1];
   ];
  best
 }
/ =============================================================
