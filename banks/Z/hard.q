//====================================================================
//
// q-Quiz
//
// Topic      : .Q Internals
// Difficulty : Hard
//
//====================================================================
.quiz.Q.hard:`qdpftWorkflow`qparUsage`qchkPurpose`qenPersistence`qunenPersistence`qdpftSym`qdpftPartition`qparConstruction`qchkMissingTables`qenHdb`qunenRead`qdpftVsSave`qchkTiming`qparResult`qenConsistency`qunenWhen`qdpftSchema`qchkMetadata`qparHandle`workflow!
    (
    `question`answers`correct!(
        "What is the primary advantage of using .Q.dpft instead of manually writing tables to disk?";

        `a`b`c`d!(
            "It automatically partitions, enumerates symbols and writes a splayed table";
            "It compresses every column";
            "It creates a tickerplant log";
            "It sorts every table by time"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function is commonly used to construct the path to a partition within a partitioned database?";

        `a`b`c`d!(
            ".Q.par";
            ".Q.dpft";
            ".Q.chk";
            ".Q.en"
        );

        `a
    );

    `question`answers`correct!(
        "In the expression .Q.dpft[`:.;d;`sym;] what does the third argument represent?";

        `a`b`c`d!(
            "The column used for the parted attribute";
            "The partition directory";
            "The compression algorithm";
            "The sort order"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .Q.en typically called before persisting data into an HDB?";

        `a`b`c`d!(
            "To enumerate symbols against the database sym file";
            "To compress symbol columns";
            "To reorder partitions";
            "To validate schemas"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of .Q.un when reading historical data?";

        `a`b`c`d!(
            "To convert enumerated symbols back into ordinary symbols";
            "To remove duplicate rows";
            "To unpack compressed blocks";
            "To rebuild partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function ensures that every partition contains the required table structure?";

        `a`b`c`d!(
            ".Q.chk";
            ".Q.par";
            ".Q.dpft";
            ".Q.en"
        );

        `a
    );

    `question`answers`correct!(
        "When appending a newly created partition manually, when should .Q.chk usually be executed?";

        `a`b`c`d!(
            "After the partition has been written";
            "Before any tables are written";
            "Before enumeration";
            "After every individual column write"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.par primarily return?";

        `a`b`c`d!(
            "The filesystem path for a partition/table";
            "A partition number";
            "The partition count";
            "A partition attribute"
        );

        `a
    );

    `question`answers`correct!(
        "Why is enumeration important before writing historical data?";

        `a`b`c`d!(
            "It ensures symbols share a common integer mapping across partitions";
            "It alphabetically sorts symbols";
            "It compresses symbol values";
            "It creates the sym file automatically"
        );

        `a
    );

    `question`answers`correct!(
        "What problem can occur if .Q.en is skipped before writing an HDB?";

        `a`b`c`d!(
            "Symbol columns may not match the HDB enumeration";
            "Compression will fail";
            "The partition cannot be queried";
            "Time columns lose precision"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes the relationship between .Q.en and .Q.un?";

        `a`b`c`d!(
            "They perform opposite operations";
            "They are interchangeable";
            "Both enumerate symbols";
            "Both create partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Which workflow correctly persists an in-memory table into a partitioned HDB?";

        `a`b`c`d!(
            ".Q.en → .Q.dpft";
            ".Q.dpft → .Q.en";
            ".Q.chk → .Q.en";
            ".Q.par → .Q.en"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.chk add when a partition is missing a table?";

        `a`b`c`d!(
            "An empty table with the correct schema";
            "A compressed version";
            "A tickerplant log";
            "A sym attribute"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function is most commonly used when constructing custom end-of-day logic?";

        `a`b`c`d!(
            ".Q.dpft";
            ".Q.un";
            ".Q.enlist";
            ".Q.f"
        );

        `a
    );

    `question`answers`correct!(
        "What is the return type of .Q.par?";

        `a`b`c`d!(
            "A filesystem handle";
            "A table";
            "A dictionary";
            "A symbol list"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .Q.un generally unnecessary inside an HDB itself?";

        `a`b`c`d!(
            "The HDB is designed to work directly with enumerated symbols";
            "Symbols are never enumerated";
            "The HDB automatically compresses symbols";
            "Enumeration only exists in RDBs"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function depends on knowing the HDB root directory?";

        `a`b`c`d!(
            ".Q.en";
            ".Q.chk";
            ".Q.un";
            ".Q.f"
        );

        `a
    );

    `question`answers`correct!(
        "In custom persistence code, .Q.par is often used because it:";

        `a`b`c`d!(
            "Avoids manually constructing filesystem paths";
            "Automatically writes tables";
            "Enumerates symbols";
            "Applies attributes"
        );

        `a
    );

    `question`answers`correct!(
        "Which combination of .Q functions is most commonly found together during HDB maintenance?";

        `a`b`c`d!(
            ".Q.dpft and .Q.chk";
            ".Q.un and .Q.par";
            ".Q.en and .Q.un only";
            ".Q.par and .Q.f"
        );

        `a
    );

    `question`answers`correct!(
        "A production HDB loader writes data using .Q.dpft and then immediately calls .Q.chk. Why?";

        `a`b`c`d!(
            "To ensure the database metadata and table structure remain consistent";
            "To compress the new partition";
            "To enumerate symbols twice";
            "To remove duplicate partitions"
        );

        `a
    )
 );
//====================================================================