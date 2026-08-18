//====================================================================
// adventOfCode/inputs/inputs.q
//
// One registered test input per problem, in the exact "args list"
// shape .web.judgeAdventOfCode hands straight to .[func;input;errFn] -
// each problem's dayNN function takes a single lines argument, so
// every entry here is `enlist <lines>` (a 1-element list holding that
// one argument), same convention as euler/inputs/inputs.q.
//====================================================================

.inputs.adventOfCode.easy: (!) . flip raze 2 cut
    (
        (`day01; enlist ("R50";"L30";"R80";"L45";"R15"));
        (`day02; enlist enlist "10-99,100-999");
        (`day03; enlist ("398121";"5207";"9081726354"));
        (`day04; enlist (".##..";"###..";"##...";"...##";"...##"));
        (`day05; enlist ("10-20";"15-25";"50-60";"";"12";"22";"30";"55"));
        (`day06; enlist ("2 2 5";"3 3 5";"4 4 5";"+ * +"));
        (`day07; enlist ("...S...";".......";"...^...";".......";"..^.^..";"......."));
        (`day08; enlist ("0 0";"1 1";"2 2";"10 10";"11 11";"12 10"))
    );
