/Question Info ===============================================
/
Counting Valleys

An avid hiker keeps track of their hikes using a sequence of steps.

- Each step is represented by a character:
    'U' → step up
    'D' → step down

A valley is defined as a sequence of consecutive steps below sea level,
starting with a step down from sea level and ending with a step up to sea level.

Task:
- Determine the number of valleys walked through during the hike

Example:
steps = 8
path = "UDDDUDUU"

Process:
Start at sea level (0)

U → 1
D → 0
D → -1 (enter valley)
D → -2
U → -1
D → -2
U → -1
U → 0 (exit valley → count = 1)

Result:
1

Function Description:
countingValleys takes:
  - steps: integer (number of steps)
  - path: string of 'U' and 'D'

Returns:
  - integer representing number of valleys

Input Format:
- First line: integer steps
- Second line: string path

Output Format:
- Return a single integer representing number of valleys

Constraints:
- 2 ≤ steps ≤ 10^6
- path consists only of characters 'U' and 'D'

Notes:
- Track current altitude starting at 0
- A valley is counted when:
    - A step up ('U') brings altitude from -1 to 0
- Efficient approach:
    - Iterate once through path
    - Update altitude for each step
    - Count valley exits

Goal:
- Correctly track altitude changes
- Identify valley transitions accurately
\
/=============================================================


/ Input Info ==================================================
input:"UDDDUDUU";
/ =============================================================


/ Solution Info ===============================================
/ countingValleys input
countingValleys:{[p]
  steps:1 - 2 *' (p="D");
  level:sums steps;
  sum (level=0) & (steps=1)
 };
/ =============================================================