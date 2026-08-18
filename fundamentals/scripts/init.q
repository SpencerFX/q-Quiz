//====================================================================
// fundamentals — init
//
// Mirrors diChallenges/scripts/init.q and quantRank/scripts/init.q's
// load-by-folder convention: questions/ is split into kind
// subfolders (overloads, qsql), discovered from disk rather than
// hardcoded.
//
// Defines initFundamentals but doesn't call it - same as every other
// section's scripts/init.q, which are loaded then explicitly invoked
// by the top-level scripts/init.q.
//====================================================================

loadAllFundamentalsQuestions:{[]
    kinds:key `:./fundamentals/questions/;
    {[kind]
        dir:`$":./fundamentals/questions/",string[kind],"/";
        files:key dir;
        / a nested {} does NOT close over the enclosing lambda's
        / params in q - kind has to be projected in explicitly
        {[kind;file] system"l ./fundamentals/questions/",string[kind],"/",string file}[kind;] each files
     } each kinds
 };

loadAllFundamentalsInputs:{[]
    filesInputs:key `:./fundamentals/inputs/;
    {system"l ./fundamentals/inputs/",string x} each filesInputs;
 };

loadAllFundamentalsSolutions:{[]
    filesSolutions:key `:./fundamentals/solutions/;
    {system"l ./fundamentals/solutions/",string x} each filesSolutions;
 };

initFundamentals:{[]
    loadAllFundamentalsQuestions[];
    loadAllFundamentalsInputs[];
    loadAllFundamentalsSolutions[];
 };
