/ Question Info ===============================================
/ Lift Instructions

/ Your childhood dream has been fulfilled: you are a lift in
/ the world's tallest building. Your instructions come in a
/ series of number pairs for each floor. The first number
/ indicates whether you should continue in the same direction
/ (1) or immediately reverse direction (0).

/ After this is decided, the second number indicates how many
/ floors you should immediately move by. You continue in the
/ same direction until you see a zero instruction in the first
/ number. Your working day is over when you land on a floor
/ without instructions.

/ For example, if you had the instruction set:
/ 1 2   //0
/ 0 3   //1
/ 1 1   //2
/ 0 1   //3
/ 1 5   //4

/ Starting at floor 0, you would move 2 floors up to floor 2,
/ then 1 floor to floor 3, and immediately reverse direction.
/ Then move 1 floor back to floor 2, then 1 more back to floor
/ 1, at which point you reverse direction again, moving to
/ floor 4, which sends you to floor 9 - which has no
/ instructions. Your work is then done, and you'll have visited
/ 7 floors - 0, 1, 2 (twice), 3, 4 and 9.

/ How many floors do you visit before finishing when following
/ your input instructions?

/ Task:
/ - Starting at floor 0 moving upward, repeatedly look up the
/   instruction for the current floor, reverse direction first
/   if its first number is 0, then move by its second number in
/   the (possibly just-reversed) direction
/ - Stop as soon as you land on a floor with no instruction
/ - Count every floor landed on, including the start and the
/   final unlisted floor, counting repeat visits separately

/ Example:
/ instr = (1,2) (0,3) (1,1) (0,1) (1,5)

/ Path: 0 -> 2 -> 3 -> 2 -> 1 -> 4 -> 9

/ Result:
/ 7

/ Function Description:
/ simulate takes:
/   - instr: list of (continueFlag;steps) pairs, where the
/     pair at index i is the instruction for floor i

/ Returns:
/   - count of floors visited (including repeats) before
/     landing on a floor past the end of instr

/ Input Format:
/ - One (continueFlag;steps) pair per line, in floor order
/   starting from floor 0

/ Constraints:
/ - continueFlag is 0 or 1
/ - steps is a positive integer
/ - 1 ≤ count instr

/ Notes:
/ - You start moving upward
/ - The reversal (if any) at a floor happens before that
/   floor's step count is applied, and applies to that same
/   move
/ - Floors below 0 also count as "without instructions" and
/   end the day, same as running off the top

/ Goal:
/ - Solve with a single pass that stops as soon as it steps
/   outside the instruction list
/ =============================================================


/ Solution Info ===============================================
/ simulate[((1;2);(0;3);(1;1);(0;1);(1;5))]

simulate:{[instr]
  n:count instr;
  curFloor:0;
  dir:1;
  visited:1;
  running:1b;
  while[running;
    $[(curFloor<0) or curFloor>=n;
      running:0b;
      [
        pair:instr curFloor;
        flag:pair 0; steps:pair 1;
        if[flag=0; dir:neg dir];
        curFloor:curFloor+dir*steps;
        visited+:1
       ]
     ]
   ];
  visited
 }
/ =============================================================
