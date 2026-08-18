/ Question Info ===============================================
/ Parity Cellular Automaton

/ Today we hunt the most dangerous game: cellular automata.

/ Cellular automata are on-off (or living-dead) states in each
/ cell on a grid which iterate step-by-step depending only on
/ the current state of each cell and its neighbours. Here,
/ neighbours are considered the cell above, below, left, and
/ right of the current cell - no diagonals. The rules for
/ iteration in this system are as follows:
/ If a cell has an even number of surrounding "on" states, it
/ should be set to (or remain) off.
/ If a cell has an odd number of surrounding "on" states, it
/ should be set to (or remain) on.
/ Points outside the boundary are considered to be "off".

/ Your input is multiple sets of run times, square grid widths,
/ and the matrix index pairs of starting cells (0,0 is the top
/ left corner, etc)

/ For each input row, after constructing the start state and
/ running for the required number of steps, you need to find
/ how many are alive.
/ For example, with input:
/ 350 6 2 2 2 3

/ First construct a grid with width and height 6, and set
/ points (2,2) and (2,3) as "on":

/ ......
/ ......
/ ..##..
/ ......
/ ......
/ ......

/ This is the state at time 0. For times 1, 2, and 3 we iterate
/ as below:

/ ......
/ ..##..
/ .####.
/ ..##..
/ ......
/ ......

/ ..##..
/ ......
/ ##..##
/ ......
/ ..##..
/ ......

/ .####.
/ ######
/ ######
/ ######
/ .####.
/ ..##..

/ After 350 steps, we arrive at this state

/ .#..#.
/ ......
/ .#..#.
/ ......
/ #.##.#
/ ......

/ For this input, the answer is 8.
/ What is the sum of the living cells after the required run
/ time for each input?

/ Task:
/ - For each input row, build the starting grid, run the
/   parity rule for the given number of steps, and count the
/   living cells
/ - Sum that count across every input row

/ Example:
/ rows = enlist (350 6 2 2 2 3)

/ sumAliveAcrossInputs[rows]

/ Result:
/ 8

/ Function Description:
/ sumAliveAcrossInputs takes:
/   - rows: list of flat number lists, each formatted as
/     runTime, width, then (row;col) pairs of the cells that
/     start "on"

/ Returns:
/   - sum, across all rows, of the number of living cells after
/     that row's run time

/ Input Format:
/ - One row per line: runTime width r1 c1 r2 c2 ...

/ Constraints:
/ - runTime ≥ 0, width ≥ 1
/ - 1 ≤ count of starting cells, each within the grid bounds

/ Notes:
/ - A cell's next state depends only on how many of its (up to
/   4) in-bounds neighbours are currently "on" - its own current
/   state doesn't matter at all
/ - Cells outside the grid are always treated as "off" and
/   never come into existence
/ - This is a simulation, not a closed-form shortcut - just
/   step forward the required number of times

/ Goal:
/ - Solve for any grid width, run time, and number of starting
/   cells, not just the 6x6 two-cell example above
/ =============================================================


/ Solution Info ===============================================
/ sumAliveAcrossInputs[enlist 350 6 2 2 2 3]

step:{[g]
  n:count g;
  zeroRow:n#0;
  U:enlist[zeroRow],(-1_g);
  D:(1_g),enlist zeroRow;
  L:{[row] (enlist 0),-1_row} each g;
  R:{[row] (1_row),enlist 0} each g;
  (U+D+L+R) mod 2
 };

buildGrid:{[width;cells]
  g0:(width;width)#(width*width)#0;
  {[g;cell] .[g;(cell 0;cell 1);:;1]}/[g0;cells]
 };

countAlive:{[g] sum sum g};

parseRow:{[flatNums] (flatNums 0; flatNums 1; 2 cut 2_flatNums) };

solveRow:{[flatNums]
  p:parseRow[flatNums];
  g:buildGrid[p 1;p 2];
  gFinal:(p 0) step/ g;
  countAlive gFinal
 };

sumAliveAcrossInputs:{[rows] sum solveRow each rows }
/ =============================================================
