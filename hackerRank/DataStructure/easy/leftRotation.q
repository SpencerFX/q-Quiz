/ Question Info ===============================================
/ Left Rotation

/ Given an array of integers and a number of rotations,
/ perform left rotations on the array.
 
/ A left rotation shifts each element of the array to the left
/ by one position. The first element moves to the end of the array.
 
/ Task:
/ - Rotate the array to the left by d positions
/ - Return the resulting array

/ Example:
/ arr = [1, 2, 3, 4, 5]
/ d = 2

/ After 1 rotation: [2, 3, 4, 5, 1]
/ After 2 rotations: [3, 4, 5, 1, 2]

/ Result:
/ [3, 4, 5, 1, 2]

/ Function Description:
/ rotateLeft takes:
/   - d: number of left rotations
/   - arr: array of integers

/ Returns:
/   - array of integers after rotation

/ Input Format:
/ - First line contains two integers n and d
/ - Second line contains n space-separated integers

/ Constraints:
/ - 1 ≤ n ≤ 10^5
/ - 1 ≤ d ≤ n

/ Notes:
/ - Rotations wrap around the array
/ - Rotating by n results in the same array
/ - Rotating by d > n is equivalent to d mod n

/ Goal:
/ - Efficiently perform the rotation
/ - Avoid unnecessary repeated shifts
/ =============================================================

/ Solution Info ===============================================
/ leftRotation[2;1 2 3 4 5]
leftRotation:{[d;arr]
  / (d mod count arr) rotate arr
  d rotate arr
 }
/ =============================================================