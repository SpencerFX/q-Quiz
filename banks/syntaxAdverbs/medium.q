//====================================================================
//
// q-Quiz
//
// Topic      : Syntax Adverbs
// Difficulty : Medium
//
// Syntax-based multiple choice questions.
// Every answer is valid-looking q syntax,
// but only one is correct.
//
//====================================================================
.quiz.syntaxAdverbs.medium:`eachBinary`eachRightScalar`eachLeftScalar`scanRunningTotal`overReduction`priorDifference`eachDictionary`eachNestedList`eachBothMultiply`scanMaximum`overMaximum`priorComparison`functionEach`iteratorSelection`adverbComposition!
    (
    `question`answers`correct!(
        "Which expression applies + element-by-element to two lists?";

        `a`b`c`d!(
            "+'[1 2 3;4 5 6]";
            "+/[1 2 3;4 5 6]";
            "+\\[1 2 3;4 5 6]";
            "+/:1 2 3"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression adds every element of x to scalar y using each-right?";

        `a`b`c`d!(
            "x+y";
            "x+/:y";
            "x+\\:y";
            "+/x y"
        );

        `b
    );

    `question`answers`correct!(
        "Which expression adds scalar x to every element of y using each-left?";

        `a`b`c`d!(
            "x+\\:y";
            "x+/:y";
            "+/x y";
            "+\\x y"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression creates running totals from list x?";

        `a`b`c`d!(
            "+\\x";
            "+/x";
            "+':x";
            "+/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression returns the final sum of all values in x?";

        `a`b`c`d!(
            "+/x";
            "+\\x";
            "+':x";
            "+/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression calculates differences between adjacent elements?";

        `a`b`c`d!(
            "-':x";
            "-/x";
            "-\\x";
            "-/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies a function to every value in dictionary d?";

        `a`b`c`d!(
            "f each d";
            "f/d";
            "f\\d";
            "f/:d"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies a function to every nested list inside x?";

        `a`b`c`d!(
            "f each x";
            "f/x";
            "f\\x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression multiplies corresponding values from two lists?";

        `a`b`c`d!(
            "*'[x;y]";
            "*/[x;y]";
            "*\\[x;y]";
            "*/:x y"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression creates a running maximum?";

        `a`b`c`d!(
            "max\\x";
            "max/x";
            "max'x";
            "max/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression returns the maximum value from a list?";

        `a`b`c`d!(
            "max/x";
            "max\\x";
            "max':x";
            "max/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax compares each value with its previous value?";

        `a`b`c`d!(
            "f':x";
            "f/x";
            "f\\x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression applies each to an anonymous function?";

        `a`b`c`d!(
            "{x*x}'1 2 3";
            "{x*x}/1 2 3";
            "{x*x}\\1 2 3";
            "{x*x}/:1 2 3"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator is used when intermediate accumulated results are required?";

        `a`b`c`d!(
            "Scan";
            "Over";
            "Each";
            "Each-right"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator is used when only the final accumulated result is required?";

        `a`b`c`d!(
            "Over";
            "Scan";
            "Each";
            "Prior"
        );

        `a
    )
 );
//====================================================================