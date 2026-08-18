//====================================================================
// euler/scripts/init.q
//
// Every problem file (euler/questions/problemNNNN.q) defines its
// solve function under the *same* top-level name "solve" (and some
// reuse generic helper names too, eg problem0005's gcd). Loading two
// of them straight into the root namespace would let the second file
// silently clobber the first's solve. Each file is instead loaded into
// its own .problemNNNN namespace - q remembers a lambda's defining
// namespace for its own unqualified name lookups, so eg problem0001's
// solve still resolves its own multiplesCheck correctly no matter what
// namespace is active when solve is later called - then the context is
// reset back to root before the next file loads.
//
// Namespaces are single-level (.problemNNNN, not .euler.problemNNNN) -
// this q build's \d only accepts one dotted segment at a time (\d
// .a.b fails even when .a already exists; two single-level \d calls
// don't compose into a nested one either), so a two-level
// .euler.problemNNNN split isn't available here.
//====================================================================

loadAllEulerQuestions:{[]
    files:key `:./euler/questions/;
    files:files where files like "problem*.q";
    {[file]
        name:(-2)_string file;
        system "d .",name;
        system "l ./euler/questions/",string file;
        system "d .";
     } each files;
 };

loadAllEulerInputs:{[]
    files:key `:./euler/inputs/;
    {system "l ./euler/inputs/",string x} each files;
 };

loadAllEulerSolutions:{[]
    files:key `:./euler/solutions/;
    {system "l ./euler/solutions/",string x} each files;
 };

initEuler:{[]
    loadAllEulerQuestions[];
    loadAllEulerInputs[];
    loadAllEulerSolutions[];
 };
