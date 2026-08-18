//====================================================================
// adventOfCode/scripts/init.q
//
// Unlike euler, every problem file here defines its own uniquely
// named function (day01, day02, ...), so there's no cross-file name
// collision to work around - files just load straight into the root
// namespace, same as hackerRank/leetcode's per-problem files.
//====================================================================

loadAllAdventOfCodeQuestions:{[]
    files:key `:./adventOfCode/questions/;
    files:files where files like "day*.q";
    {system "l ./adventOfCode/questions/",string x} each files;
 };

loadAllAdventOfCodeInputs:{[]
    files:key `:./adventOfCode/inputs/;
    {system "l ./adventOfCode/inputs/",string x} each files;
 };

loadAllAdventOfCodeSolutions:{[]
    files:key `:./adventOfCode/solutions/;
    {system "l ./adventOfCode/solutions/",string x} each files;
 };

initAdventOfCode:{[]
    loadAllAdventOfCodeQuestions[];
    loadAllAdventOfCodeInputs[];
    loadAllAdventOfCodeSolutions[];
 };
