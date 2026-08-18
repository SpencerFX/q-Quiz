/ PUZZLE 7 =========================================
/ The input is a grid. Row 0 has a single "S" (a source) somewhere in
/ it; every other cell is either "." (empty) or "^" (a splitter peg).

/ Water falls straight down from S, one row at a time. When flow
/ arriving at a cell finds a splitter "^" there, none of it continues
/ straight down - instead it splits evenly into the cells diagonally
/ down-left and down-right of the splitter (both in the peg's own
/ row), continuing to fall from there. Flow arriving at an empty cell
/ just continues straight down into the next row.

/ Part 1: how many times does flow hit a splitter, in total, as it
/ falls all the way to the bottom row?

/ Part 2: how much total flow reaches the bottom row?

/ Function Description:
/ day07 takes the puzzle input as a list of strings (the grid, one
/ row per line) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day07 ("...S...";".......";"...^...";".......";"..^.^..";".......")

day07:{[lines]
    R:count lines; C:count first lines;
    grid:lines;
    flow:(R;C)#0;
    sIdx:first where "S"=grid 0;
    flow[0;sIdx]:1;
    splitCount:0;
    row:1;
    while[row<R;
        prevRow:flow[row-1];
        curRow:(C)#0;
        j:0;
        while[j<C;
            if[prevRow[j]>0;
                cell:grid[row;j];
                isSplitter:cell="^";
                if[isSplitter;
                    splitCount+:1;
                    if[j>0; curRow[j-1]+:prevRow[j]];
                    if[j<C-1; curRow[j+1]+:prevRow[j]];
                 ];
                if[not isSplitter; curRow[j]+:prevRow[j]];
             ];
            j+:1
         ];
        flow[row]:curRow;
        row+:1
     ];
    part1:splitCount;
    part2:sum flow[R-1];
    (part1;part2)
 };
/ =============================================================
