//====================================================================
//
// q-Quiz
//
// Topic      : Sym File
// Difficulty : Hard
//
//====================================================================
.quiz.symFile.hard:`enum64Bit`enumFileFormat`domainLimit`reenumerateMigration`dpftSym`compressedSym`enumIndex`symbolNormalization`multipleDomainsDesign`enumPerformance`enumStorage`symRewrite`threadRewrite`groupAttribute`enumType20`qenBackup`enumSafety`enumComparisonCost`encodedIdentifiers`maintenanceStrategy!
    (
    `question`answers`correct!(
        "Beginning with kdb+ 3.6, what type is used for all 64-bit enumerations regardless of domain?";
        `a`b`c`d!(
            "20h";
            "19h";
            "11h";
            "76h"
        );
        `a
    );

    `question`answers`correct!(
        "Why can't enum files created in kdb+ 3.6+ be read by older versions?";
        `a`b`c`d!(
            "The on-disk enumeration format changed to support 64-bit indexes";
            "The sym file is automatically compressed";
            "Symbols are stored as GUIDs";
            "Enumeration domains are encrypted"
        );
        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, how many practical 64-bit enumeration domains can exist?";
        `a`b`c`d!(
            "There is no practical limit";
            "256";
            "65536";
            "One per database"
        );
        `a
    );

    `question`answers`correct!(
        "When migrating tables between databases, why must data be re-enumerated?";
        `a`b`c`d!(
            "Enumeration indexes reference different symbol domains";
            "Partition names always change";
            "GUID values expire";
            "Compression attributes differ"
        );
        `a
    );

    `question`answers`correct!(
        "Why must the destination sym file already be loaded before using .Q.dpft?";
        `a`b`c`d!(
            "Otherwise a new enumeration domain may be created";
            "Otherwise partitions cannot be written";
            "Otherwise the table becomes keyed";
            "Otherwise the IPC connection closes"
        );
        `a
    );

    `question`answers`correct!(
        "What error occurs if you attempt to append to a compressed sym file?";
        `a`b`c`d!(
            "no append to zipped enums";
            "cast";
            "type";
            "rank"
        );
        `a
    );

    `question`answers`correct!(
        "What is physically stored in an enumerated column on disk?";
        `a`b`c`d!(
            "Integer indexes into the symbol pool";
            "Character strings";
            "GUID values";
            "Pointers to memory addresses"
        );
        `a
    );

    `question`answers`correct!(
        "Enumeration primarily improves storage efficiency because:";
        `a`b`c`d!(
            "Repeated symbols are stored only once";
            "Strings are automatically compressed";
            "Columns become partitioned";
            "All symbols become GUIDs"
        );
        `a
    );

    `question`answers`correct!(
        "When would multiple enumeration domains be an appropriate design choice?";
        `a`b`c`d!(
            "Different tables have independent symbol universes";
            "Every partition should have one";
            "Every process should create one";
            "Every symbol column requires one"
        );
        `a
    );

    `question`answers`correct!(
        "Why are equality filters on enumerated columns generally faster than on strings?";
        `a`b`c`d!(
            "Integer comparisons are cheaper than string comparisons";
            "Symbols are automatically cached";
            "The sym file is always compressed";
            "Enumerated columns are sorted"
        );
        `a
    );

    `question`answers`correct!(
        "What is the main storage benefit of enumeration?";
        `a`b`c`d!(
            "Variable-length strings become fixed-width integer references";
            "Columns become compressed automatically";
            "Only unique rows are stored";
            "Tables become keyed"
        );
        `a
    );

    `question`answers`correct!(
        "What is the first major step when compacting a bloated sym file?";
        `a`b`c`d!(
            "Move the existing sym file and create a new empty one";
            "Delete every partition";
            "Compress the database";
            "Convert symbols to strings"
        );
        `a
    );

    `question`answers`correct!(
        "The multithreaded sym rewrite sacrifices which attribute because it is unsupported in threads?";
        `a`b`c`d!(
            "`g#";
            "`p#";
            "`u#";
            "`s#"
        );
        `a
    );

    `question`answers`correct!(
        "After a multithreaded sym rewrite, which attribute may need to be reapplied?";
        `a`b`c`d!(
            "`g#";
            "`u#";
            "`p#";
            "`s#"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement about type 20h is correct in kdb+ 3.6+?";
        `a`b`c`d!(
            "It represents every 64-bit enumeration regardless of domain";
            "It represents only the sym domain";
            "It represents GUID columns";
            "It represents compressed symbols"
        );
        `a
    );

    `question`answers`correct!(
        "Why does the whitepaper recommend backing up the sym file immediately after .Q.en?";
        `a`b`c`d!(
            "Because the enumeration domain has successfully changed";
            "Because partitions are immutable";
            "Because compression removes old symbols";
            "Because IPC overwrites the sym file"
        );
        `a
    );

    `question`answers`correct!(
        "What is the safest way to expand an enumeration domain programmatically?";
        `a`b`c`d!(
            "Use Enum Extend (?)";
            "Use Enum ($)";
            "Append directly to the sym file";
            "Modify the integer indexes"
        );
        `a
    );

    `question`answers`correct!(
        "Why can integer comparisons significantly outperform string comparisons?";
        `a`b`c`d!(
            "They compare fixed-width numeric values rather than variable-length text";
            "Integers are automatically compressed";
            "Integers are always sorted";
            "They bypass enumeration"
        );
        `a
    );

    `question`answers`correct!(
        "Why does the whitepaper recommend encoding identifiers such as CUSIPs using .Q.j12?";
        `a`b`c`d!(
            "To avoid filling the sym file with millions of one-off symbols";
            "To automatically enumerate identifiers";
            "To reduce partition count";
            "To create GUID values"
        );
        `a
    );

    `question`answers`correct!(
        "Which long-term maintenance practice is recommended for large production HDBs?";
        `a`b`c`d!(
            "Regularly monitor sym growth and investigate unexpected expansion";
            "Compress the sym file after every EOD";
            "Delete and recreate the sym file weekly";
            "Always enumerate against multiple domains"
        );
        `a
    )
 );
//====================================================================