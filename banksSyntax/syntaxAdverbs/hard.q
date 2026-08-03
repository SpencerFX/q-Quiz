//====================================================================
//
// q-Quiz
//
// Topic      : Adverbs
// Difficulty : Hard
//
//====================================================================
.quiz.syntaxAdverbs.hard:`nestedEach`iteratorComposition`scanState`overReduction`priorWindow`eachVsVector`functionalEach`eachDictionaryAdvanced`eachNestedStructure`projectionWithAdverb`iteratorPerformance`scanFunction`overFunction`conditionalIteration`vectorIteration`advancedAdverbSelection`rollingCalculation`binaryIterator`nestedIteratorSelection`performanceOptimization!
    (
    `question`answers`correct!(
        "Which expression correctly calculates a running maximum without using maxs?";

        `a`b`c`d!(
            "max\\ x";
            "max/ x";
            "max' x";
            "max/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression returns the cumulative product of a list?";

        `a`b`c`d!(
            "*\\ x";
            "*/ x";
            "*' x";
            "*/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies f repeatedly until convergence?";

        `a`b`c`d!(
            "f\\x";
            "f/x";
            "f'x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator returns the final value after repeatedly applying a function?";

        `a`b`c`d!(
            "over";
            "scan";
            "each";
            "each-left"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator is appropriate when intermediate results are required?";

        `a`b`c`d!(
            "scan";
            "over";
            "each";
            "prior"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression calculates pairwise differences between consecutive elements?";

        `a`b`c`d!(
            "-':x";
            "-/x";
            "-\\x";
            "-/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies a binary function to corresponding elements of two lists?";

        `a`b`c`d!(
            "f'[x;y]";
            "f/[x;y]";
            "f\\[x;y]";
            "f/:x y"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression correctly applies a function to every value in a dictionary?";

        `a`b`c`d!(
            "f each d";
            "f/d";
            "f\\d";
            "f/:d"
        );

        `a
    );

    `question`answers`correct!(
        "Which approach is generally preferred in q when a built-in vector operation exists?";

        `a`b`c`d!(
            "Use the vector operation";
            "Always use each";
            "Convert to a dictionary";
            "Use recursion"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression creates a running sum from list x?";

        `a`b`c`d!(
            "+\\x";
            "+/x";
            "+':x";
            "+/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression reduces nested lists using addition?";

        `a`b`c`d!(
            "+/ each x";
            "+\\ each x";
            "+' each x";
            "+/:each x"
        );

        `a
    );

    `question`answers`correct!(
        "What does the expression: (*/) each x accomplish?";

        `a`b`c`d!(
            "Applies multiplication reduction to each item of x";
            "Creates a running multiplication";
            "Multiplies x by itself";
            "Sorts x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax combines prior values with the current value?";

        `a`b`c`d!(
            "f':x";
            "f/x";
            "f\\x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression would calculate rolling values using previous rows?";

        `a`b`c`d!(
            "f prior x";
            "f/x";
            "f' x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies each-right when a scalar is compared against every element?";

        `a`b`c`d!(
            "x f/: y";
            "x f\\: y";
            "f' x";
            "f/x"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes the difference between each and vector operations?";

        `a`b`c`d!(
            "Vector operations are usually faster because they avoid explicit iteration";
            "Each always runs faster";
            "Each automatically parallelizes";
            "Vector operations only work on tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression creates a cumulative minimum?";

        `a`b`c`d!(
            "mins x";
            "min\\x";
            "min/x";
            "min' x"
        );

        `a
    );

    `question`answers`correct!(
        "A q developer replaces an each loop with a built-in adverb. The main benefit is:";

        `a`b`c`d!(
            "More efficient vectorized execution";
            "Additional namespaces";
            "Automatic IPC";
            "More symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Which pattern is commonly used for stateful calculations across a list?";

        `a`b`c`d!(
            "Scan";
            "Each";
            "Union join";
            "Dictionary lookup"
        );

        `a
    );

    `question`answers`correct!(
        "Which pattern is commonly used to collapse many values into one result?";

        `a`b`c`d!(
            "Over";
            "Scan";
            "Each-right";
            "Each-both"
        );

        `a
    )

 );
//====================================================================