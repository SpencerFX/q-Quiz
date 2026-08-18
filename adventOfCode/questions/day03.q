/ PUZZLE 3 =========================================
/ Each line of input is a string of decimal digits, eg "398121".

/ From each line, choose K digits - keeping them in their original
/ left-to-right order - to form the largest possible K-digit number.

/ Part 1: K = 2. Sum the best 2-digit number from every line.
/ Part 2: K = 4. Sum the best 4-digit number from every line.

/ Function Description:
/ day03 takes the puzzle input as a list of digit-strings (one per
/ line) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day03 ("398121";"5207";"9081726354")

day03:{[lines]
    best:{[k;s]
        if[k=1; :enlist max s];
        a:max (1-k)_s;
        (enlist a),.z.s[k-1;(1+first s?a)_s]
     };
    part1:sum "J"$ best[2;] each lines;
    part2:sum "J"$ best[4;] each lines;
    (part1;part2)
 };
/ =============================================================
