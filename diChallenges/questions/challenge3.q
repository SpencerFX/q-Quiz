/ Question Info ===============================================
/ Room Walker

/ You're in an oddly shaped room, there are squares on the
/ floor and you move one square at a time. The room looks like
/ this:

/   ##
/  ####
/ ######
/ ######
/  ####
/   ##

/ This is a six-by-six area defined in indices from 0 to 5 on
/ each axis.

/ You start in the first # in the top row, or position 0 2 in
/ indices, and receive a series of instructions to step up (U)
/ left (L) right (R) or down (D) on the map above. You can't
/ step outside the # - if you're given an instruction to do so,
/ ignore it, and move on to the next instruction.

/ For example, with input UDRR, you eventually run out of
/ instructions at position 1 4.

/ After processing all the movements in your input, what is the
/ sum of the indices of each position you finished on at each
/ step (including steps where you did not move)?

/ For example, with input UDRR, you would start on 0 2, stay on
/ 0 2 then move through 1 2, 1 3 and 1 4. The sum of these
/ positions is 14 - the first position is not counted.

/ Task:
/ - Walk the room applying one instruction at a time from
/   position 0 2, ignoring any instruction that would leave
/   the room's # shape
/ - Sum the row and column indices of the position reached
/   after every instruction (the starting position before any
/   instruction is not counted, even if the first move is
/   ignored and you remain there)

/ Example:
/ instr = "UDRR"

/ Positions after each instruction:
/ 0 2 (U ignored)
/ 1 2 (D)
/ 1 3 (R)
/ 1 4 (R)

/ Result:
/ 14

/ Function Description:
/ sumPositions takes:
/   - instr: string of U/D/L/R instructions

/ Returns:
/   - sum of all row and column indices across every
/     post-instruction position

/ Input Format:
/ - Single line containing the instruction string

/ Constraints:
/ - 1 ≤ count instr
/ - instr only contains the characters U, D, L and R

/ Notes:
/ - The room shape, row by row (0 to 5), spans columns:
/   row 0: 2-3, row 1: 1-4, row 2: 0-5, row 3: 0-5,
/   row 4: 1-4, row 5: 2-3
/ - An ignored instruction still counts as a step - the
/   unchanged position is included in the sum

/ Goal:
/ - Solve with a single pass/scan over the instructions
/ =============================================================


/ Solution Info ===============================================
/ sumPositions["UDRR"]

grid:("  ##  ";" #### ";"######";"######";" #### ";"  ##  ");

isValid:{[r;c] $[(r<0)|(r>5)|(c<0)|(c>5); 0b; "#"=grid[r;c]]};

stepFn:{[pos;ch]
  r:pos 0; c:pos 1;
  np:$[ch="U";(r-1;c); ch="D";(r+1;c); ch="L";(r;c-1); ch="R";(r;c+1); pos];
  $[isValid . np; np; pos]
 };

walk:{[instr] stepFn\[(0;2);instr] };

sumPositions:{[instr] sum raze walk instr }
/ =============================================================
