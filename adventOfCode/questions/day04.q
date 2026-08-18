/ PUZZLE 4 =========================================
/ The input is a grid of pebbles: "#" is a pebble, "." is empty
/ floor. A pebble is "loose" if it has fewer than 4 other pebbles
/ among its 8 surrounding cells (including diagonals).

/ Part 1: how many pebbles are loose in the grid exactly as given?

/ Part 2: repeatedly remove every loose pebble at once, then
/ recheck the remaining pebbles (removed pebbles no longer count as
/ neighbours), until no more pebbles are loose. How many pebbles are
/ removed in total?

/ Function Description:
/ day04 takes the puzzle input as a list of strings (the grid, one
/ row per line) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day04 (".##..";"###..";"##...";"...##";"...##")

/ Adds a 1-cell border of 0b around a boolean grid, so every real
/ cell can safely read a full 3x3 neighbourhood without bounds checks.
pad:{[g]
    r:count g; c:count first g;
    midRows:0b,/:g,\:0b;
    zeroRow:(c+2)#0b;
    enlist[zeroRow],midRows,enlist[zeroRow]
 };

/ Count of "#" cells among the 8 neighbours of every real cell in g,
/ via a padded copy so edge/corner cells don't need special-casing.
neighbourCounts:{[g]
    r:count g; c:count first g;
    padded:pad g;
    perRow:{[padded;c;i]
        {[padded;i;j] (sum sum padded[(i-1)+til 3][;(j-1)+til 3]) - padded[i][j]}[padded;i;] each 1+til c
     };
    perRow[padded;c;] each 1+til r
 };

day04:{[lines]
    grid:"#"=lines;
    part1:sum raze grid and 4>neighbourCounts grid;
    eroded:grid;
    total:0;
    keepGoing:1b;
    while[keepGoing;
        nc:neighbourCounts eroded;
        loose:eroded and 4>nc;
        removed:sum raze loose;
        keepGoing:removed>0;
        if[keepGoing;
            total+:removed;
            eroded:eroded and not loose;
         ];
     ];
    (part1;total)
 };
/ =============================================================
