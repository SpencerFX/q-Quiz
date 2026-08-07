/ Table to store results in memory
resultsIdioms: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); category:`$(); difficulty:`$());

/ Function to check for success
checkIdiom:{[problemName; function]
    st:.z.p;
    category:confirmCategory problemName;
    difficulty:`$("." vs string category)3;
    cat:`$("." vs string category)2;
    input:(value category) problemName;
    expected: (value .idiom.ref.dict category) problemName;
    actual: function . input;
    pass: actual = expected;
    $[min min pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsIdioms; (problemName; min min pass; enlist actual; enlist expected; st; et; cat;difficulty)];
    insert[`.quiz.history; (problemName; `$" " sv string actual; `$" " sv string actual; min min pass;`Idioms)];
 };

topics:`arithmetic`castingAndRepresentation`execution`finance`find`flags`format`geometry`indexes`math`matrixes`miscellaneous`partsItems`polynomials`rank`shape`sort`statistics`strings`temporal`tests`text;

.idiom.ref.dict: {[]
    easy:({` sv `.inputs,x,`easy}each topics)!{` sv `.solutions,x,`easy}each topics;
    medium:({` sv `.inputs,x,`medium}each topics)!{` sv `.solutions,x,`medium}each topics;
    hard:({` sv `.inputs,x,`hard}each topics)!{` sv `.solutions,x,`hard}each topics;
    easy,medium,hard
 }[];

confirmCategory:{[problemName]
    mapDict: (key .idiom.ref.dict)!{x in key value y}[problemName;]each key .idiom.ref.dict;
    inputTopCheck: first where mapDict = 1b
 };