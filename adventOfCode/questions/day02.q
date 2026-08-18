/ PUZZLE 2 =========================================
/ The input is a single line of comma-separated ranges, eg
/ "10-99,100-999" - each range "lo-hi" is inclusive at both ends.

/ A number is a "repeat code" if its decimal digits are made up of
/ one block repeated two or more times, eg 4242 ("42" twice), 777
/ ("7" three times), 123123123 ("123" three times) - a number is NOT
/ a repeat code if it has no such repeating block, eg 123 or 1122.

/ Part 1: sum every number, across all the ranges, whose digits are
/ EXACTLY one block repeated TWICE (like 4242, but not 777 or
/ 123123123).

/ Part 2: sum every number, across all the ranges, whose digits are
/ a block repeated ANY number of times two or more (4242, 777 AND
/ 123123123 all now count).

/ Function Description:
/ day02 takes the puzzle input as a 1-element list holding the single
/ ranges line, and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day02 enlist "10-99,100-999"

day02:{[lines]
    ranges:{"J"$"-" vs x} each "," vs first lines;
    nums:raze {x+til 1+y-x} .' ranges;
    isExactDouble:{[n]
        s:string n;
        c:count s;
        (0=c mod 2) and s~raze 2#enlist (c div 2)#s
     };
    isAnyRepeat:{[n]
        s:string n;
        c:count s;
        divs:(1+til c) where 0=c mod 1+til c;
        properDivs:-1_ divs;
        any {[s;c;p] s~raze (c div p)#enlist p#s}[s;c;] each properDivs
     };
    part1:sum nums where isExactDouble each nums;
    part2:sum nums where isAnyRepeat each nums;
    (part1;part2)
 };
/ =============================================================
