//====================================================================
// quantRank — checker
//
// Was previously a stray copy of hackerRank/Solutions/checker.q: it
// defined resultsQuantRank but then inserted into resultsHackerRank
// via .checker.ref.dict entries for algorithms/dataStructures -
// nothing to do with quantRank's actual data
// (.inputs.quant.probability.*). Replaced with a real checker.
//
// All 5 problems currently live under .inputs.quant.probability.*
// (easy/medium/hard) regardless of which questions/ kind-subfolder
// (probability/, recursion/) they're physically filed in - the
// subfolder is just storage organisation, not reflected in the data
// namespace - so difficulty is the only axis that actually varies
// here (unlike hackerRank's area+difficulty grid).
//
// Reuses .checker.normalise (defined in hackerRank/Solutions/
// checker.q, loaded before quantRank during .quiz.init[]) so
// equality is judged the same way across every section.
//====================================================================

resultsQuantRank: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); category:`$(); difficulty:`$());

quantRankDifficulties:`easy`medium`hard;

confirmQuantRankDifficulty:{[problemName]
    hasIt:{[problemName;d] problemName in key value `$".inputs.quant.probability.",string d}[problemName;] each quantRankDifficulties;
    first quantRankDifficulties where hasIt
 };

/ Function to check for success
checkQuant:{[problemName; function]
    st:.z.p;
    difficulty:confirmQuantRankDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    input:(value `$".inputs.quant.probability.",string difficulty) problemName;
    expected:(value `$".solutions.quant.probability.",string difficulty) problemName;
    actual:.[function;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    $[pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsQuantRank; (problemName; pass; enlist actualN; enlist expectedN; st; et; `probability; difficulty)];
    insert[`.quiz.history; (problemName; actualN; expectedN; pass; `QuantRank; .web.currentUser)];
 };

/ checkQuant[`noWomenAtTableA; probNoWomen]
/ checkQuant[`twoDrawers; drawerProbability]
/ checkQuant[`twoChildren; probTwoBoys]
/ checkQuant[`game7; probGame7]
/ checkQuant[`amoebaExtinction; extinctionProbability]
