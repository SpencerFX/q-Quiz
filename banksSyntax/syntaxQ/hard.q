//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxQ.hard:`chkBehavior`bvVsBvBacktick`liDynamicPartitions`loNoChdir`dsftgArgs`mapLimitations`idSanitizeRules`fsVsFps`gzThreeForms`hgHpArgs`ipcCompressToggle`defOptCombo!
    (
    `question`answers`correct!(
        "What does .Q.chk[`:hdb] do when some tables are missing from certain partitions, and what does it report back?";

        `a`b`c`d!(
            "It fills the missing tables in each partition using the most recent partition that contains that table as a template, and reports which partitions (not which tables) it fixed";
            "It deletes any partition that is missing a table, to keep the HDB consistent";
            "It reports missing tables per partition but takes no corrective action itself";
            "It signals an error immediately upon finding the first missing table, aborting the whole check"
        );

        `a
    );

    `question`answers`correct!(
        "What is the difference between .Q.bv[] and .Q.bv[`] when building the .Q.vp dictionary of missing-partition schemas?";

        `a`b`c`d!(
            ".Q.bv[] takes the table prototype from the LAST partition, while .Q.bv[`] (with the generic null-ish backtick argument) takes it from the FIRST partition instead";
            ".Q.bv[] and .Q.bv[`] are identical; the argument is ignored";
            ".Q.bv[] only works on splayed tables, while .Q.bv[`] only works on partitioned tables";
            ".Q.bv[] scans every partition every time, while .Q.bv[`] only scans the first and last"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.li[2001.01.02 2001.01.03] do to an already-loaded partitioned HDB that currently only shows 2001.01.01 in date?";

        `a`b`c`d!(
            "Adds the specified partitions to the current in-memory view of the HDB (for those that exist on disk), extending date to include them without a full reload";
            "Deletes 2001.01.01 from the current view and replaces it with only the two new dates";
            "Creates new empty partitions on disk for those two dates if they don't already exist";
            "Has no effect unless the process is restarted with backslash-l first"
        );

        `a
    );

    `question`answers`correct!(
        "What do the two boolean flags cd and scripts control in .Q.lo[`:database;cd;scripts]?";

        `a`b`c`d!(
            "Whether the process changes its working directory to the database directory, and whether any scripts found in that directory are executed, respectively";
            "Whether to compress the database on load, and whether to sort it, respectively";
            "Whether to load in read-only mode, and whether to enumerate symbol columns, respectively";
            "Whether to clear the cache first, and whether to sanitize column names, respectively"
        );

        `a
    );

    `question`answers`correct!(
        "In .Q.dsftg[d;s;f;t;g], what do the five arguments d, s, f, t and g represent?";

        `a`b`c`d!(
            "d is (destination;partition;table), s is (source;offset;length), f is the field names, t is (types;widths), and g is a unary post-processing function applied per chunk";
            "d is the database directory only, s is the sym file, f is a filter function, t is the target table, and g is the number of threads";
            "d is a boolean for dry-run, s is the schema, f is the field to partition by, t is a timeout, and g is a garbage-collection flag";
            "d is the destination table, s is a symbol list of source tables, f is a foreign-key spec, t is a type cast, and g is a grouping column"
        );

        `a
    );

    `question`answers`correct!(
        "According to the documentation, what are two stated limitations of .Q.MAP[]?";

        `a`b`c`d!(
            "It does not work with linked columns, and it does not work with virtual partition columns";
            "It only works with segmented databases, and it requires secondary threads to be enabled";
            "It only works with splayed (non-partitioned) tables, and it cannot be used with compression";
            "It requires the database to be reloaded after every query, and it only supports date partitioning"
        );

        `a
    );

    `question`answers`correct!(
        "Based on the documented examples, what does .Q.id do differently for a table's column names versus a plain symbol atom?";

        `a`b`c`d!(
            "For a symbol atom it sanitizes it into a valid q name; for a table it also appends numeric suffixes to resolve collisions with reserved keywords or with other sanitized column names that would otherwise clash";
            "For a symbol atom it does nothing; sanitization only applies to table column names";
            "For a table it deletes any column whose name isn't already valid, rather than renaming it";
            "Both cases behave identically; .Q.id has no special table-specific collision handling"
        );

        `a
    );

    `question`answers`correct!(
        "How does .Q.fps[x;y] relate to .Q.fpn[x;y;z], and how do both relate to .Q.fs/.Q.fsn?";

        `a`b`c`d!(
            ".Q.fps is a projection of .Q.fpn with a fixed chunk size, used for named-pipe streaming; .Q.fs is the analogous projection of .Q.fsn for regular file streaming — the pipe/file distinction is the key difference between the two families";
            ".Q.fps and .Q.fs are identical functions, just aliased under different names for pipes vs files";
            ".Q.fpn is a projection of .Q.fps, and .Q.fsn is a projection of .Q.fs — the reverse of the actual relationship";
            ".Q.fps works only with CSV files, while .Q.fs works with any delimited format"
        );

        `a
    );

    `question`answers`correct!(
        "What do the three call forms .Q.gz[::], .Q.gz cbv, and .Q.gz (cl;cbv) each return?";

        `a`b`c`d!(
            "A boolean for whether Zlib is loaded; the inflated (unzipped) vector; and a 2-list containing the deflated (zipped) vector, respectively";
            "All three forms return the same inflated vector, differing only in whether logging is enabled";
            "A version string; a compressed vector; and an uncompressed vector, respectively";
            ".Q.gz[::] signals an error; only the other two forms are valid calls"
        );

        `a
    );

    `question`answers`correct!(
        "In .Q.hg x and .Q.hp[x;y;z], what do the arguments represent, and which of the two supports specifying a MIME type?";

        `a`b`c`d!(
            ".Q.hg x takes just a URL and performs a GET; .Q.hp[x;y;z] takes a URL x, a MIME type y, and the POST body z — only .Q.hp supports specifying a MIME type";
            "Both functions take identical (url;mimeType;body) arguments; .Q.hg simply ignores the extra two";
            ".Q.hg[x;y;z] performs a GET with a body, while .Q.hp x performs a POST with no body, the reverse of standard HTTP semantics";
            "Neither function supports MIME types; content type must be set via .Q.ipc instead"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.ipc[h;([z:0b])] do to the connection handle h?";

        `a`b`c`d!(
            "Switches off IPC compression for outgoing data on that handle, since the dictionary sets the z (compression) key to 0b";
            "Closes the connection handle h entirely";
            "Enables IPC compression at the maximum level for that handle";
            "Switches off IPC compression for ALL handles on the process, not just h"
        );

        `a
    );

    `question`answers`correct!(
        "Given q -param1 11 -param2 2000.01.01 -param3 wrong is used to start the process, what does .Q.def[`param1`param2`param3!(1;1999.01.01;23.1)].Q.opt .z.x produce for param3, and why?";

        `a`b`c`d!(
            "0n — because \"wrong\" cannot be converted to a float (the type inferred from the default value 23.1), so .Q.def produces a null instead of signaling an error";
            "\"wrong\" — the raw uncast string is kept whenever conversion fails";
            "23.1 — the default value is silently substituted whenever conversion fails, without any null involved";
            "An error is signaled immediately, halting startup, since \"wrong\" is not a valid float"
        );

        `a
    )
 );
//====================================================================