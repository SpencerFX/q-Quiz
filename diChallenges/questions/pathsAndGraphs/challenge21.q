/ Question Info ===============================================
/ One-Minute Vacuum

/ It's late in the day, and you've just finished a rousing
/ session of AquaQ challenges. Looking at the clock, you realise
/ it's exactly one minute until your spouse gets home, and you
/ promised them you would vacuum the floor, which is currently
/ covered in the debris of a week-long problem-solving session.

/ You note the hallway floor is covered in a grid of square
/ tiles, and is 20 tiles wide and 500 long. Each tile is covered
/ in a certain amount of dust motes. Quickly you estimate this
/ coverage as relative integers, and note them as your input.
/ Your vacuum cleaner attachment is 5 tiles wide, and for an
/ effective cleaning action, you have to run it so it exactly
/ covers whole tiles. You have time for exactly one pass down
/ the hallway, and can move your vacuum cleaner left or right
/ one tile at a time, or continue straight, as you move forward
/ one tile at a time.

/ In your single pass down the hallway, starting from any tile
/ on the first row and moving the whole way down, how many
/ motes of dust can you collect, assuming you clean all the
/ dust from each tile?

/ For an example hallway, with a cleaner width of 3 tiles:
/ 3 4 5 1 3
/ 9 3 4 0 9
/ 4 5 4 4 7
/ 3 7 9 8 2

/ You can sweep the following tile path to maximise collected
/ motes:
/ [3 4 5] 1 3
/ [9 3 4] 0 9
/ 4 [5 4 4] 7
/ 3 [7 9 8] 2

/ total: 65

/ Task:
/ - For each row, the vacuum covers a contiguous run of `width`
/   tiles - between consecutive rows, the run's starting column
/   may shift left by one, right by one, or stay put
/ - Choose a starting column on the first row and a shift at
/   every subsequent row to maximise the total dust collected
/   across the whole pass

/ Example:
/ grid = (3 4 5 1 3; 9 3 4 0 9; 4 5 4 4 7; 3 7 9 8 2)
/ width = 3

/ maxDustCollected[grid;width]

/ Result:
/ 65

/ Function Description:
/ maxDustCollected takes:
/   - grid: list of rows, each row a list of integer dust
/     counts for that row's tiles (relative integers - may be
/     negative)
/   - width: the vacuum's width in tiles

/ Returns:
/   - the maximum total dust collectible in a single top-to-
/     bottom pass, choosing the best starting column and best
/     left/right/straight shift at every row

/ Input Format:
/ - The hallway grid, one row per line
/ - The vacuum width

/ Constraints:
/ - 1 <= width <= tile count of each row
/ - Every row is the same length
/ - The grid has at least one row

/ Notes:
/ - The vacuum's run must exactly cover whole tiles - it cannot
/   hang off the edge of the hallway
/ - Every tile the run covers on a row is collected in full,
/   including tiles collected on a previous row if the run
/   didn't move

/ Goal:
/ - Solve for any grid size and vacuum width, not just the
/   4x5 example
/ =============================================================


/ Solution Info ===============================================
/ grid = (3 4 5 1 3; 9 3 4 0 9; 4 5 4 4 7; 3 7 9 8 2)
/ maxDustCollected[grid;3]

windowSums:{[row;width]
  ncols:count row;
  positions:til 1+ncols-width;
  sum each row[positions +/: til width]
 };

maxDustCollected:{[grid;width]
  nrows:count grid;
  wsAll:windowSums[;width] each grid;
  dp:first wsAll;
  i:1;
  while[i<nrows;
    ws:wsAll i;
    n:count dp;
    dp:{[dp;ws;n;p]
        lo:max(0;p-1); hi:min(n-1;p+1);
        ws[p]+max dp[lo+til 1+hi-lo]
       }[dp;ws;n;] each til n;
    i+:1
   ];
  max dp
 }
/ =============================================================
