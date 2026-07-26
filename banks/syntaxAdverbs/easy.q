//====================================================================
//
// q-Quiz
//
// Topic      : Adverbs
// Difficulty : Syntax
//
// Syntax-based multiple choice questions. Every answer is valid-looking
// q syntax, but only one is correct.
//
//====================================================================
.quiz.syntaxAdverbs.easy:`each`eachRight`eachLeft`scan`over`eachPrior`eachBoth`eachBothAdd`priorMax`converge`eachRightAdd`eachLeftAdd`anonymousEach`scanMultiply`overMultiply!
    (
    `question`answers`correct!(
        "Which correctly applies each to function f over list x?";

        `a`b`c`d!(
            "f each x";
            "each[f;x]";
            "f[x] each";
            "each f(x)"
        );

        `a
    );

    `question`answers`correct!(
        "Which correctly applies each-right using constant y?";

        `a`b`c`d!(
            "x/:y";
            "x\\:y";
            "x/: y";
            "x':y"
        );

        `c
    );

    `question`answers`correct!(
        "Which correctly applies each-left?";

        `a`b`c`d!(
            "x\\:y";
            "x/:y";
            "x':y";
            "x/: y"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies scan (+\\)?";

        `a`b`c`d!(
            "+\\ x";
            "+/ x";
            "+':x";
            "+/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies over (+/)?";

        `a`b`c`d!(
            "+/ x";
            "+\\ x";
            "+':x";
            "+/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies each-prior?";

        `a`b`c`d!(
            "-':x";
            "-/:x";
            "-\\x";
            "-' x"
        );

        `a
    );

    `question`answers`correct!(
        "Which correctly applies f to corresponding elements of x and y?";

        `a`b`c`d!(
            "f'[x;y]";
            "f each[x;y]";
            "f/:x y";
            "f\\:x y"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax performs each-both addition?";

        `a`b`c`d!(
            "+'[x;y]";
            "+/:x";
            "+\\x";
            "+/x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax applies prior using max?";

        `a`b`c`d!(
            "max':x";
            "max/x";
            "max\\x";
            "max/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax repeatedly applies f until convergence?";

        `a`b`c`d!(
            "f/:x";
            "f\\x";
            "f'x";
            "f/x"
        );

        `b
    );

    `question`answers`correct!(
        "Which syntax uses each-right with +?";

        `a`b`c`d!(
            "+/:x";
            "+\\x";
            "+':x";
            "+/x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax uses each-left with +?";

        `a`b`c`d!(
            "+\\:x";
            "+/:x";
            "+\\x";
            "+':x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs each using an anonymous function?";

        `a`b`c`d!(
            "{x*x}' til 5";
            "{x*x}/ til 5";
            "{x*x}\\ til 5";
            "{x*x}/: til 5"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs scan using multiplication?";

        `a`b`c`d!(
            "*\\x";
            "*/x";
            "*':x";
            "*/:x"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs over using multiplication?";

        `a`b`c`d!(
            "*/x";
            "*\\x";
            "*':x";
            "*\\:x"
        );

        `a
    )
 );
//====================================================================