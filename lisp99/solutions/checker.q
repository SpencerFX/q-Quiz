//====================================================================
// lisp99 — checker
//
// Flat, single-tier-per-problem like euler/solutions/checker.q (one
// results table, no per-problem "kind" split the way fundamentals has
// across its many sub-topics) - but with a real easy/medium/hard
// difficulty split, since these problems genuinely vary in difficulty
// rather than euler's single "easy" bucket.
//
// .checker.normaliseLisp99 mirrors fundamentals/solutions/checker.q's
// own normaliser exactly (-3! round-trips atoms, vectors, dicts and
// nested lists alike into a comparable symbol) - kept as its own copy
// rather than a shared one, so this section's grading logic doesn't
// depend on fundamentals/ being loaded.
//====================================================================

resultsLisp99: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); difficulty:`$());

lisp99Difficulties:`easy`medium`hard;

.checker.normaliseLisp99:{[x] `$-3!x};

/ Resolves a problem name to its difficulty by checking each
/ .inputs.lisp99.<difficulty> dict. Returns ` if the name isn't found.
confirmLisp99Difficulty:{[problemName]
    hasIt:{[problemName;d] problemName in key value `$".inputs.lisp99.",string d}[problemName;] each lisp99Difficulties;
    if[not any hasIt; :`];
    first lisp99Difficulties where hasIt
 };
