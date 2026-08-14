//====================================================================
// diChallenges — checker
//
// Was previously a copy-paste of qIdioms/solutions/checker.q: it
// built .idiom.ref.dict from the qIdiom topic list (arithmetic,
// finance, ...) and checked problems against that, which has nothing
// to do with diChallenges' actual data. Harmless only because both
// files defined the identically-named globals the same way, so
// loading order never actually changed behaviour - but it never
// looked at .inputs.diChallenges.easy or any .solutions.diChallenges.*
// dict, so every diChallenges problem would have failed
// confirmIdiomCategory (not found among qIdiom topics) or, worse,
// silently graded against the wrong reference data.
//
// diChallenges only has one difficulty tier (.inputs.diChallenges.easy
// is a single flat dict, not split by kind), but solutions ARE split
// by kind (diChallenges/solutions/listOps.q, maths.q, ...), so the
// category lookup here works off kind instead of the
// input-category/difficulty pairing checker.q and qIdioms/checker.q
// use.
//====================================================================

/ Table to store results in memory
resultsDiChallenges: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); category:`$(); difficulty:`$());

diChallengeKinds:`listOps`maths`pathsAndGraphs`permutation`stateMgmt`stringProc;

/ kind symbol -> fully-qualified path to that kind's solutions dict
.di.ref.dict: diChallengeKinds!{` sv `.solutions.diChallenges,x} each diChallengeKinds;

confirmDiChallengeKind:{[problemName]
    mapDict: (key .di.ref.dict)!{x in key value y}[problemName;] each value .di.ref.dict;
    first where mapDict = 1b
 };

/ Function to check for success
checkDi:{[problemName; function]
    st:.z.p;
    kind:confirmDiChallengeKind problemName;
    if[null kind; '"Unknown problem"];
    input: .inputs.diChallenges.easy problemName;
    expected: (value .di.ref.dict kind) problemName;
    actual: .[function;input;{"Error with ",x}];
    $[1 < count actual; actual: `$" " sv string actual; actual: `$string actual];
    $[1 < count expected; expected: `$" " sv string expected; expected: `$string expected];
    pass: actual = expected;
    $[min min pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsDiChallenges; (problemName; min min pass; enlist actual; enlist expected; st; et; kind; `easy)];
    insert[`.quiz.history; (problemName; actual; expected; min min pass; `DiChallenge)];
 };
