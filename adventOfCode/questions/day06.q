/ PUZZLE 6 =========================================
/ The input describes a grid of numbers arranged in columns, followed
/ by one operator per column ("+" or "*") on the final line, eg:

/   2 2 5
/   3 3 5
/   4 4 5
/   + * +

/ For each column, fold its own operator top-to-bottom over its
/ numbers to get that column's total.

/ Part 1: sum every column's total.

/ Part 2: swap every column's operator (+ becomes *, * becomes +),
/ recompute each column's total the same way, and sum those instead.

/ Function Description:
/ day06 takes the puzzle input as a list of strings (number rows then
/ the operator row) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day06 ("2 2 5";"3 3 5";"4 4 5";"+ * +")

day06:{[lines]
    rows:"J"$'" " vs' -1_lines;
    columns:flip rows;
    ops:first each " " vs last lines;
    fold:{[op;col] $[op="+"; sum col; prd col]};
    part1:sum fold'[ops;columns];
    swapped:{[op] $[op="+";"*";"+"]} each ops;
    part2:sum fold'[swapped;columns];
    (part1;part2)
 };
/ =============================================================
