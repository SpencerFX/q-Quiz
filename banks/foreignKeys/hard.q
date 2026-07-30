//====================================================================
//
// q-Quiz
//
// Topic      : Foreign Keys
// Difficulty : Hard
//
// Based on the KX whitepaper "Foreign Keys and Linked Columns"
//
//====================================================================
.quiz.foreignKeys.hard:`enumType20`enumLimit`compoundStorage`linkedColumnOperator`linkedColumnMeta`dotChain`valueComplex`ondiskLink`updateDotD`linkedColumnReload`foreignKeyVsLinked`crossDatabase`symbolicLinks`lcDpft`lcEn`foreignKeyPerformance`linkedMissing`multiDatabaseSym`foreignKeyDeletion`enumerationInternals!
    (
    `question`answers`correct!(
        "In kdb+ 3.x, what is the type of the first foreign-key/enumerated column created?";

        `a`b`c`d!(
            "20h";
            "11h";
            "76h";
            "99h"
        );

        `a
    );

    `question`answers`correct!(
        "What happens after approximately 57 enumeration domains have been created in a single process?";

        `a`b`c`d!(
            "New enumerations silently overwrite old ones";
            "An 'elim error is signaled";
            "The domain wraps back to 20h";
            "The session converts them to symbols"
        );

        `b
    );

    `question`answers`correct!(
        "A complex foreign-key column is physically stored as:";

        `a`b`c`d!(
            "A symbol vector";
            "Row indexes into the referenced table";
            "GUID values";
            "Nested dictionaries"
        );

        `b
    );

    `question`answers`correct!(
        "Which operator is used to construct a linked-column mapping?";

        `a`b`c`d!(
            "!";
            "$";
            "?";
            "#"
        );

        `a
    );

    `question`answers`correct!(
        "After creating a linked column named cLink on disk, what additional step is required before loading the table?";

        `a`b`c`d!(
            "Update the .d file";
            "Compress the table";
            "Run .Q.dpft";
            "Re-key the table"
        );

        `a
    );

    `question`answers`correct!(
        "How does a linked column appear in meta?";

        `a`b`c`d!(
            "Its f field contains the referenced table name";
            "Its type becomes symbol";
            "It receives the grouped attribute";
            "It becomes keyed"
        );

        `a
    );

    `question`answers`correct!(
        "What is the result of calling value on a complex foreign-key column?";

        `a`b`c`d!(
            "The table mapping is removed but the integer indexes remain";
            "The integer indexes are converted back to symbols";
            "The referenced table is deleted";
            "Nothing changes"
        );

        `a
    );

    `question`answers`correct!(
        "Why are linked columns preferred over foreign keys for many HDB use cases?";

        `a`b`c`d!(
            "They work with unkeyed splayed tables";
            "They automatically compress data";
            "They eliminate enumerations";
            "They require less disk space"
        );

        `a
    );

    `question`answers`correct!(
        "Which function is used in the whitepaper to persist partitioned tables while using an alternate enumeration domain?";

        `a`b`c`d!(
            ".lc.dpft";
            ".Q.en";
            ".Q.dpft";
            ".Q.ens"
        );

        `a
    );

    `question`answers`correct!(
        "Which helper function creates an alternate-domain enumeration before writing data?";

        `a`b`c`d!(
            ".lc.en";
            ".Q.en";
            ".Q.dpft";
            ".Q.ens"
        );

        `a
    );

    `question`answers`correct!(
        "When linking tables across multiple databases, symbolic links are primarily used to:";

        `a`b`c`d!(
            "Expose remote tables inside the local database hierarchy";
            "Compress remote tables";
            "Synchronize sym files";
            "Replace IPC"
        );

        `a
    );

    `question`answers`correct!(
        "Why are custom enumeration domains used when linking multiple databases?";

        `a`b`c`d!(
            "To avoid sym-file clashes";
            "To reduce partition count";
            "To enable compression";
            "To eliminate linked columns"
        );

        `a
    );

    `question`answers`correct!(
        "In the whitepaper, trade rows are mapped to quote rows using which operation?";

        `a`b`c`d!(
            "As-of join";
            "Left join";
            "Cross join";
            "Union join"
        );

        `a
    );

    `question`answers`correct!(
        "Why are foreign-key queries typically much faster than equivalent left joins?";

        `a`b`c`d!(
            "The relationship already exists as an index lookup";
            "Left joins cannot use keyed tables";
            "Foreign keys automatically cache results";
            "Left joins always sort both tables"
        );

        `a
    );

    `question`answers`correct!(
        "A linked column referencing a row beyond the end of the referenced table returns:";

        `a`b`c`d!(
            "Null values";
            "'cast";
            "'type";
            "The final row"
        );

        `a
    );

    `question`answers`correct!(
        "Removing a row from a referenced keyed table can unexpectedly:";

        `a`b`c`d!(
            "Cause existing foreign keys to reference different rows";
            "Automatically rebuild all foreign keys";
            "Delete all child tables";
            "Invalidate only linked columns"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes linked columns?";

        `a`b`c`d!(
            "They store row-index mappings without enumeration";
            "They are enumerated symbol columns";
            "They require keyed tables";
            "They duplicate the referenced columns"
        );

        `a
    );

    `question`answers`correct!(
        "After adding a linked column file to a splayed table on disk, why must the table be reloaded?";

        `a`b`c`d!(
            "To refresh the in-memory schema";
            "To rebuild enumerations";
            "To recreate the partition";
            "To regenerate the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation fundamentally distinguishes a foreign key from a linked column?";

        `a`b`c`d!(
            "Foreign keys enumerate against a keyed table";
            "Foreign keys require on-disk storage";
            "Linked columns require enumerations";
            "Linked columns require keyed tables"
        );

        `a
    );

    `question`answers`correct!(
        "Why is modifying the order of rows in a referenced keyed table considered dangerous?";

        `a`b`c`d!(
            "Stored row references will now resolve to different records";
            "The sym file becomes compressed";
            "The table loses its key";
            "The foreign-key column becomes symbols"
        );

        `a
    )
 );
//====================================================================