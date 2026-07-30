//====================================================================
//
// q-Quiz
//
// Topic      : Overloads
// Difficulty : Hard
//
//====================================================================
.quiz.overloads.hard:`takeVsAttribute`findVsRandom`castVsEnumerate`amendApply`nestedApply`fillBehavior`dropBehavior`joinBehavior`functionalApply`projectionApply`attributePrecedence`iteratorOverload`dictionaryOverload`findIndex`randomDistinct`nestedAmend`overloadSelection`parserPrecedence`mixedOverloads`productionCode!
    (
    `question`answers`correct!(
        "In the expression `s#100?1000, which overloads are used?";
        `a`b`c`d!(
            "# = attribute, ? = random";
            "# = take, ? = find";
            "# = attribute, ? = find";
            "# = take, ? = random"
        );
        `a
    );

    `question`answers`correct!(
        "In the expression 5?til 20, which overload of ? is used?";
        `a`b`c`d!(
            "Find";
            "Random";
            "Group";
            "Dictionary lookup"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression uses the amend overload of @?";
        `a`b`c`d!(
            "@[x;2;:;99]";
            "@[f;x]";
            "@[x]";
            "@[2]"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator supports nested amendment of deeply nested structures?";
        `a`b`c`d!(
            ".";
            "@";
            "#";
            "?"
        );
        `a
    );

    `question`answers`correct!(
        "In `sym$til 5, which overload of $ is being used?";
        `a`b`c`d!(
            "Type cast";
            "Enumeration";
            "Formatting";
            "Parsing"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ^ is used in 0^0N 2 3?";
        `a`b`c`d!(
            "Fill";
            "Power";
            "Group";
            "Join"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression demonstrates the drop overload of _?";
        `a`b`c`d!(
            "3_til 10";
            "_3 til 10";
            "til 10_3";
            "3#til 10"
        );
        `a
    );

    `question`answers`correct!(
        "Which overloaded operator is responsible for concatenating two simple lists?";
        `a`b`c`d!(
            ",";
            "#";
            "@";
            "^"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression applies a projected function?";
        `a`b`c`d!(
            "f[2;] 5";
            "@[f;2;5]";
            ".[f;2;5]";
            "f each 2 5"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression demonstrates the function-application overload of @?";
        `a`b`c`d!(
            "@[sum;1 2 3]";
            "@[1 2 3;0;:;5]";
            ".[sum;1 2 3]";
            "?[sum;1 2 3]"
        );
        `a
    );

    `question`answers`correct!(
        "Parser precedence determines whether # performs take or attribute based on:";
        `a`b`c`d!(
            "The type of the left argument";
            "The length of the list";
            "The number of columns";
            "The namespace"
        );
        `a
    );

    `question`answers`correct!(
        "Which iterator is itself an overload of an existing symbol?";
        `a`b`c`d!(
            "'";
            ":";
            ",";
            "$"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ! creates a dictionary?";
        `a`b`c`d!(
            "`a`b!10 20";
            "!`a`b";
            "10!20";
            "`a!10"
        );
        `a
    );

    `question`answers`correct!(
        "When evaluating x?y, which factor determines whether ? means find or random?";
        `a`b`c`d!(
            "The type of x";
            "The length of y";
            "The value of y";
            "The current namespace"
        );
        `a
    );

    `question`answers`correct!(
        "Why does 5?100 always return distinct values?";
        `a`b`c`d!(
            "Because that's the semantics of the random overload";
            "Because q sorts the output";
            "Because the take overload is used";
            "Because of the unique attribute"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator is preferred for nested amendment in production code?";
        `a`b`c`d!(
            ".";
            "@";
            "#";
            "!"
        );
        `a
    );

    `question`answers`correct!(
        "Most overloaded operators in q dispatch based primarily on:";
        `a`b`c`d!(
            "Argument types";
            "Variable names";
            "Whitespace";
            "Namespace"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement best describes overload resolution in q?";
        `a`b`c`d!(
            "It is determined at runtime from the supplied arguments";
            "It is determined during compilation";
            "It depends on the operating system";
            "It depends on the process ID"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression contains both a random overload and an attribute overload?";
        `a`b`c`d!(
            "`u#10?100";
            "10#100";
            "100?10";
            "`u$100"
        );
        `a
    );

    `question`answers`correct!(
        "Why are overloaded operators heavily used throughout idiomatic q code?";
        `a`b`c`d!(
            "They provide concise, type-driven behavior while remaining highly expressive";
            "They eliminate the need for functions";
            "They execute in parallel automatically";
            "They only work on tables"
        );
        `a
    )
 );
//====================================================================