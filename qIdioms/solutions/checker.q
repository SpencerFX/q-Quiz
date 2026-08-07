/ Table to store results in memory
resultsIdioms: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); category:`$(); difficulty:`$());

/ Function to check for success
checkIdiom:{[problemName; function]
    st:.z.p;
    category:confirmCategory problemName;
    difficulty:`$("." vs string category)3;
    cat:`$("." vs string category)2;
    input:(value category) problemName;
    expected: (value .checker.ref.dict category) problemName;
    actual: function . input;
    pass: actual = expected;
    $[min min pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsIdioms; (problemName; min min pass; enlist actual; enlist expected; st; et; cat;difficulty)];
 };

.checker.ref.dict: (!) . flip raze 2 cut
    (
        (`.inputs.algorithms.easy; `.solutions.algorithms.easy);
        (`.inputs.algorithms.medium; `.solutions.algorithms.medium);
        (`.inputs.algorithms.hard; `.solutions.algorithms.hard);
        (`.inputs.dataStructures.easy; `.solutions.dataStructures.easy);
        (`.inputs.dataStructures.medium; `.solutions.dataStructures.medium);
        (`.inputs.dataStructures.hard; `.solutions.dataStructures.hard)
    );

confirmCategory:{[problemName]
    mapDict: (key .checker.ref.dict)!{x in key value y}[problemName;]each key .checker.ref.dict;
    inputTopCheck: first where mapDict = 1b
 };