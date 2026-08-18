//====================================================================
// fundamentals — checker
//
// Namespace note: despite the folder being "fundamentals", the
// scaffold's actual dict paths are .inputs.overloads.* / .inputs.qsql.*
// and .solutions.overloads.* / .solutions.qsql.* (no "fundamentals"
// segment) - kept as-is here rather than renamed, to match what the
// pre-existing question-info files already reference.
//
// Unlike every other section, all three difficulty tiers here have
// real (not placeholder) content, so - unlike hackerRank/qIdioms,
// which hide their unfilled medium/hard - fundamentals resolves
// across kind (overloads/qsql) AND difficulty (easy/medium/hard),
// a 2-axis lookup similar to hackerRank's area+difficulty grid.
//
// qsql questions return tables (and, for a couple of exec-based
// aggregates, plain scalars/dicts) - hackerRank/Solutions/checker.q's
// .checker.normalise breaks on tables ("string" on a table can't be
// "sv"-joined), so this defines its own normaliser built on -3!
// (parse-able source-text representation) instead, which round-trips
// atoms, vectors, dicts and tables alike into a comparable symbol.
//====================================================================

resultsFundamentals: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); kind:`$(); difficulty:`$());

fundamentalsKinds:`overloads`qsql;
fundamentalsDifficulties:`easy`medium`hard;

.checker.normaliseFundamentals:{[x] `$-3!x};

/ Resolves a problem name to (kind;difficulty) by checking every
/ kind/difficulty combination's .inputs.<kind>.<difficulty> dict.
/ Returns (`;`) if the name isn't found anywhere.
confirmFundamentalsCategory:{[problemName]
    combos:raze {[k;diffs] {[k;d] k,".",string d}[k;] each diffs}[;fundamentalsDifficulties] each string fundamentalsKinds;
    hasIt:{[problemName;c] problemName in key value `$".inputs.",c}[problemName;] each combos;
    if[not any hasIt; :(`;`)];
    parts:"." vs first combos where hasIt;
    (`$parts 0;`$parts 1)
 };

/ Function to check for success
checkFundamental:{[problemName; function]
    st:.z.p;
    category:confirmFundamentalsCategory problemName;
    kind:category 0;
    difficulty:category 1;
    if[null kind; '"Unknown problem"];
    input:(value `$".inputs.",string[kind],".",string difficulty) problemName;
    expected:(value `$".solutions.",string[kind],".",string difficulty) problemName;
    actual:.[function;input;{"Error with ",x}];
    actualN:.checker.normaliseFundamentals actual;
    expectedN:.checker.normaliseFundamentals expected;
    pass:actualN=expectedN;
    $[pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsFundamentals; (problemName; pass; enlist actualN; enlist expectedN; st; et; kind; difficulty)];
    insert[`.quiz.history; (problemName; actualN; expectedN; pass; `Fundamentals; .web.currentUser)];
 };
