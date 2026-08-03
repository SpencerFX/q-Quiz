//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxQ.medium:`dpftArgs`enVsEns`fmtVsF`fcVsPeach`fuCaveat`ffNullFill`indVsVirtualI`parNoSegmentCheck`viewConstraint`trpVsTrpd`tsReturnShape`j10VsJ12!
    (
    `question`answers`correct!(
        "In .Q.dpft[d;p;f;t], what do the four arguments represent, and what does f control about the saved column order?";

        `a`b`c`d!(
            "d is the directory, p the partition, f the field to splay/sort by (required to be present in the table), and t the table name; f's column ends up second in the saved table, after the virtual partition column";
            "d is the table name, p the partition field, f the directory, and t the partition value; f determines the compression level used";
            "d is the directory, p the partition, f a flag for whether to enumerate, and t the table; f has no effect on column order";
            "d is the domain to enumerate against, p the partition, f the field, and t the table; d determines column order, not f"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference between .Q.en[dir;table] and .Q.ens[dir;table;name]?";

        `a`b`c`d!(
            ".Q.en always enumerates against the default sym domain/file, while .Q.ens lets you specify an alternative domain name (and therefore filename) to enumerate against";
            ".Q.en works only on tables in memory, while .Q.ens works only on splayed tables";
            ".Q.en enumerates every column regardless of type, while .Q.ens only enumerates symbol columns";
            ".Q.en requires a directory argument, while .Q.ens does not"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference between .Q.fmt[x;y;z] and .Q.f[x;y]?";

        `a`b`c`d!(
            ".Q.fmt formats z to y decimal places within a fixed total string length x, while .Q.f formats y to x decimal places with no fixed overall length";
            ".Q.fmt and .Q.f take identical arguments and behave identically";
            ".Q.fmt only works on integers, while .Q.f only works on floats";
            ".Q.fmt returns a numeric value, while .Q.f always returns a string of length 1"
        );

        `a
    );

    `question`answers`correct!(
        "Why might .Q.fc[x;y] outperform x peach y for a given workload, based on the paper's example?";

        `a`b`c`d!(
            "For workloads where the overhead of spinning up peach's parallelism outweighs the computational benefit, .Q.fc's simpler multi-threaded cut-based approach can be faster";
            ".Q.fc never actually runs in parallel, so it has zero threading overhead by definition";
            ".Q.fc automatically caches results across calls, while peach never does";
            "x peach y is only valid for table arguments, while .Q.fc works on any list"
        );

        `a
    );

    `question`answers`correct!(
        "What caveat does the documentation give about using .Q.fu[x;y] instead of x each y?";

        `a`b`c`d!(
            "It's only safe when x's result for a given item of y doesn't depend on any other item of y — .Q.fu evaluates x only on the distinct items and maps results back, which can give wrong results for non-independent functions like avg over groups";
            "It only works when y contains fewer than 10 items";
            "It's always exactly equivalent to x each y, with no caveats, just faster";
            "It requires x to be a binary function, not unary"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.ff[x;y] do, and what happens to columns that already exist in both x and y?";

        `a`b`c`d!(
            "It returns x with all new columns from y appended and set to null of the appropriate type; columns already present in x are kept from x, not overwritten by y";
            "It returns y with columns from x appended, overwriting any common columns with x's values";
            "It performs a full outer join between x and y, filling unmatched rows with null";
            "It deletes any columns from x that are not also present in y"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .Q.ind[x;y] needed for a partitioned table, when select from table where i<100 works fine on an in-memory table?";

        `a`b`c`d!(
            "The virtual column i (row index) is not directly usable in a where-clause against a partitioned table the same way, so .Q.ind provides an explicit mechanism to select specific row indexes from x";
            "Partitioned tables have no row index at all, so .Q.ind fabricates one from scratch";
            ".Q.ind is required because partitioned tables cannot be queried with select at all";
            "i within a partitioned table always refers to the partition number, not the row, so .Q.ind disambiguates this"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.par[dir;part;table] compute, and what does it NOT verify?";

        `a`b`c`d!(
            "It calculates the expected on-disk path for that table/partition based on par.txt's round-robin assignment, but it does not check whether the partition actually exists inside that segment";
            "It physically scans the segment directories to confirm the partition exists there, returning null if not found";
            "It returns the compression settings used for that partition, not a filepath";
            "It creates the partition directory if it doesn't already exist"
        );

        `a
    );

    `question`answers`correct!(
        "What effect does .Q.view x have on subsequent queries against partitioned/segmented tables?";

        `a`b`c`d!(
            "x (a list of partition values) is added as a constraint in the first sub-phrase of the where-clause of every query against any partitioned table in the database, restricting which partitions are scanned";
            "It permanently deletes all partitions not in x from disk";
            "It only affects the single next query, then resets to the full partition range";
            "It changes the partition field itself (e.g. from date to month) rather than filtering values"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference between .Q.trp[f;x;g] and .Q.trpd[f;x;g]?";

        `a`b`c`d!(
            ".Q.trp extends Trap At for a unary function f applied to a single argument x, while .Q.trpd extends Trap for a function f of any rank applied to a list/atom x of matching arguments";
            ".Q.trp only works locally, while .Q.trpd only works over IPC";
            ".Q.trp returns the backtrace directly, while .Q.trpd requires a separate call to .Q.sbt";
            ".Q.trp and .Q.trpd are fully interchangeable, differing only in name"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.ts[x;y] return, given x and y are valid arguments to Apply?";

        `a`b`c`d!(
            "A 2-item list of (time and space used, as backslash-ts would report) followed by the actual result of .[x;y]";
            "Only the time and space used, discarding the result of .[x;y]";
            "Only the result of .[x;y], with timing printed as a side effect rather than returned";
            "A dictionary with keys time, space, and result"
        );

        `a
    );

    `question`answers`correct!(
        "How do .Q.j10/.Q.x10 differ from .Q.j12/.Q.x12 in terms of alphabet and maximum input length?";

        `a`b`c`d!(
            ".Q.j10/.Q.x10 use a base-64-style alphabet (.Q.b6) with max length 10, while .Q.j12/.Q.x12 use a smaller base-36 alphabet (.Q.nA) allowing a longer max length of 12";
            ".Q.j10/.Q.x10 and .Q.j12/.Q.x12 use the same alphabet, differing only in numeric base of the output";
            ".Q.j10/.Q.x10 encode/decode binary data only, while .Q.j12/.Q.x12 work only on ASCII text";
            ".Q.j10/.Q.x10 have no length limit, while .Q.j12/.Q.x12 are capped at 10 characters"
        );

        `a
    )
 );