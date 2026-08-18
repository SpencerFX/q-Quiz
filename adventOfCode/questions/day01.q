/ PUZZLE 1 =========================================
/ A workshop dial is numbered 0 to 99 and starts at position 0.
/ Each line of input is a turn instruction: a direction (R = clockwise,
/ one position per step; L = counter-clockwise, one position per step)
/ followed by how many steps to turn, eg "R30" or "L45".

/ Part 1: after each COMPLETE instruction, how many times does the
/ dial end up exactly on position 50 (directly opposite the start)?

/ Part 2: this time count every INDIVIDUAL step across all
/ instructions (not just where each instruction ends) - how many
/ times does the dial pass through or land on position 50?

/ Function Description:
/ day01 takes the puzzle input as a list of strings (one instruction
/ per line) and returns (part1;part2).
/ =====================================================


/ Solution Info ===============================================
/ day01 ("R50";"L30";"R80";"L45";"R15")

day01:{[lines]
    dir:{$["R"=x;1;-1]} each first each lines;
    mag:"J"$1_'lines;
    signed:dir*mag;
    endPos:(sums signed) mod 100;
    part1:sum 50=endPos;
    units:raze mag#'dir;
    allPos:(sums units) mod 100;
    part2:sum 50=allPos;
    (part1;part2)
 };
/ =============================================================
