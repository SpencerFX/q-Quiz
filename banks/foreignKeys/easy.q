//====================================================================
//
// q-Quiz
//
// Topic      : Foreign Keys
// Difficulty : Easy
//
// Based on the KX whitepaper "Foreign Keys and Linked Columns"
//
//====================================================================
.quiz.foreignKeys.easy:`foreignKeyPurpose`enumerationRelationship`parentChild`castFailure`dotNotation`lookupTable`dataIntegrity`keyedTable`compoundForeignKey`valueRemove`linkedColumn`linkedColumnDisk`joinComparison`foreignKeyInsert`foreignKeyReference`foreignKeyBenefit`enumerationStorage`linkedColumnPurpose`referentialIntegrity`foreignKeyPerformance!
    (
    `question`answers`correct!(
        "A foreign key in kdb+ is conceptually most similar to:";

        `a`b`c`d!(
            "An enumeration";
            "A partition";
            "A column attribute";
            "A namespace"
        );

        `a
    );

    `question`answers`correct!(
        "A foreign key creates a relationship between:";

        `a`b`c`d!(
            "Two unrelated columns";
            "A child column and a keyed table";
            "Two namespaces";
            "Two partitions"
        );

        `b
    );

    `question`answers`correct!(
        "What is stored inside a foreign-key column?";

        `a`b`c`d!(
            "The original symbol";
            "A pointer to the referenced row";
            "A character string";
            "A dictionary"
        );

        `b
    );

    `question`answers`correct!(
        "Attempting to insert a symbol that does not exist in the referenced keyed table results in:";

        `a`b`c`d!(
            "A null value";
            "A cast error";
            "Automatic insertion";
            "A type promotion"
        );

        `b
    );

    `question`answers`correct!(
        "What feature allows expressions such as sym.bookValPerShare?";

        `a`b`c`d!(
            "Attributes";
            "Dot notation";
            "Functional SQL";
            "Meta tables"
        );

        `b
    );

    `question`answers`correct!(
        "The referenced table in a foreign key must be:";

        `a`b`c`d!(
            "Partitioned";
            "Sorted";
            "Keyed";
            "Grouped"
        );

        `c
    );

    `question`answers`correct!(
        "One benefit of foreign keys is improved:";

        `a`b`c`d!(
            "Data integrity";
            "Compression only";
            "Thread scheduling";
            "Garbage collection"
        );

        `a
    );

    `question`answers`correct!(
        "Changing or deleting rows from a referenced keyed table may:";

        `a`b`c`d!(
            "Automatically rebuild every foreign key";
            "Invalidate existing references";
            "Have no effect";
            "Only affect memory usage"
        );

        `b
    );

    `question`answers`correct!(
        "A compound foreign key references:";

        `a`b`c`d!(
            "One column";
            "Two or more columns";
            "One table only";
            "One partition"
        );

        `b
    );

    `question`answers`correct!(
        "Which function removes a simple foreign key from a column?";

        `a`b`c`d!(
            "value";
            "ungroup";
            "flip";
            "key"
        );

        `a
    );

    `question`answers`correct!(
        "Unlike foreign keys, linked columns require the referenced table to be:";

        `a`b`c`d!(
            "Partitioned";
            "Keyed";
            "Sorted";
            "None of the above"
        );

        `d
    );

    `question`answers`correct!(
        "A major advantage of linked columns is that they work well with:";

        `a`b`c`d!(
            "Splayed tables";
            "CSV files";
            "Only in-memory tables";
            "Namespaces"
        );

        `a
    );

    `question`answers`correct!(
        "Compared to repeatedly performing joins, foreign keys generally provide:";

        `a`b`c`d!(
            "Lower query latency";
            "Larger memory usage";
            "Slower lookups";
            "More disk writes"
        );

        `a
    );

    `question`answers`correct!(
        "Before inserting into a table containing a foreign key, the value must:";

        `a`b`c`d!(
            "Be compressed";
            "Exist in the referenced key";
            "Be sorted";
            "Be grouped"
        );

        `b
    );

    `question`answers`correct!(
        "A foreign key primarily represents:";

        `a`b`c`d!(
            "A copy of another table";
            "A reference to another table";
            "A partition location";
            "A file handle"
        );

        `b
    );

    `question`answers`correct!(
        "One important advantage of foreign keys is reducing:";

        `a`b`c`d!(
            "Redundant data";
            "CPU cores";
            "Namespaces";
            "Partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Foreign keys are internally implemented using:";

        `a`b`c`d!(
            "Integer references";
            "Character arrays";
            "Floating-point values";
            "GUIDs"
        );

        `a
    );

    `question`answers`correct!(
        "Linked columns are most useful when:";

        `a`b`c`d!(
            "Working with historical databases";
            "Writing CSV files";
            "Creating namespaces";
            "Managing IPC connections"
        );

        `a
    );

    `question`answers`correct!(
        "Foreign keys help ensure:";

        `a`b`c`d!(
            "Referential integrity";
            "Automatic partitioning";
            "Disk compression";
            "Parallel execution"
        );

        `a
    );

    `question`answers`correct!(
        "Why are foreign-key queries typically faster than repeated joins?";

        `a`b`c`d!(
            "Relationships are precomputed";
            "Tables are automatically compressed";
            "They avoid symbols";
            "They use fewer columns"
        );

        `a
    )
 );
//====================================================================