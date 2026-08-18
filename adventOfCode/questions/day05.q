/ PUZZLE 5 =========================================
/ The input has two blocks separated by a blank line: first a list of
/ inclusive ranges "lo-hi" (one per line), then a list of individual
/ query points (one number per line).

/ Part 1: how many of the query points fall inside at least one of
/ the ranges?

/ Part 2: counting every range's covered integers only once even
/ where ranges overlap, how many integers in total are covered by
/ the ranges?

/ Function Description:
/ day05 takes the puzzle input as a list of strings (ranges, then a
/ blank line, then points) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day05 ("10-20";"15-25";"50-60";"";"12";"22";"30";"55")

day05:{[lines]
    blankAt:first where lines~\:"";
    rangeLines:blankAt#lines;
    pointLines:(blankAt+1)_lines;
    ranges:{"J"$"-" vs x} each rangeLines;
    points:"J"$pointLines;
    coveredByAny:{[point;ranges] any point within/: ranges};
    part1:sum coveredByAny[;ranges] each points;
    merge:{[acc;r]
        if[0=count acc; :enlist r];
        n:count acc;
        lastR:acc[n-1];
        $[(r 0)<=1+lastR 1;
            @[acc;n-1;:;(lastR 0;lastR[1] | r 1)];
            acc,enlist r
         ]
     };
    sorted:ranges iasc ranges[;0];
    coverage:merge/[();sorted];
    part2:sum {(1+x[1])-x[0]} each coverage;
    (part1;part2)
 };
/ =============================================================
