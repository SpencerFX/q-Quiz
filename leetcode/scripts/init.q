//====================================================================
// leetcode — init
//
// Mirrors hackerRank/scripts/init.q's load-by-folder convention:
// questions/ is split into difficulty subfolders (easy, medium,
// hard), each containing one file per problem which, once loaded,
// defines that problem's own reference solution as a global function
// (eg twoSum, addTwoNumbers). Those globals aren't used for grading
// - leetcode/solutions/checker.q grades against the precomputed
// .solutions.leetcode.* dicts instead, same as hackerRank - but
// loading the files is still how the question text
// (web/q/web_api.q's .web.leetcodeInfoLines) becomes available.
//
// Defines initLeetcode but doesn't call it - same as
// hackerRank/scripts/init.q, qIdioms/scripts/init.q and
// diChallenges/scripts/init.q, which are loaded then explicitly
// invoked by the top-level scripts/init.q.
//====================================================================

loadAllLeetcodeQuestions:{[]
    difficulties:key `:./leetcode/questions/;
    {[difficulty]
        dir:`$":./leetcode/questions/",string[difficulty],"/";
        files:key dir;
        / a nested {} does NOT close over the enclosing lambda's
        / params in q - difficulty has to be projected in explicitly
        {[difficulty;file] system"l ./leetcode/questions/",string[difficulty],"/",string file}[difficulty;] each files
     } each difficulties
 };

loadAllLeetcodeInputs:{[]
    filesInputs:key `:./leetcode/inputs/;
    {system"l ./leetcode/inputs/",string x} each filesInputs;
 };

loadAllLeetcodeSolutions:{[]
    filesSolutions:key `:./leetcode/solutions/;
    {system"l ./leetcode/solutions/",string x} each filesSolutions;
 };

initLeetcode:{[]
    loadAllLeetcodeQuestions[];
    loadAllLeetcodeInputs[];
    loadAllLeetcodeSolutions[];
 };
