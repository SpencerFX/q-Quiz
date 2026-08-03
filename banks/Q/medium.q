//====================================================================
//
// q-Quiz
//
// Topic      : .Q Internals
// Difficulty : Medium
//
//====================================================================
.quiz.Q.medium:`QdpftProcess`QenPurpose`QparResult`QchkFunction`QviewBehavior`QindUsage`QidGeneration`QtyDetection`QfmtOutput`QoptParse`QfcCSV`QcnCasting`QhostDiscovery`QaddrSockets`QxCompression`QsSerialization`QwWorkspace`QgcCleanup`QresTiming`Qnamespace!
    (
    `question`answers`correct!(
        "What is the primary purpose of .Q.dpft?";

        `a`b`c`d!(
            "Write partitioned tables to an HDB partition";
            "Compress tables";
            "Create enumerations";
            "Load splayed tables"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .Q.en commonly used before writing data to disk?";

        `a`b`c`d!(
            "To enumerate symbols against an existing sym file";
            "To encrypt the data";
            "To compress the table";
            "To remove duplicate rows"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.par return?";

        `a`b`c`d!(
            "The filesystem location of a partition";
            "The current partition count";
            "The partition attribute";
            "A list of dates"
        );

        `a
    );

    `question`answers`correct!(
        "When is .Q.chk typically executed?";

        `a`b`c`d!(
            "After adding new partitions or tables to an HDB";
            "Before every select";
            "When compressing data";
            "Before serialization"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes .Q.view?";

        `a`b`c`d!(
            "It creates a virtual table from another table";
            "It loads CSV files";
            "It compresses partitions";
            "It creates dictionaries"
        );

        `a
    );

    `question`answers`correct!(
        "Which function is commonly used to locate row indices satisfying a condition?";

        `a`b`c`d!(
            ".Q.ind";
            ".Q.par";
            ".Q.chk";
            ".Q.gc"
        );

        `a
    );

    `question`answers`correct!(
        "What kind of value does .Q.id typically generate?";

        `a`b`c`d!(
            "A unique identifier";
            "A partition number";
            "A compressed byte vector";
            "A timestamp list"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of .Q.ty?";

        `a`b`c`d!(
            "Determine the datatype of an object";
            "Convert symbols to strings";
            "Compress objects";
            "Sort tables"
        );

        `a
    );

    `question`answers`correct!(
        "Why would a developer use .Q.fmt?";

        `a`b`c`d!(
            "To produce formatted textual output";
            "To serialize objects";
            "To enumerate symbols";
            "To partition tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which task is .Q.opt primarily associated with?";

        `a`b`c`d!(
            "Parsing command-line options";
            "Optimizing joins";
            "Compressing files";
            "Sorting columns"
        );

        `a
    );

    `question`answers`correct!(
        "What is a common use for .Q.fc?";

        `a`b`c`d!(
            "Reading or writing delimited text files";
            "Compressing byte streams";
            "Applying attributes";
            "Generating UUIDs"
        );

        `a
    );

    `question`answers`correct!(
        "Which description best matches .Q.cn?";

        `a`b`c`d!(
            "Convert data between compatible representations";
            "Connect to IPC handles";
            "Compress namespaces";
            "Create partitions"
        );

        `a
    );

    `question`answers`correct!(
        "What information does .Q.host typically provide?";

        `a`b`c`d!(
            "The hostname of the current machine";
            "The current q version";
            "The current partition";
            "The current namespace"
        );

        `a
    );

    `question`answers`correct!(
        "Which networking task is .Q.addr associated with?";

        `a`b`c`d!(
            "Working with socket/IP addresses";
            "Generating UUIDs";
            "Compressing IPC";
            "Enumerating symbols"
        );

        `a
    );

    `question`answers`correct!(
        "The helper .Q.x is most closely related to:";

        `a`b`c`d!(
            "Compression utilities";
            "SQL parsing";
            "Partition management";
            "CSV loading"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function family is associated with serialization helpers?";

        `a`b`c`d!(
            ".Q.s";
            ".Q.par";
            ".Q.gc";
            ".Q.chk"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of .Q.w?";

        `a`b`c`d!(
            "Return information about workspace or memory usage";
            "Write partitioned tables";
            "Generate UUIDs";
            "Compress files"
        );

        `a
    );

    `question`answers`correct!(
        "Why might .Q.gc be called explicitly?";

        `a`b`c`d!(
            "To encourage garbage collection after releasing large objects";
            "To compress memory";
            "To reload the HDB";
            "To enumerate symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Which helper would be useful when benchmarking execution time?";

        `a`b`c`d!(
            ".Q.res";
            ".Q.par";
            ".Q.host";
            ".Q.opt"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of the .Q namespace?";

        `a`b`c`d!(
            "Provide built-in utility functions supporting the q runtime";
            "Contain user-defined functions";
            "Store system variables";
            "Implement SQL keywords"
        );

        `a
    )
 );
//====================================================================