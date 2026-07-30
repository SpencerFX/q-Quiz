/ Question Info ===============================================
/ Median of Two Sorted Arrays

/ Given two sorted arrays nums1 and nums2 of size m and n,
/ return the median of the two sorted arrays.

/ The overall run time complexity should be O(log (m+n)).

/ The median is:
/ - the middle value if total length is odd
/ - the average of the two middle values if even

/ Example 1:
/ nums1 = [1,3]
/ nums2 = [2]
/ Output: 2.0

/ Example 2:
/ nums1 = [1,2]
/ nums2 = [3,4]
/ Output: 2.5

/ Function Description:
/ findMedianSortedArrays takes:
/   - nums1: sorted list of integers
/   - nums2: sorted list of integers

/ Returns:
/   - median value (float)

/ Constraints:
/ - nums1 and nums2 are sorted
/ - 0 ≤ m,n ≤ 1000
/ - 1 ≤ m+n ≤ 2000

/ Goal:
/ - Combine both arrays logically
/ - Find the median efficiently

/ =============================================================


/ Solution Info ===============================================
/findMedianSortedArrays[1 3; 2]       / 2f
/findMedianSortedArrays[1 2; 3 4]     / 2.5f

findMedianSortedArrays:{[nums1;nums2]
  combined:asc raze nums1,nums2;
  n:count combined;
  if[n=0; :0n];
  if[1=n mod 2;
    :1f * combined n div 2;
  ];
  mid:n div 2;
  (1f * combined[mid-1] + 1f * combined[mid]) % 2.0
 };
/ =============================================================