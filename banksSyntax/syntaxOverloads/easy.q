//====================================================================
//
// q-Quiz
//
// Topic      : Overloaded Glyphs — Syntax Focus
// Source     : "Overloaded glyphs" (code.kx.com/q/ref/overloads)
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxOverloads.easy:`atIndexAt`bangDict`bangEnkey`colonAssign`colonExplicitReturn`colonColonView`dashNegate`dollarCond`hashTake`queryFind`quoteEach`quoteColonEachParallel`slashDo`underscoreCut!
    (
    `question`answers`correct!(
        "What does l@i mean, using the @ (at) glyph at rank 2?";

        `a`b`c`d!(
            "Index At: index into l at position(s) i";
            "Apply At: apply l as a function to argument i";
            "Amend At: replace the value at index i in l";
            "Trap At: catch any error raised while evaluating l with argument i"
        );

        `a
    );

    `question`answers`correct!(
        "What does x!y mean, using the ! (bang) glyph at rank 2 with two same-length lists?";

        `a`b`c`d!(
            "Dict: makes a dictionary mapping x (keys) to y (values)";
            "Enkey: makes table y keyed by columns x";
            "Unkey: strips the key from table y";
            "Amend: replaces values at positions x in y"
        );

        `a
    );

    `question`answers`correct!(
        "What does i!ts mean, using ! at rank 2 where i is an integer greater than 0 and ts is a simple table?";

        `a`b`c`d!(
            "Enkey: makes ts a keyed table, using the first i columns as the key";
            "Dict: makes a dictionary from i and ts";
            "Unkey: removes the first i key columns from ts";
            "Amend At: updates row i of ts"
        );

        `a
    );

    `question`answers`correct!(
        "What does the difference between a:42 and :42 hinge on, using the : (colon) glyph?";

        `a`b`c`d!(
            "a:42 assigns the value 42 to the name a, while :42 is an explicit return of 42 from within a function";
            "Both are identical; :42 is just shorthand for assigning to the most recent name";
            "a:42 is an explicit return, while :42 is an assignment to a";
            ":42 only works at the top level of a script, never inside a function"
        );

        `a
    );

    `question`answers`correct!(
        "Inside a function body, what does a bare :42 on its own line do, distinct from an ordinary assignment like a:42?";

        `a`b`c`d!(
            "It immediately returns the value 42 as the function's result, short-circuiting any remaining lines in the body";
            "It assigns 42 to a variable named by the colon itself, identical in effect to a:42";
            "It has no special effect and is simply discarded, like an unused expression";
            "It signals a syntax error, since a return requires an explicit function keyword"
        );

        `a
    );

    `question`answers`correct!(
        "What does v::select from t where a in b do, using :: (colon colon)?";

        `a`b`c`d!(
            "Defines v as a view — a query that is (re-)evaluated automatically when its dependencies change";
            "Performs a one-time assignment of the current query result to v, identical to a plain :";
            "Declares v as a global variable local to the current function only";
            "Deletes v if it already exists, then leaves it undefined"
        );

        `a
    );

    `question`answers`correct!(
        "What does the - (dash) glyph mean when placed immediately to the left of a number, as in -3?";

        `a`b`c`d!(
            "It indicates the number is negative, equivalent to neg[3]";
            "It performs subtraction against an implicit left operand of 0, functionally identical but conceptually different from negation";
            "It signals an error unless the number is inside a function body";
            "It casts the number to a signed integer type explicitly"
        );

        `a
    );

    `question`answers`correct!(
        "What does $[x>10;y;z] do, using $ (dollar) at rank 3?";

        `a`b`c`d!(
            "Cond: conditionally evaluates and returns y if x>10 is true, otherwise z";
            "Cast: casts z to the datatype indicated by x>10";
            "Tok: interprets the string z as data of type indicated by x>10";
            "Pad: pads z to a length determined by x>10"
        );

        `a
    );

    `question`answers`correct!(
        "What does 2 3#til 6 do, using # (hash) at rank 2 with a list left-argument?";

        `a`b`c`d!(
            "Take: reshapes til 6 into a 2-row by 3-column matrix";
            "Set Attribute: applies a compound attribute described by 2 3 to til 6";
            "Cut: splits til 6 into chunks of size 2 and 3";
            "Enumerate: enumerates til 6 against a 2x3 domain"
        );

        `a
    );

    `question`answers`correct!(
        "What does \"abcdef\"?\"cab\" do, using ? (query) at rank 2?";

        `a`b`c`d!(
            "Find: returns the position of each character of \"cab\" within \"abcdef\"";
            "Roll: returns 3 random characters chosen from \"abcdef\"";
            "Deal: returns 3 distinct random characters chosen from \"abcdef\"";
            "Enum Extend: extends the domain \"abcdef\" with any new characters from \"cab\""
        );

        `a
    );

    `question`answers`correct!(
        "What does (u')x do, using the ' (quote) glyph at rank 1 with a unary value u?";

        `a`b`c`d!(
            "Each: applies u itemwise to each element of x";
            "Signal an error using the message x";
            "Case: selects successive items from a list based on x";
            "Compose: composes u with x as if x were also a function"
        );

        `a
    );

    `question`answers`correct!(
        "What does u': mean, using ': (quote-colon) with a unary value u?";

        `a`b`c`d!(
            "Each Parallel: applies u to each item, potentially across multiple threads/processes in parallel";
            "Each Prior: applies u between each item and the one before it";
            "Compose: composes u with itself repeatedly";
            "Converge: repeatedly applies u until the result stops changing"
        );

        `a
    );

    `question`answers`correct!(
        "What does n u/y do, using / (slash) at rank 1 where n is a non-negative int atom?";

        `a`b`c`d!(
            "Do: applies u to y repeatedly, exactly n times";
            "While: applies u to y repeatedly as long as n evaluates truthy";
            "map-reduce: reduces the list y using n as the seed value";
            "Converge: applies u to y until n consecutive results are identical"
        );

        `a
    );

    `question`answers`correct!(
        "What does 3_ til 10 do, using the _ (underscore) glyph at rank 2?";

        `a`b`c`d!(
            "Cut/Drop: drops the first 3 items of til 10, since the left argument here is a plain count";
            "Cuts til 10 into 3 equal-sized sublists";
            "Removes every 3rd item from til 10";
            "Signals a 'length error, since underscore requires a list left-argument"
        );

        `a
    )
 );