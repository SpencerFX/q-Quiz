//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxOverloads.medium:`atRankLadder`bangRankLadder`dotRankLadder`dollarFormsCompare`hashTwoForms`queryRandomForms`quoteVsQuoteColon`slashCommentVsReduce`bangUpdateDelete`dollarEnumerateForm`underscoreVsSpace!
    (
    `question`answers`correct!(
        "Walking up the rank ladder for @, what distinguishes @[f;y] (rank 2), @[f;y;e] (rank 3), and @[d;i;u] (rank 3)?";

        `a`b`c`d!(
            "@[f;y] is a plain Apply At; @[f;y;e] is Trap At, catching an error from f y and calling e on failure; @[d;i;u] is Amend At, using function u to update d at index i, distinguished from Trap At by argument types (d/i vs f/y/e)";
            "All three are the same operation (Apply At), just with extra optional logging arguments";
            "@[f;y;e] and @[d;i;u] are both Trap At; only the argument names differ";
            "Rank alone fully determines behavior — any rank-3 call to @ is always Trap At regardless of argument types"
        );

        `a
    );

    `question`answers`correct!(
        "How does the rank-4 form @[d;i;m;my] (Amend At) differ from @[d;i;:;y] (Replace At), also rank 4?";

        `a`b`c`d!(
            "@[d;i;m;my] applies function m together with argument my to update the value(s) at index i in d; @[d;i;:;y] instead directly replaces the value(s) at index i with y (using : as the 'function'), performing a pure overwrite rather than a computed update";
            "@[d;i;m;my] only works on dictionaries, while @[d;i;:;y] only works on tables";
            "They are fully interchangeable; : is just an alias for any binary function m";
            "@[d;i;:;y] is a syntax error; only @[d;i;m;my] is valid at rank 4"
        );

        `a
    );

    `question`answers`correct!(
        "What is the practical difference between .[d;i;u] (rank 3, Amend) and .[d;i;:;y] (rank 4, Replace)?";

        `a`b`c`d!(
            ".[d;i;u] updates the value(s) at i by applying unary function u to the current value; .[d;i;:;y] instead replaces the value(s) at i outright with y, ignoring what was there before";
            "Both perform an identical replace; the extra colon in the second form is purely cosmetic";
            ".[d;i;u] is for dictionaries only, while .[d;i;:;y] is for tables only";
            ".[d;i;u] requires i to be an integer, while .[d;i;:;y] requires i to be a symbol"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing the four rank-2 forms of $ — \"h\"$y, `short$y, \"H\"$y and x$y — which two are 'Cast' and which one is 'Tok', and what does 'Enumerate' need instead?";

        `a`b`c`d!(
            "\"h\"$y and `short$y are Cast (convert y's datatype using a type code/name); \"H\"$y is Tok (interpret a string as data of that type); Enumerate (x$y) instead needs x to be a keyed table/domain rather than a type indicator";
            "\"h\"$y and \"H\"$y are both Cast, while `short$y is Tok and x$y is Pad";
            "All four forms are Cast; Tok and Enumerate don't exist as separate $ overloads";
            "\"H\"$y is Cast and \"h\"$y is Tok — the reverse of the actual behavior"
        );

        `a
    );

    `question`answers`correct!(
        "Both 2 3#til 6 and s#1 2 3 use # at rank 2 — what distinguishes 'Take' from 'Set Attribute' here?";

        `a`b`c`d!(
            "When the left argument is numeric (like 2 3), # performs Take/reshape; when the left argument is a symbol naming an attribute (like s for sorted), # instead applies that attribute to the right argument";
            "Take always requires a symbol left argument, while Set Attribute always requires numeric";
            "They are the same operation; 's' is simply treated as the number 0 by q";
            "Take only works on lists of length 6, while Set Attribute works on any length"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing 10?1000, -10?1000, and 0N?1000 (all rank 2 uses of ?), what does the sign/nullness of the left argument determine?";

        `a`b`c`d!(
            "A positive left argument (10) performs Roll (random picks WITH repetition); a negative left argument (-10) performs Deal (random picks WITHOUT repetition, i.e. distinct); a null left argument (0N) performs Permute (a full random shuffle)";
            "All three are identical, just different syntactic sugar for the same random-sampling operation";
            "10?1000 is Deal, -10?1000 is Roll, and 0N?1000 is Find — the sign meanings are reversed from the actual behavior";
            "The sign only affects performance, not the sampling semantics, which are identical in all three cases"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference in what (u')x and 'msg do with the ' (quote) glyph, despite both being rank 1?";

        `a`b`c`d!(
            "(u')x applies the unary value u itemwise across x (Each), while 'msg — where msg is a symbol or string, not a function-and-data pair — instead signals an error using msg as the error text";
            "Both perform Each; the difference is only whether the left value is a function or a plain symbol, with no change in overall behavior";
            "(u')x signals an error if u fails, while 'msg always applies Each regardless of its argument type";
            "'msg is deprecated syntax for (u')x and should not be used"
        );

        `a
    );

    `question`answers`correct!(
        "What is the difference between a trailing / comment (e.g. 2+2 / we know this one) and a solitary / on its own line within a script?";

        `a`b`c`d!(
            "A trailing / (preceded by a space) comments out only the rest of that line; a solitary / on its own line begins a MULTILINE comment block that continues until a lone \\ or the end of the script";
            "Both behave identically, commenting out only the single line they appear on";
            "A solitary / on its own line comments out the entire rest of the script with no way to end it early";
            "A trailing / requires a semicolon before it, while a solitary / does not"
        );

        `a
    );

    `question`answers`correct!(
        "In the update/delete overload ![t;c;b;a], what do the four arguments c, b and a represent (beyond t, the table)?";

        `a`b`c`d!(
            "c is the where-specifications, b is the group-by specifications, and a is the select specifications";
            "c is the column list to drop, b is a boolean for ascending sort, and a is the aggregation function";
            "c is the group-by specifications, b is the select specifications, and a is the where-specifications";
            "c is a handle to a splayed table, b is an integer offset, and a is a symbol vector of new column names"
        );

        `a
    );

    `question`answers`correct!(
        "How does x$y (Enumerate, rank 2) differ syntactically from x?v (Enum Extend, rank 2), given both involve enumeration?";

        `a`b`c`d!(
            "x$y enumerates y against the fixed domain x, signaling a cast error if y contains values not already in x; x?v instead extends the domain x with any new values found in v rather than failing";
            "They are exactly the same operation under two different glyphs, kept for backward compatibility only";
            "x$y extends the domain, while x?v enumerates against a fixed domain — the reverse of the actual behavior";
            "x$y only works on tables, while x?v only works on plain symbol lists"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the documentation recommend using a space to separate names from the _ (underscore) Cut/Drop operator, e.g. writing 3_ til 10 rather than 3_til10?";

        `a`b`c`d!(
            "Because underscore is also a legal character within names, so 3_til10 written without spaces could be misread/parsed as part of an identifier rather than as the Cut/Drop operator applied to til 10";
            "Because underscore requires exactly one space of padding by strict language grammar rules, or it signals a syntax error";
            "Because without a space, q always interprets underscore as Set Attribute instead of Cut/Drop";
            "Spacing has no effect on parsing; it is purely a stylistic recommendation with no ambiguity risk"
        );

        `a
    )
 );