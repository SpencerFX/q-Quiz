/Question Info ===============================================
/
Migratory Birds

Given an array of bird sightings where each element represents
the type ID of a bird, determine the most frequently sighted type.

If more than one type has the highest frequency, choose the one
with the smallest ID.

Task:
- Count the frequency of each bird type
- Identify the type with the highest frequency
- If there is a tie, return the smallest type ID

Example:
arr = 1 4 4 4 5 3

Frequencies:
1 → 1
3 → 1
4 → 3
5 → 1

Result:
4

Function Description:
migratoryBirds takes:
  - arr: array of integers representing bird type IDs

Returns:
  - integer representing the most frequently sighted bird type

Input Format:
- First line: integer n (number of sightings)
- Second line: n space-separated integers (bird type IDs)

Output Format:
- Return a single integer representing the most common bird type

Constraints:
- 5 ≤ n ≤ 2 × 10^5
- 1 ≤ arr[i] ≤ 5

Notes:
- Bird type IDs are limited to values 1 through 5
- Efficient approach:
    - Use a frequency count array of size 5
    - Track counts for each type
    - Find the maximum frequency
    - Return the smallest ID among those with max frequency
- Time complexity should be O(n)

Goal:
- Accurately count occurrences
- Resolve ties by selecting the smallest ID
\
/=============================================================


/ Input Info ==================================================
input: 1 4 4 4 5 3;
solution: 4;
/ =============================================================


/ Solution Info ===============================================
/ migratoryBirds input
migratoryBirds:{[arr] 
  t:count each group arr;
  where t=max t
  };
/ =============================================================