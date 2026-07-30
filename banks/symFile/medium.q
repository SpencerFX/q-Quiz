//====================================================================
//
// q-Quiz
//
// Topic      : Sym File
// Difficulty : Medium
//
//====================================================================
.quiz.symFile.medium:`enumVsExtend`QensPurpose`dpftEnumeration`dpftsEnumeration`copyDatabase`symLoaded`guidChoice`stringChoice`symbolChoice`j12Purpose`x12Purpose`multipleDomains`enumFailure`symGrowth`bloatCause`reenumeration`loadedSym`compressedColumns`enumComparison`domainName!
    (
    `question`answers`correct!(
        "When should ? (Enum Extend) be used instead of $ (Enum)?";
        `a`b`c`d!(
            "When new symbols may need to be added to the domain";
            "When sorting an enumerated column";
            "When compressing a sym file";
            "When removing unused symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What additional capability does .Q.ens provide over .Q.en?";
        `a`b`c`d!(
            "It allows enumeration against a specified domain";
            "It automatically compresses the table";
            "It skips enumeration";
            "It converts symbols to strings"
        );
        `a
    );

    `question`answers`correct!(
        "Before calling .Q.dpft, what should already be loaded into memory?";
        `a`b`c`d!(
            "The destination sym file";
            "The source database";
            "Every partition";
            "The transaction log"
        );
        `a
    );

    `question`answers`correct!(
        "Which function allows partitioned writes using a custom enumeration domain?";
        `a`b`c`d!(
            ".Q.dpfts";
            ".Q.dpft";
            ".Q.en";
            ".Q.gc"
        );
        `a
    );

    `question`answers`correct!(
        "Why can't partition directories simply be copied between databases?";
        `a`b`c`d!(
            "The enumeration indexes may refer to different sym files";
            "Partition names must always change";
            "Tables become keyed automatically";
            "IPC cannot transfer partitions"
        );
        `a
    );

    `question`answers`correct!(
        "What happens if .Q.en is called without an existing sym file?";
        `a`b`c`d!(
            "A new sym file is created";
            "A cast error occurs";
            "Enumeration is skipped";
            "The table becomes keyed"
        );
        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, GUIDs are preferable to character IDs because:";
        `a`b`c`d!(
            "They are smaller and much faster for equality comparisons";
            "They automatically enumerate";
            "They compress better than symbols";
            "They eliminate the need for IPC"
        );
        `a
    );

    `question`answers`correct!(
        "Strings are generally preferred over symbols when:";
        `a`b`c`d!(
            "Values rarely repeat and are unlikely to be filtered";
            "Values repeat frequently";
            "The column is used in joins";
            "The data must be partitioned"
        );
        `a
    );

    `question`answers`correct!(
        "Which datatype is recommended for frequently repeated ticker symbols?";
        `a`b`c`d!(
            "symbol";
            "string";
            "guid";
            "char"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of .Q.j12?";
        `a`b`c`d!(
            "Encode identifiers into base64";
            "Decode base64";
            "Compress the sym file";
            "Enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of .Q.x12?";
        `a`b`c`d!(
            "Decode base64 back into the original identifier";
            "Encode GUIDs";
            "Create enumerations";
            "Compress symbols"
        );
        `a
    );

    `question`answers`correct!(
        "Why might multiple sym files exist in one database?";
        `a`b`c`d!(
            "Different tables may enumerate against different domains";
            "Every partition requires its own";
            "Every process creates one";
            "Each table column requires one"
        );
        `a
    );

    `question`answers`correct!(
        "Attempting to enumerate using $ when the value is not in the domain results in:";
        `a`b`c`d!(
            "A cast error";
            "A type error";
            "A rank error";
            "A length error"
        );
        `a
    );

    `question`answers`correct!(
        "A rapidly growing sym file may indicate:";
        `a`b`c`d!(
            "Columns were incorrectly chosen as symbols";
            "Too many partitions";
            "IPC latency";
            "Compressed tables"
        );
        `a
    );

    `question`answers`correct!(
        "Which situation commonly causes sym file bloat?";
        `a`b`c`d!(
            "Large numbers of symbols that are no longer used";
            "Too many integer columns";
            "Tables with timestamps";
            "Using GUID columns"
        );
        `a
    );

    `question`answers`correct!(
        "Compacting a bloated sym file generally requires:";
        `a`b`c`d!(
            "Unenumerating and then re-enumerating the data";
            "Compressing the sym file";
            "Deleting every partition";
            "Rebuilding every table schema"
        );
        `a
    );

    `question`answers`correct!(
        "When .Q.en successfully updates the sym file, what else is updated automatically?";
        `a`b`c`d!(
            "The in-memory sym variable";
            "Every partition";
            "The transaction log";
            "The HDB schema"
        );
        `a
    );

    `question`answers`correct!(
        "Which attribute often helps columns with long runs of identical values compress well?";
        `a`b`c`d!(
            "`p#";
            "`s#";
            "`u#";
            "`g#"
        );
        `a
    );

    `question`answers`correct!(
        "Why are equality filters on enumerated symbols generally faster?";
        `a`b`c`d!(
            "Integer comparisons are performed instead of string comparisons";
            "The sym file is compressed";
            "The symbols are sorted";
            "Each query loads fewer partitions"
        );
        `a
    );

    `question`answers`correct!(
        "In an enumeration such as `sym$values, the domain name is:";
        `a`b`c`d!(
            "`sym";
            "values";
            "symbol";
            "type 20h"
        );
        `a
    )
 );
//====================================================================