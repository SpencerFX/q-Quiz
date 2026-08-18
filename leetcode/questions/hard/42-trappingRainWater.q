/ Question Info ===============================================
/ Trapping Rain Water

/ Given a list of non-negative integers representing an
/ elevation map where the width of each bar is 1, compute how
/ much water it can trap after raining.

/ Task:
/ - For every position, water pools up to the shorter of the
/   tallest bar to its left and the tallest bar to its right,
/   minus the bar's own height (never negative)
/ - Return the total trapped water across all positions

/ Example 1:
/ Input: [0,1,0,2,1,0,1,3,2,1,2,1]
/ Output: 6

/ Example 2:
/ Input: [4,2,0,3,2,5]
/ Output: 9

/ Function Description:
/ trap takes:
/   - height: list of non-negative integers

/ Returns:
/   - total trapped water (integer)

/ Constraints:
/ - 1 ≤ count height ≤ 2*10^4
/ - 0 ≤ height[i] ≤ 10^5

/ Notes:
/ - A bar at the very edge of the map can never trap water on
/   its outer side - there's nothing there to hold it in

/ Goal:
/ - Solve in O(n) using running max-from-left and
/   max-from-right arrays, not a per-position rescan
/ =============================================================


/ Solution Info ===============================================
/ trap 0 1 0 2 1 0 1 3 2 1 2 1

trap:{[height]
  if[0=count height; :0];
  leftMax:maxs height;
  rightMax:reverse maxs reverse height;
  waterLevel:leftMax&rightMax;
  sum 0|waterLevel-height
 }
/ =============================================================
