//====================================================================
//
// q-Quiz
//
// Topic      : Tables
// Difficulty : Hard
//
//====================================================================
.quiz.tables.hard:`flipRepresentation`keyedInternal`splayedTable`partitionedTable`memoryMapped`enumeration`symFile`columnStore`compression`attributeChoice`groupAttribute`sortedAttribute`partedAttribute`uniqueAttribute`copyOnWrite`setSave`columnAddition`diskRead`partitionPruning`cacheLocality!
    (
    `question`answers`correct!(
        "Internally, an unkeyed table is represented as:";
        `a`b`c`d!(
            "A flipped dictionary";
            "A keyed table";
            "A list of rows";
            "A nested dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "Internally, a keyed table is represented as:";
        `a`b`c`d!(
            "A dictionary whose keys and values are tables";
            "A flip of a dictionary";
            "A list of dictionaries";
            "Two independent tables"
        );
        `a
    );

    `question`answers`correct!(
        "What is a splayed table?";
        `a`b`c`d!(
            "A table stored with each column in a separate file";
            "A compressed table";
            "A keyed table";
            "A partitioned table"
        );
        `a
    );

    `question`answers`correct!(
        "Why are HDBs commonly partitioned by date?";
        `a`b`c`d!(
            "Most analytical queries are time-bounded";
            "Dates compress better";
            "Dates are always unique";
            "Partitioning is required by q"
        );
        `a
    );

    `question`answers`correct!(
        "Why can HDB tables be much larger than RAM?";
        `a`b`c`d!(
            "They are memory mapped";
            "They are automatically compressed";
            "They stream from CSV";
            "They use swap files"
        );
        `a
    );

    `question`answers`correct!(
        "Why are symbol columns commonly enumerated in an HDB?";
        `a`b`c`d!(
            "To reduce storage and accelerate comparisons";
            "To sort the table";
            "To make symbols mutable";
            "To reduce timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "What is stored in the sym file?";
        `a`b`c`d!(
            "The enumerated symbol dictionary";
            "Table schemas";
            "Partition metadata";
            "Attributes"
        );
        `a
    );

    `question`answers`correct!(
        "Why are column stores well suited to analytics?";
        `a`b`c`d!(
            "Only required columns need to be read";
            "Rows are stored together";
            "Joins disappear";
            "Everything is cached"
        );
        `a
    );

    `question`answers`correct!(
        "Why is compression especially effective on column-oriented data?";
        `a`b`c`d!(
            "Adjacent values are often similar";
            "Rows repeat frequently";
            "Every table is keyed";
            "IPC compresses automatically"
        );
        `a
    );

    `question`answers`correct!(
        "Which attribute is appropriate for a sorted timestamp column?";
        `a`b`c`d!(
            "`s";
            "`g";
            "`u";
            "`p"
        );
        `a
    );

    `question`answers`correct!(
        "What does the grouped (`g) attribute primarily optimize?";
        `a`b`c`d!(
            "Equality searches";
            "Sorting";
            "Compression";
            "As-of joins"
        );
        `a
    );

    `question`answers`correct!(
        "When should the parted (`p) attribute be applied?";
        `a`b`c`d!(
            "When equal values occur in contiguous blocks";
            "Whenever a column is unique";
            "Only on timestamps";
            "Only on symbols"
        );
        `a
    );

    `question`answers`correct!(
        "Which attribute requires every value to be unique?";
        `a`b`c`d!(
            "`u";
            "`g";
            "`s";
            "`p"
        );
        `a
    );

    `question`answers`correct!(
        "Why is assigning one large table to another variable inexpensive?";
        `a`b`c`d!(
            "q uses copy-on-write semantics";
            "The table is compressed";
            "The table is duplicated lazily on disk";
            "Tables are immutable"
        );
        `a
    );

    `question`answers`correct!(
        "What is the difference between set and save?";
        `a`b`c`d!(
            "set writes one object, save writes an entire namespace";
            "They are identical";
            "save only writes tables";
            "set only writes symbols"
        );
        `a
    );

    `question`answers`correct!(
        "Adding a new column to a very large table generally:";
        `a`b`c`d!(
            "Requires allocating storage for that column";
            "Only changes metadata";
            "Is always in-place";
            "Never allocates memory"
        );
        `a
    );

    `question`answers`correct!(
        "Why are HDB queries often fast even on huge datasets?";
        `a`b`c`d!(
            "Only required columns and partitions are accessed";
            "Everything is loaded into RAM";
            "All tables are keyed";
            "Every query is parallel"
        );
        `a
    );

    `question`answers`correct!(
        "Partition pruning improves performance because:";
        `a`b`c`d!(
            "Irrelevant partitions are skipped";
            "Tables become keyed";
            "Symbols are compressed";
            "Rows are reordered"
        );
        `a
    );

    `question`answers`correct!(
        "Why do column stores often have excellent CPU cache locality?";
        `a`b`c`d!(
            "Values from the same column are stored contiguously";
            "Rows are contiguous";
            "Tables are keyed";
            "Everything fits in cache"
        );
        `a
    );

    `question`answers`correct!(
        "Which design choice contributes most to kdb+'s analytical performance?";
        `a`b`c`d!(
            "Column-oriented storage with vector operations";
            "Row-oriented storage";
            "Linked lists";
            "Recursive execution"
        );
        `a
    )
 );
//====================================================================