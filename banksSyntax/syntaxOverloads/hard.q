//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxOverloads.hard:`querySelectRankLadder`bangEnumFromIndex`bangFlipSplayed`dollarMmuForm`atVsDotDifference`convergeDoWhileTriple`quoteCaseForm`quoteComposeForm`bangDisplayReturn`colonColonIdentityNull`multilineCommentBlock`negVsSubtractDisambiguation!
    (
    `question`answers`correct!(
        "Walking through the ? overload used for querying tables — ?[t;i;p] (rank 3), ?[t;c;b;a] (rank 4), ?[t;c;b;a;n] (rank 5), and ?[t;c;b;a;n;(g;cn)] (rank 6) — which correctly matches 'Simple Exec' and which is full 'Select' with a row limit?";

        `a`b`c`d!(
            "?[t;i;p] (rank 3) is Simple Exec; ?[t;c;b;a;n] (rank 5) is Select with a row-count limit n added on top of the rank-4 where/by/select-spec form";
            "?[t;c;b;a] (rank 4) is Simple Exec; ?[t;i;p] (rank 3) is full Select with no limit";
            "?[t;c;b;a;n;(g;cn)] (rank 6) is Simple Exec, since it has the most arguments; ?[t;i;p] is unrelated to Select/Exec entirely";
            "All four ranks perform identical Select/Exec behavior; the extra arguments are purely optional logging hooks with no functional effect"
        );

        `a
    );

    `question`answers`correct!(
        "What does the ! overload noasv!iv (Enumeration from index) do, where noasv is a symbol atom naming a symbol vector and iv is an integer vector?";

        `a`b`c`d!(
            "Creates an enumerated list by treating iv as index positions into the symbol vector named by noasv, producing symbol values looked up by those indices";
            "Creates a dictionary mapping the symbol vector named by noasv to the raw integers in iv, with no lookup performed";
            "Deletes the entries at positions iv from the symbol vector named by noasv";
            "Converts iv into symbols directly, ignoring noasv entirely"
        );

        `a
    );

    `question`answers`correct!(
        "What does sv!h do, using ! at rank 2 (Flip Splayed or Partitioned), where sv is a symbol vector and h is a handle to a splayed or partitioned table?";

        `a`b`c`d!(
            "Uses sv as column names to select and flip specific columns from the splayed/partitioned table at handle h into an in-memory table shape";
            "Splays the in-memory table sv to disk at the location given by handle h";
            "Deletes the columns named in sv from the splayed table at h";
            "Renames the columns of the table at h to the names in sv, in place on disk"
        );

        `a
    );

    `question`answers`correct!(
        "Which $ overload is used for (1 2 3f;4 5 6f)$(7 8f;9 10f;11 12f), and what is it computing?";

        `a`b`c`d!(
            "The rank-2 dot-product/matrix-multiply (mmu) form of $, multiplying the two matrices together";
            "The Cond (conditional) form, treating the first matrix as a condition and the second as branch values";
            "The Cast form, casting the second matrix to the shape of the first";
            "The Pad form, padding the shorter matrix with the values from the longer one"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing the @ family (l@i, @[f;y;e], @[d;i;u]) with the exactly analogous . family (l . i, .[g;gx;e], .[d;i;u]), what is the general syntactic distinction between when you'd reach for @ versus . in each of these pairs?";

        `a`b`c`d!(
            "@ takes its index/argument as a single atom or simple value directly, while . takes its index/argument as a LIST (allowing multi-level/multi-argument indexing or application in one call) — they are otherwise semantically parallel across Index/Apply/Trap/Amend";
            "@ is used exclusively for tables, while . is used exclusively for dictionaries, with no other distinction";
            "@ and . are fully interchangeable in every position with zero difference in behavior or accepted argument shapes";
            ". only works inside the debugger, while @ only works in normal top-level code"
        );

        `a
    );

    `question`answers`correct!(
        "Given the three related / (or \\) rank-1 forms — (u/)y Converge, n u/y Do, and t u/y While — what determines which of the three fires for a given u/y invocation?";

        `a`b`c`d!(
            "It's determined by what precedes the /: nothing (bare u/, applied until the result stops changing) is Converge; a non-negative int atom n is Do (apply exactly n times); a test value t is While (apply as long as t evaluates truthy)";
            "All three are the same operation; the left-hand value is purely cosmetic and never changes behavior";
            "Converge requires t, Do requires u alone, and While requires n — the roles are reversed from the actual behavior";
            "The distinction is based solely on the TYPE of y, not on what appears to the left of the slash"
        );

        `a
    );

    `question`answers`correct!(
        "What does int'[x;y;...] do, using ' (quote) in its 'Case' form, where int is an int vector?";

        `a`b`c`d!(
            "Selects successive items from the given lists (x;y;...) according to the values in int, effectively picking a different source list per position based on int's values";
            "Applies Each to every one of x, y, ... using int as a shared unary function reference";
            "Signals an error for every position where int is negative";
            "Composes each of x, y, ... together in the order given by int"
        );

        `a
    );

    `question`answers`correct!(
        "What does '[u;v] do, using ' (quote) in its 'Compose' form (rank 2)?";

        `a`b`c`d!(
            "Creates a new composed function that first applies v, then applies u to that result — functional composition of u with v";
            "Applies u itemwise (Each) across the result of v applied to some data, identical to (u')(v x)";
            "Signals an error msg drawn from evaluating v, using u as a fallback handler";
            "Zips u and v together elementwise into a single list of function pairs"
        );

        `a
    );

    `question`answers`correct!(
        "What does 0N!y do, using ! at rank 2 in its display form?";

        `a`b`c`d!(
            "Displays y to the console (like show) and also returns y as the result of the expression";
            "Creates a dictionary keyed by the null integer 0N, mapping to y";
            "Deletes y from the current namespace after printing its old value";
            "Casts y to type 0N (null), discarding its original value"
        );

        `a
    );

    `question`answers`correct!(
        ":: (colon colon) is listed with two bare, argument-less meanings — Identity and Null. What is the key distinction in how :: behaves in each of these roles versus its 'define a view' and 'amend a global' roles?";

        `a`b`c`d!(
            "As bare, standalone syntax with no name/expression around it, :: acts as either the Identity function or the generic Null value depending on context; when used as v::expr or global::42, it instead performs view-definition or global-amend-from-within-a-lambda, which are name-binding operations rather than values in themselves";
            ":: always means Identity in every context, with 'Null' simply being an alternative name for the same behavior";
            "The view-definition and global-amend forms are only available inside the debugger, while Identity/Null are only available at the top level";
            "There is no distinction; all four listed behaviors of :: are triggered identically regardless of surrounding syntax"
        );

        `a
    );

    `question`answers`correct!(
        "In the multiline-comment example — a line containing just /, followed by several lines of text, followed by a line containing just backslash, followed by 2+2 — what gets evaluated?";

        `a`b`c`d!(
            "Only 2+2 is evaluated; everything between the solitary / line and the solitary backslash line is treated as one multiline comment block and skipped entirely";
            "Every line including the comment text is evaluated as q code, causing multiple errors";
            "Nothing is evaluated; the solitary backslash at that position aborts the entire script";
            "Only the comment text is evaluated; 2+2 is treated as part of the comment since it follows the closing backslash"
        );

        `a
    );

    `question`answers`correct!(
        "Given q)neg[3]~-3 returns 1b, what determines whether a - immediately preceding a number is parsed as Negate versus as the binary Subtract operator in an expression like 5-3?";

        `a`b`c`d!(
            "Whether - sits immediately to the left of a number with nothing (or an operator/open-paren) directly before it on the left, making it unary Negate, versus whether it sits between two values, making it binary Subtract at rank 2";
            "Negate and Subtract are indistinguishable in every context; -3 and 5-3 are parsed identically and disambiguated only at runtime by value type";
            "- is always binary Subtract; unary negation is only ever available via the neg function, never via bare -";
            "Whether whitespace surrounds the minus sign is irrelevant; only the presence of a preceding semicolon determines Negate vs Subtract"
        );

        `a
    )
 );
//====================================================================