//====================================================================
//
// q-Quiz
//
// Topic      : Syntax
// Difficulty : Medium
//
//====================================================================
.quiz.syntax.medium:`lambdaSyntax`functionArguments`projection`anonymousFunction`eachBoth`eachLeft`eachRight`over`scan`prior`parse`value`functionalSelect`functionalExec`namespace`apply`dictionaryLookup`flip`keyedTable`amend!
    (
    `question`answers`correct!(
        "How are anonymous functions defined in q?";
        `a`b`c`d!(
            "{x+y}";
            "function(x+y)";
            "lambda(x+y)";
            "fn{x+y}"
        );
        `a
    );

    `question`answers`correct!(
        "How are explicit function arguments declared?";
        `a`b`c`d!(
            "{[x;y] x+y}";
            "{x;y:x+y}";
            "function[x;y]";
            "{x,y}"
        );
        `a
    );

    `question`answers`correct!(
        "What is produced by partially applying a function?";
        `a`b`c`d!(
            "A projection";
            "A dictionary";
            "A table";
            "An iterator"
        );
        `a
    );

    `question`answers`correct!(
        "What is another name for an anonymous function?";
        `a`b`c`d!(
            "Lambda";
            "Namespace";
            "Projection";
            "Dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "What does each-both (') apply a function over?";
        `a`b`c`d!(
            "Corresponding elements of two lists";
            "Only the left list";
            "Only the right list";
            "Every table column"
        );
        `a
    );

    `question`answers`correct!(
        "What does each-left (\\:) do?";
        `a`b`c`d!(
            "Applies each item of the left argument against the entire right argument";
            "Applies each item of the right argument";
            "Performs a scan";
            "Performs a fold"
        );
        `a
    );

    `question`answers`correct!(
        "What does each-right (/:) do?";
        `a`b`c`d!(
            "Applies each item of the right argument against the entire left argument";
            "Applies each item of the left argument";
            "Performs a fold";
            "Creates a dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "What is the purpose of over (/)?";
        `a`b`c`d!(
            "Reduce a list to a single result";
            "Create a table";
            "Join two tables";
            "Enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What does scan (\\) return?";
        `a`b`c`d!(
            "Intermediate reductions";
            "Only the final reduction";
            "A dictionary";
            "A projection"
        );
        `a
    );

    `question`answers`correct!(
        "What does prior return?";
        `a`b`c`d!(
            "The previous item in a list";
            "The next item";
            "The first item";
            "The last item"
        );
        `a
    );

    `question`answers`correct!(
        "What does parse return?";
        `a`b`c`d!(
            "A parse tree";
            "The query result";
            "Compiled code";
            "A table"
        );
        `a
    );

    `question`answers`correct!(
        "What does value do when applied to a parsed expression?";
        `a`b`c`d!(
            "Evaluates it";
            "Sorts it";
            "Compiles it";
            "Compresses it"
        );
        `a
    );

    `question`answers`correct!(
        "Why is functional select useful?";
        `a`b`c`d!(
            "Queries can be built dynamically";
            "It is always faster";
            "It avoids parsing";
            "It only works on HDBs"
        );
        `a
    );

    `question`answers`correct!(
        "What does functional exec return?";
        `a`b`c`d!(
            "Lists or atoms rather than tables";
            "A keyed table";
            "A dictionary";
            "A parse tree"
        );
        `a
    );

    `question`answers`correct!(
        "Namespaces are primarily used to:";
        `a`b`c`d!(
            "Organise code and avoid name collisions";
            "Speed up joins";
            "Compress symbols";
            "Partition databases"
        );
        `a
    );

    `question`answers`correct!(
        "What does the apply operator (.) do?";
        `a`b`c`d!(
            "Calls a function using a list of arguments";
            "Creates a projection";
            "Builds a dictionary";
            "Performs an update"
        );
        `a
    );

    `question`answers`correct!(
        "Looking up a value in a dictionary uses:";
        `a`b`c`d!(
            "The key";
            "The row number";
            "The column index";
            "The value"
        );
        `a
    );

    `question`answers`correct!(
        "What does flip convert?";
        `a`b`c`d!(
            "A dictionary of equal-length lists into a table";
            "A table into a dictionary";
            "A symbol into a string";
            "A list into an atom"
        );
        `a
    );

    `question`answers`correct!(
        "Internally, a keyed table is represented as:";
        `a`b`c`d!(
            "A dictionary of two tables";
            "A list";
            "A symbol vector";
            "A parse tree"
        );
        `a
    );

    `question`answers`correct!(
        "What is amend primarily used for?";
        `a`b`c`d!(
            "Updating values within a data structure";
            "Sorting tables";
            "Joining tables";
            "Enumerating symbols"
        );
        `a
    )
 );
//====================================================================