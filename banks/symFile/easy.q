//====================================================================
//
// q-Quiz
//
// Topic      : Sym File
// Difficulty : Easy
//
//====================================================================
.quiz.symFile.easy:`symPurpose`symLocation`enumerationPurpose`enumOperator`enumExtend`type20`Qen`Qens`automaticLoad`integerStorage`backupSym`symbolBenefit`enumerationError`compressedSym`multipleDomains`dpft`splayRequirement`symbolComparison`stringPool`symVariable!
    (
    `question`answers`correct!(
        "What is the primary purpose of the sym file?";
        `a`b`c`d!(
            "Store distinct symbol values";
            "Store table schemas";
            "Store partition dates";
            "Store q source code"
        );
        `a
    );

    `question`answers`correct!(
        "Where is the sym file normally located?";
        `a`b`c`d!(
            "In the root of the HDB";
            "Inside every table directory";
            "Inside each partition";
            "In the log directory"
        );
        `a
    );

    `question`answers`correct!(
        "Why are symbols enumerated?";
        `a`b`c`d!(
            "To replace repeated symbols with integer references";
            "To sort tables";
            "To compress timestamps";
            "To create partitions"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator performs enumeration when every symbol already exists?";
        `a`b`c`d!(
            "$";
            "?";
            "#";
            "@"
        );
        `a
    );

    `question`answers`correct!(
        "Which operator extends an enumeration domain if new symbols are found?";
        `a`b`c`d!(
            "?";
            "$";
            "#";
            "!"
        );
        `a
    );

    `question`answers`correct!(
        "What is the q type of a 64-bit enumeration?";
        `a`b`c`d!(
            "20h";
            "11h";
            "10h";
            "19h"
        );
        `a
    );

    `question`answers`correct!(
        "Which function automatically enumerates against the sym domain?";
        `a`b`c`d!(
            ".Q.en";
            ".Q.dpft";
            ".Q.gc";
            ".Q.dd"
        );
        `a
    );

    `question`answers`correct!(
        "Which function enumerates against a custom domain?";
        `a`b`c`d!(
            ".Q.ens";
            ".Q.en";
            ".Q.dpft";
            ".Q.gc"
        );
        `a
    );

    `question`answers`correct!(
        "When an HDB is loaded, what happens to the sym file?";
        `a`b`c`d!(
            "It is automatically loaded into memory";
            "It is recreated";
            "It is compressed";
            "It is ignored"
        );
        `a
    );

    `question`answers`correct!(
        "How are enumerated symbols stored on disk?";
        `a`b`c`d!(
            "As integer indexes";
            "As strings";
            "As GUIDs";
            "As floats"
        );
        `a
    );

    `question`answers`correct!(
        "What is recommended after successfully updating the sym file?";
        `a`b`c`d!(
            "Back it up";
            "Compress it";
            "Delete it";
            "Rename it"
        );
        `a
    );

    `question`answers`correct!(
        "Why are symbols preferred over strings when values repeat frequently?";
        `a`b`c`d!(
            "They save memory and improve comparisons";
            "They compress timestamps";
            "They eliminate partitions";
            "They require no sym file"
        );
        `a
    );

    `question`answers`correct!(
        "Using $ with a symbol not present in the domain results in:";
        `a`b`c`d!(
            "A cast error";
            "A type error";
            "A rank error";
            "An index error"
        );
        `a
    );

    `question`answers`correct!(
        "Should the sym file itself ever be compressed?";
        `a`b`c`d!(
            "No";
            "Yes";
            "Only after EOD";
            "Only for intraday databases"
        );
        `a
    );

    `question`answers`correct!(
        "Why might a database contain multiple sym files?";
        `a`b`c`d!(
            "Different tables can use different enumeration domains";
            "Every partition requires one";
            "Each process creates one";
            "Each query creates one"
        );
        `a
    );

    `question`answers`correct!(
        "Which function writes partitioned tables while updating the sym file?";
        `a`b`c`d!(
            ".Q.dpft";
            ".Q.en";
            ".Q.gc";
            ".Q.view"
        );
        `a
    );

    `question`answers`correct!(
        "What must happen before splaying a table containing symbol columns?";
        `a`b`c`d!(
            "The symbols must be enumerated";
            "The table must be keyed";
            "The table must be sorted";
            "The symbols must be compressed"
        );
        `a
    );

    `question`answers`correct!(
        "Why are comparisons on enumerated symbols typically faster?";
        `a`b`c`d!(
            "Integer comparisons are faster than string comparisons";
            "Strings are compressed";
            "Symbols are sorted automatically";
            "GUID comparisons are used"
        );
        `a
    );

    `question`answers`correct!(
        "The sym file is essentially:";
        `a`b`c`d!(
            "A string pool of unique symbols";
            "A transaction log";
            "A partition index";
            "A schema definition"
        );
        `a
    );

    `question`answers`correct!(
        "After loading an HDB, the in-memory variable containing the symbol pool is:";
        `a`b`c`d!(
            "sym";
            ".Q.sym";
            ".z.sym";
            "`sym"
        );
        `a
    )
 );
//====================================================================