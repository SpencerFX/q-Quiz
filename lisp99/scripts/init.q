//====================================================================
// lisp99 — init
//
// Mirrors fundamentals/scripts/init.q's load-by-folder convention -
// questions/, inputs/ and solutions/ each discovered from disk rather
// than hardcoded, so a new lisp99/questions/<difficulty>.q file (or a
// second inputs/solutions file) is picked up automatically.
//
// Defines initLisp99 but doesn't call it - same as every other
// section's scripts/init.q, which are loaded then explicitly invoked
// by the top-level scripts/init.q.
//====================================================================

loadAllLisp99Questions:{[]
    files:key `:./lisp99/questions/;
    {system "l ./lisp99/questions/",string x} each files;
 };

loadAllLisp99Inputs:{[]
    files:key `:./lisp99/inputs/;
    {system "l ./lisp99/inputs/",string x} each files;
 };

loadAllLisp99Solutions:{[]
    files:key `:./lisp99/solutions/;
    {system "l ./lisp99/solutions/",string x} each files;
 };

initLisp99:{[]
    loadAllLisp99Questions[];
    loadAllLisp99Inputs[];
    loadAllLisp99Solutions[];
 };
