//====================================================================
// fundamentals — control flow inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds
// - though unlike most of them, nothing here needs a shared fixture
// table or namespace, since do/while/if/$/? all operate on plain
// values and each question's own local loop variables.
//
// Distinct from fundamentals/inputs/adverbs.q: that kind covered the
// ADVERB forms of iteration (over/scan and their converge and
// conditional-"while" variants, e.g. ({x*2}/)[{x<100};1]) - this kind
// covers the separate STATEMENT forms do[n;...], while[c;...] and
// if[c;...], plus the two conditional VALUE functions $[c;t;f]
// (scalar, any number of branches) and ?[c;t;f] (vector, elementwise).
//
// Every expression here was verified against a live q process before
// being written down, same as always - this section turned up no
// surprises at all, unlike several of the others.
//====================================================================

.inputs.controlFlow.easy:
    `doLoop`whileLoop`ifStatement`ternaryCond!(
        (enlist 5);
        (enlist 5);
        (enlist 5);
        (enlist 5)
    );

.inputs.controlFlow.medium:
    `caseMultiBranch`vectorConditional`doLoopBuildList`whileLoopBuildList!(
        (enlist -3);
        (enlist 3 -2 5 -1);
        (enlist 5);
        (enlist 5)
    );

.inputs.controlFlow.hard:
    `nestedVectorConditional`nestedIfWhileSearch`doVsWhileEquivalence!(
        (enlist 0 3 -2 0 5);
        (10 20 30 40; 30);
        (enlist 7)
    );
