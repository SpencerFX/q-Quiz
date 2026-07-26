//====================================================================
//
// q-Quiz
//
// Topic      : Adverbs
// Difficulty : Medium
//
//====================================================================
.quiz.syntaxAdverbs.medium:`eachApplication`eachRightApplication`eachLeftApplication`eachBothApplication`scanBehavior`overBehavior`priorBehavior`eachPriorUsage`iteratorComposition`projectionAdverb`eachDictionary`eachNestedList`scanAggregation`overAggregation`adverbFunctionResult`iteratorSelection!
    (
    `question`answers`correct!(
        "What is the result of applying each to a unary function?";

        `a`b`c`d!(
            "The function is applied to every item";
            "The function is applied only once";
            "The function reverses the list";
            "The function creates a dictionary"
        );

        `a
    );

    `question`answers`correct!(
        "What does +/ do in q?";

        `a`b`c`d!(
            "Reduces a list using addition";
            "Applies addition between adjacent values";
            "Creates a dictionary";
            "Sorts a list"
        );

        `a
    );

    `question`answers`correct!(
        "What does +\\ do in q?";

        `a`b`c`d!(
            "Creates running totals";
            "Creates a final sum only";
            "Applies addition from right to left";
            "Creates projections"
        );

        `a
    );

    `question`answers`correct!(
        "What is the result of: +\\ 1 2 3 4";

        `a`b`c`d!(
            "1 3 6 10";
            "10";
            "4 3 2 1";
            "1 2 3 4"
        );

        `a
    );

    `question`answers`correct!(
        "What is the result of: +/ 1 2 3 4";

        `a`b`c`d!(
            "10";
            "1 3 6 10";
            "4";
            "1 2 3 4"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies function f to each element of x?";

        `a`b`c`d!(
            "f' x";
            "f/x";
            "f\\x";
            "f/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies f with each-right behavior?";

        `a`b`c`d!(
            "x f/: y";
            "x f\\: y";
            "f' x";
            "f/x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies f with each-left behavior?";

        `a`b`c`d!(
            "x f\\: y";
            "x f/: y";
            "f' x";
            "f\\x"
        );

        `a
    );

    `question`answers`correct!(
        "What does each-both apply?";

        `a`b`c`d!(
            "A binary function element-by-element across two lists";
            "A function to only the first element";
            "A reduction operation";
            "A sorting operation"
        );

        `a
    );

    `question`answers`correct!(
        "What does prior provide when used with a function?";

        `a`b`c`d!(
            "The previous item as an additional argument";
            "The next item as an argument";
            "The entire list as one argument";
            "A dictionary key"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression calculates differences between adjacent values?";

        `a`b`c`d!(
            "-':1 4 9 16";
            "-/1 4 9 16";
            "-\\1 4 9 16";
            "-/:1 4 9 16"
        );

        `a
    );

    `question`answers`correct!(
        "What does each over a dictionary apply to?";

        `a`b`c`d!(
            "Each value";
            "Only the keys";
            "The dictionary type";
            "Only symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression calculates a running maximum?";

        `a`b`c`d!(
            "maxs x";
            "max/x";
            "max' x";
            "max/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator returns a final accumulated result?";

        `a`b`c`d!(
            "Over";
            "Scan";
            "Each";
            "Each-right"
        );

        `a
    );

    `question`answers`correct!(
        "Which iterator returns intermediate accumulated results?";

        `a`b`c`d!(
            "Scan";
            "Over";
            "Each";
            "Each-left"
        );

        `a
    );

    `question`answers`correct!(
        "What is the result of: {x*x} each 1 2 3";

        `a`b`c`d!(
            "1 4 9";
            "36";
            "1 2 3";
            "2 4 6"
        );

        `a
    )
 );
//====================================================================