//====================================================================
//
// q-Quiz
//
// Topic      : Overloads
// Difficulty : Medium
//
//====================================================================
.quiz.overloads.medium:`findOverload`randomOverload`takeAttribute`dropVsCut`castParse`fillDictionary`joinTables`applyIndex`applyDepth`amendOperator`enumerateOverload`keyDictionary`takeCycle`findIndices`functionalApply`iteratorPrecedence`attributeApplication`dictionaryCreation`randomDistinct`nestedApply!
    (
    `question`answers`correct!(
        "In the expression 5?100, which overload of ? is being used?";
        `a`b`c`d!(
            "Random selection";
            "Find";
            "Conditional search";
            "Dictionary lookup"
        );
        `a
    );

    `question`answers`correct!(
        "In the expression 3?1 5 3 8, which overload of ? is being used?";
        `a`b`c`d!(
            "Random selection";
            "Find";
            "Take";
            "Group"
        );
        `b
    );

    `question`answers`correct!(
        "Which expression applies the sorted attribute?";
        `a`b`c`d!(
            "`s#x";
            "5#x";
            "#[x;5]";
            "`s$x"
        );
        `a
    );

    `question`answers`correct!(
        "In 5#til 3, which overload of # is used?";
        `a`b`c`d!(
            "Take";
            "Attribute";
            "Count";
            "Enumerate"
        );
        `a
    );

    `question`answers`correct!(
        "What does 2_1 2 3 4 5 return?";
        `a`b`c`d!(
            "3 4 5";
            "1 2";
            "2 3 4";
            "1 2 3"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of $ is used in `int$3.8?";
        `a`b`c`d!(
            "Type cast";
            "Enumeration";
            "Formatting";
            "Dictionary creation"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ^ is used in 0^1 0N 3?";
        `a`b`c`d!(
            "Fill";
            "Power";
            "Join";
            "Group"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator applies a function to a specific index of a list?";
        `a`b`c`d!(
            "@";
            ".";
            "?";
            "#"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator applies a function through multiple levels of indexing?";
        `a`b`c`d!(
            ".";
            "@";
            "?";
            ","
        );
        `a
    );

    `question`answers`correct!(
        "What is @ commonly used for besides function application?";
        `a`b`c`d!(
            "Amending values";
            "Sorting";
            "Casting";
            "Grouping"
        );
        `a
    );

    `question`answers`correct!(
        "In `sym$`IBM`MSFT, which overload of $ is used?";
        `a`b`c`d!(
            "Type cast";
            "Find";
            "Take";
            "Drop"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ! is used in `a`b!1 2?";
        `a`b`c`d!(
            "Dictionary creation";
            "Enumeration";
            "Key lookup";
            "Grouping"
        );
        `a
    );

    `question`answers`correct!(
        "What is the result of 7#1 2 3?";
        `a`b`c`d!(
            "1 2 3 1 2 3 1";
            "1 2 3";
            "7#0";
            "1 2 3 0 0 0 0"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ? returns indices of matching values?";
        `a`b`c`d!(
            "Find";
            "Random";
            "Group";
            "Take"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression applies function f to x using functional form?";
        `a`b`c`d!(
            "@[f;x]";
            ".[f;x]";
            "?[f;x]";
            "#[f;x]"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression first applies the each iterator before the overload?";
        `a`b`c`d!(
            "f' x";
            "f/x";
            "f\\x";
            "f@:x"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of # is used in `u#x?";
        `a`b`c`d!(
            "Attribute";
            "Take";
            "Find";
            "Drop"
        );
        `a
    );

    `question`answers`correct!(
        "Which overload of ! creates a keyed mapping?";
        `a`b`c`d!(
            "`a`b!10 20";
            "`a!10";
            "10!20";
            "!`a`b"
        );
        `a
    );

    `question`answers`correct!(
        "Which expression returns five distinct random integers from 0 to 99?";
        `a`b`c`d!(
            "5?100";
            "100?5";
            "?[5;100]";
            "100#5"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator is designed for nested indexing and amendment?";
        `a`b`c`d!(
            ".";
            "@";
            "#";
            "?"
        );
        `a
    )
 );
//====================================================================