//====================================================================
// diChallenges — init
//
// Was previously a stray copy of hackerRank/scripts/init.q (loaded
// hackerRank/Algorithms etc., not anything under diChallenges/, and
// defined functions with the same names as the real hackerRank
// loaders - a collision waiting to happen if both were ever loaded
// in the same session). Replaced with a loader that actually walks
// this directory, mirroring the load-by-folder convention used by
// hackerRank/scripts/init.q and qIdioms/scripts/init.q.
//
// questions/ is one level deeper than inputs/ or solutions/ - it's
// split into kind subfolders (listOps, maths, pathsAndGraphs, ...) -
// so this discovers those kinds from disk rather than hardcoding
// them, picking up new kinds automatically as folders are added.
//
// Defines initDiChallenges but doesn't call it - same as
// hackerRank/scripts/init.q and qIdioms/scripts/init.q, which are
// loaded then explicitly invoked by the top-level scripts/init.q.
//====================================================================

loadAllDiChallengeQuestions:{[]
    kinds:key `:./diChallenges/questions/;
    {[kind]
        dir:`$":./diChallenges/questions/",string[kind],"/";
        files:key dir;
        / a nested {} does NOT close over the enclosing lambda's
        / params in q - kind has to be projected in explicitly
        {[kind;file] system"l ./diChallenges/questions/",string[kind],"/",string file}[kind;] each files
     } each kinds
 };

loadAllDiChallengeInputs:{[]
    filesInputs:key `:./diChallenges/inputs/;
    {system"l ./diChallenges/inputs/",string x} each filesInputs;
 };

loadAllDiChallengeSolutions:{[]
    filesSolutions:key `:./diChallenges/solutions/;
    {system"l ./diChallenges/solutions/",string x} each filesSolutions;
 };

initDiChallenges:{[]
    loadAllDiChallengeQuestions[];
    loadAllDiChallengeInputs[];
    loadAllDiChallengeSolutions[];
 };
