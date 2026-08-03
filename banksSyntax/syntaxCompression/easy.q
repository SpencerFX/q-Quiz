//====================================================================
//
// q-Quiz
//
// Topic      : Compression in kdb+ — Syntax Focus
// Source     : "Compression in kdb+" whitepaper
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxCompression.easy:`twoStepConvert`streamSet`blockSizeArg`algLevelArgs`oldFashionedSet`zzdVar`fieldDictBasic`nullKeyDefault`getReadsTransparent`ascSort`xascSingleCol`wavgSyntax!
    (
    `question`answers`correct!(
        "What does the two-line sequence `:/db/trade_uncompressed set trade  followed by  (`:/db/trade_compressed; 16; 1; 0) set `:/db/trade_uncompressed do overall?";

        `a`b`c`d!(
            "First saves trade to disk uncompressed, then converts that on-disk file into a separate compressed copy";
            "Saves trade to disk compressed in a single step, with no uncompressed intermediate file";
            "Reads a compressed file and decompresses it into the variable trade";
            "Deletes the uncompressed file after compressing trade in memory"
        );

        `a
    );

    `question`answers`correct!(
        "In (`:targetFile; blockSize; alg; level) set table, what does replacing the plain filename symbol on the left of set with this 4-item list achieve?";

        `a`b`c`d!(
            "It streams the in-memory table directly to compressed format on disk in one step, using the given block size, algorithm and level";
            "It creates 4 separate output files, one per list item";
            "It sets 4 different variables to the same table value";
            "It appends table to an existing compressed file 4 times"
        );

        `a
    );

    `question`answers`correct!(
        "In the 4-item left-argument to set, (`:file; 16; 1; 0), what does the first numeric argument (16) represent?";

        `a`b`c`d!(
            "The logical block size, i.e. how much data is compressed/decompressed together as a unit";
            "The compression algorithm ID";
            "The compression level (0-9)";
            "The number of columns to compress"
        );

        `a
    );

    `question`answers`correct!(
        "In (`:file; 16; 1; 0), what do the second and third numeric arguments (1 and 0) represent, in order?";

        `a`b`c`d!(
            "The compression algorithm, followed by the compression level";
            "The compression level, followed by the compression algorithm";
            "The block size multiplier, followed by a checksum flag";
            "A boolean for streaming mode, followed by a retry count"
        );

        `a
    );

    `question`answers`correct!(
        "What does the plain, old-fashioned form `:filename set table do, without any compression parameters supplied?";

        `a`b`c`d!(
            "Saves table to disk uncompressed, unless default compression parameters have been set separately";
            "Always saves table uncompressed, ignoring any other configuration";
            "Always compresses table using gzip level 6";
            "Signals an error, since compression parameters are mandatory"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of setting the variable .z.zd, as in .z.zd:(17;2;6)?";

        `a`b`c`d!(
            "It defines default compression parameters (block size, algorithm, level) applied whenever set is called the plain old-fashioned way";
            "It sets the default zip domain for symbol enumeration";
            "It defines the time zone used for timestamp compression";
            "It disables compression entirely for the session"
        );

        `a
    );

    `question`answers`correct!(
        "In (`:splay/; ``a`b!((17;2;9); (17;2;6); (17;2;6))) set t, what kind of value is being passed as the second item of the left argument?";

        `a`b`c`d!(
            "A dictionary mapping column names to their own compression parameters";
            "A list of three separate file paths";
            "A single compression parameter list shared by all columns";
            "A table of per-row compression settings"
        );

        `a
    );

    `question`answers`correct!(
        "In a field-compression dictionary like ``a`b!(...), what does using the null symbol (an empty symbol) as one of the keys signify?";

        `a`b`c`d!(
            "It defines the default compression parameters applied to any column not explicitly listed in the dictionary";
            "It disables compression for every column";
            "It marks column a as the primary key";
            "It tells kdb+ to skip that column entirely when saving"
        );

        `a
    );

    `question`answers`correct!(
        "How does reading compressed on-disk data differ syntactically from reading uncompressed data, e.g. via get or a memory-mapped select?";

        `a`b`c`d!(
            "It doesn't differ at all — decompression is automatic and transparent, so the same get/select syntax is used either way";
            "A separate decompress function must be called first";
            "The file path must be prefixed with a special compressed-file marker";
            "Compressed files must be loaded with \\l instead of get"
        );

        `a
    );

    `question`answers`correct!(
        "What does asc 1000000?10 produce, as used to build one of the test columns in t:([]a:asc 1000000?10; ...)?";

        `a`b`c`d!(
            "1,000,000 random integers between 0 and 9, sorted ascending";
            "The numbers 0 through 999999 in ascending order";
            "1,000,000 copies of the number 10";
            "A single ascending list of the 10 distinct values only"
        );

        `a
    );

    `question`answers`correct!(
        "What does `sym xasc t do, as used in the sorted-compression comparison?";

        `a`b`c`d!(
            "Sorts table t ascending by its sym column";
            "Applies the sorted attribute to column sym without reordering rows";
            "Creates a new column named sym containing ascending integers";
            "Removes the sym column from t"
        );

        `a
    );

    `question`answers`correct!(
        "What does size wavg price compute, as used in select size wavg price by sym from trade...?";

        `a`b`c`d!(
            "The weighted average of price, weighted by size";
            "The sum of size multiplied by the sum of price";
            "The average of size, ignoring price entirely";
            "The variance of price weighted by the count of size"
        );

        `a
    )
 );