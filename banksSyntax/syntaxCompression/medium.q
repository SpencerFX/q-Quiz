//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxCompression.medium:`symVenueSortLines`boolIntLongGen`nWiUsage`quoteTableGen`xbarBucket`ajSyntax`idsSubsetSelect`compRatioComparisonSetup`enSymEnumBeforeSave`fourArgVsPlain`splaySlashPath`selectAllNeq!
    (
    `question`answers`correct!(
        "Across the four lines building uncompressed/unsorted/symSorted/symVenueSorted versions of the same table, what changes from one line to the next?";

        `a`b`c`d!(
            "The destination path and whether/how the table is sorted before being passed to set, while the compression parameters (16;2;5) stay the same for the three compressed versions";
            "The compression algorithm changes on each line, while sorting stays constant";
            "The row count n changes on each line to keep file sizes comparable";
            "Only the block size changes across the four lines"
        );

        `a
    );

    `question`answers`correct!(
        "In (`:symVenueSorted/;16;2;5) set .Q.en[`:symVenueSorted] `sym`venue xasc t, in what order do the operations conceptually happen, reading right to left?";

        `a`b`c`d!(
            "Sort t by sym then venue, enumerate the sorted table's symbol columns against the target sym file, then stream the result to disk compressed";
            "Compress t first, then sort the compressed file, then enumerate it";
            "Enumerate t first, then compress it, then sort the compressed output";
            "Save t uncompressed first, then sort and enumerate the saved file in place"
        );

        `a
    );

    `question`answers`correct!(
        "In ints:n?0Wi, what does 0Wi represent, and what does the expression generate?";

        `a`b`c`d!(
            "0Wi is the maximum int value (infinity for type int); the expression generates n random integers up to that bound";
            "0Wi is zero as a float; the expression generates n copies of 0";
            "0Wi is a null int; the expression generates n null values";
            "0Wi is a width specifier; the expression generates n bit-packed integers"
        );

        `a
    );

    `question`answers`correct!(
        "In t:([]boolean:n?01b;integer:ints;longint:`long$ints), what ensures the integer and longint columns contain the same underlying values?";

        `a`b`c`d!(
            "longint is created by casting the already-generated ints list to long with `long$ints, rather than generating new random values";
            "Both columns are generated independently with the same seed";
            "kdb+ automatically synchronizes columns with similar names";
            "integer and longint are actually the same column duplicated by reference"
        );

        `a
    );

    `question`answers`correct!(
        "In the quote table generator, what does n*:4 do immediately before quote is built, given that trade was built with the original n?";

        `a`b`c`d!(
            "Quadruples n in place, so the quote table ends up with four times as many rows as the trade table";
            "Divides n by 4, giving the quote table a quarter as many rows as trade";
            "Multiplies each existing value in trade's columns by 4";
            "Resets n back to its original value after building trade"
        );

        `a
    );

    `question`answers`correct!(
        "In the quote table generator, what does time:\"p\"$st+((et-st)%n-1)*til n produce?";

        `a`b`c`d!(
            "n evenly-spaced timestamps between st and et, cast to timestamp (type p)";
            "n randomly-shuffled timestamps between st and et";
            "A single timestamp value repeated n times";
            "n timestamps counting down from et to st"
        );

        `a
    );

    `question`answers`correct!(
        "What does 5 xbar time.minute do, as used in select size wavg price by sym, 5 xbar time.minute from trade...?";

        `a`b`c`d!(
            "Buckets the minute component of time into 5-minute intervals for grouping";
            "Selects only rows where the minute is a multiple of 5";
            "Multiplies every minute value by 5";
            "Filters to the first 5 minutes of trading only"
        );

        `a
    );

    `question`answers`correct!(
        "In aj[`sym`time; select from trade where sym in ids; select from quote], what do the three arguments represent, in order?";

        `a`b`c`d!(
            "The join columns, the left (trade) table restricted to a symbol subset, and the right (quote) table to join against";
            "The join columns, the right table, and the left table";
            "A list of columns to drop, followed by the two tables to join";
            "The output column names, followed by the two source tables"
        );

        `a
    );

    `question`answers`correct!(
        "What does select from trade where sym in ids do, where ids is a vector of 100 symbols?";

        `a`b`c`d!(
            "Returns all rows of trade whose sym value matches any of the 100 symbols in ids";
            "Returns only the first 100 rows of trade";
            "Returns rows of trade where sym equals the literal symbol ids";
            "Returns a count of how many distinct symbols are in ids"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the sorted-compression example wrap each table in .Q.en[`:dir] before passing it to set, e.g. .Q.en[`:symSorted] `sym xasc t?";

        `a`b`c`d!(
            "To enumerate the symbol columns against the target directory's sym file before splaying/streaming to disk, as kdb+ requires for symbol columns";
            "To sort the table by every symbol column automatically";
            "To encrypt the symbol columns before compression";
            "To convert the symbol columns into strings before saving"
        );

        `a
    );

    `question`answers`correct!(
        "What is the functional difference between `:uncompressed/ set .Q.en[`:uncompressed] t  and  (`:unsorted/;16;2;5) set .Q.en[`:unsorted] t?";

        `a`b`c`d!(
            "The first saves the enumerated table uncompressed; the second streams the same enumerated table directly to disk in compressed format using block size 16, algorithm 2, level 5";
            "The first compresses the table; the second saves it uncompressed";
            "They are functionally identical, differing only in variable naming";
            "The first enumerates against a different sym file than the second"
        );

        `a
    );

    `question`answers`correct!(
        "What does select from trade where i<>0 effectively return, given that i is the implicit row-index column?";

        `a`b`c`d!(
            "Every row of trade, since every row index except possibly 0 satisfies i<>0, making this effectively a full-table scan/select";
            "Only the first row of trade (where i=0)";
            "All rows except the first one";
            "An empty result, since i<>0 is never true"
        );

        `a
    )
 );