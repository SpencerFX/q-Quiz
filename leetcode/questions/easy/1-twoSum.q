/ Question Info ===============================================
/ Two Sum

/ Given an array of integers and a target value,
/ return the indices of the two numbers such that
/ they add up to the target.

/ You may assume that each input has exactly one solution,
/ and you may not use the same element twice.

/ Task:
/ - Find two distinct indices i and j
/ - Such that nums[i] + nums[j] = target
/ - Return the indices as a list

/ Example:
/ nums = [2, 7, 11, 15]
/ target = 9

/ nums[0] + nums[1] = 2 + 7 = 9

/ Result:
/ [0, 1]

/ Function Description:
/ twoSum takes:
/   - nums: list of integers
/   - target: integer

/ Returns:
/   - list of two indices

/ Input Format:
/ - First line: list of integers
/ - Second line: target integer

/ Constraints:
/ - 2 ≤ count nums ≤ 10^4
/ - -10^9 ≤ nums[i] ≤ 10^9
/ - Exactly one valid solution exists

/ Notes:
/ - Cannot reuse the same index twice
/ - Order of indices does not matter

/ Goal:
/ - Solve in O(n) time
/ - Avoid nested loops
/ =============================================================


/ Solution Info ===============================================
/ twoSum[2 7 11 15; 9]

twoSum:{[nums;target]
  seen:()!();
  i:0;
  n:count nums;

  while[i<n;
    val:nums[i];
    comp:target - val;

    if[comp in key seen;
      : (seen comp; i)
    ];

    seen[val]:i;
    i+:1;
  ];
 }
/ =============================================================
