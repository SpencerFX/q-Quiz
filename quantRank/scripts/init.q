//====================================================================
// quantRank — init
//
// Mirrors hackerRank/scripts/init.q and diChallenges/scripts/init.q's
// load-by-folder convention: questions/ is split into kind subfolders
// (probability, recursion), discovered from disk rather than
// hardcoded so new kinds are picked up automatically. Note the kind
// subfolder is purely storage organisation - every problem's actual
// data lives under .inputs.quant.probability.* regardless of which
// subfolder its question file is in (see solutions/checker.q).
//
// Defines initQuantRank but doesn't call it - same as the other
// sections' scripts/init.q, which are loaded then explicitly invoked
// by the top-level scripts/init.q.
//====================================================================

loadAllQuantRankQuestions:{[]
    kinds:key `:./quantRank/questions/;
    {[kind]
        dir:`$":./quantRank/questions/",string[kind],"/";
        files:key dir;
        / a nested {} does NOT close over the enclosing lambda's
        / params in q - kind has to be projected in explicitly
        {[kind;file] system"l ./quantRank/questions/",string[kind],"/",string file}[kind;] each files
     } each kinds
 };

loadAllQuantRankInputs:{[]
    filesInputs:key `:./quantRank/inputs/;
    {system"l ./quantRank/inputs/",string x} each filesInputs;
 };

loadAllQuantRankSolutions:{[]
    filesSolutions:key `:./quantRank/solutions/;
    {system"l ./quantRank/solutions/",string x} each filesSolutions;
 };

initQuantRank:{[]
    loadAllQuantRankQuestions[];
    loadAllQuantRankInputs[];
    loadAllQuantRankSolutions[];
 };
