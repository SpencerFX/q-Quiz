//====================================================================
//
// q-Quiz
//
// Topic      : Foreign Keys
// Difficulty : Medium
//
// Based on the KX whitepaper "Foreign Keys and Linked Columns"
//
//====================================================================
.quiz.foreignKeys.medium:`foreignKeyCreation`schemaDefinition`compoundKey`compoundInsert`dotNotationChain`keyModification`foreignKeyMeta`removeKeysFunction`linkedColumnCreation`linkedColumnInsert`joinPerformance`linkedColumnsVsForeignKeys`enumerationFailure`foreignKeyOverwrite`linkedColumnStorage`foreignKeyLookup`compoundDotNotation`linkedColumnMissing`valueBehavior`keyRequirement!
    (
    `question`answers`correct!(
        "Which statement correctly creates a foreign key on an existing symbol column?";

        `a`b`c`d!(
            "update sym:`financials$sym from `trade";
            "update sym:`financials!sym from `trade";
            "update sym:financials$sym from trade";
            "update sym:`financials?sym from `trade"
        );

        `a
    );

    `question`answers`correct!(
        "Which schema correctly declares a foreign-key column?";

        `a`b`c`d!(
            "([]sym:`financials$();price:`float$())";
            "([]sym:`financials!();price:`float$())";
            "([]sym:`financials?();price:`float$())";
            "([]sym:`financials#();price:`float$())"
        );

        `a
    );

    `question`answers`correct!(
        "A compound foreign key is created by enumerating across:";

        `a`b`c`d!(
            "A list of symbols";
            "A flipped list of multiple columns";
            "A dictionary";
            "A keyed dictionary"
        );

        `b
    );

    `question`answers`correct!(
        "When inserting into a table containing a compound foreign key, what must also be supplied?";

        `a`b`c`d!(
            "Only the symbol";
            "The enumerated compound key";
            "Nothing—kdb+ always derives it";
            "The row number only"
        );

        `b
    );

    `question`answers`correct!(
        "Which expression demonstrates compound dot notation across multiple foreign keys?";

        `a`b`c`d!(
            "sym.exchangeID.ex";
            "sym->exchangeID->ex";
            "sym/exchangeID/ex";
            "exchangeID.sym.ex"
        );

        `a
    );

    `question`answers`correct!(
        "Deleting or reordering rows in a referenced keyed table primarily risks:";

        `a`b`c`d!(
            "Changing partition order";
            "Invalidating existing references";
            "Increasing compression";
            "Changing table attributes"
        );

        `b
    );

    `question`answers`correct!(
        "How does a foreign-key column appear in meta?";

        `a`b`c`d!(
            "Its f column contains the referenced table name";
            "Its t column changes to symbol";
            "It receives the grouped attribute";
            "It appears as a dictionary"
        );

        `a
    );

    `question`answers`correct!(
        "The removeKeys helper function primarily uses which function to remove mappings?";

        `a`b`c`d!(
            "value";
            "flip";
            "distinct";
            "raze"
        );

        `a
    );

    `question`answers`correct!(
        "Linked columns are created using which operator?";

        `a`b`c`d!(
            "!";
            "$";
            "?";
            "#"
        );

        `a
    );

    `question`answers`correct!(
        "Unlike foreign keys, linked columns allow insertion of:";

        `a`b`c`d!(
            "Only existing symbols";
            "Any integer index";
            "Only GUIDs";
            "Only enumerated values"
        );

        `b
    );

    `question`answers`correct!(
        "Why are foreign keys generally faster than repeated left joins?";

        `a`b`c`d!(
            "Relationships are precomputed";
            "Joins cannot use symbols";
            "Foreign keys automatically compress data";
            "Left joins require partitioning"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement correctly compares linked columns and foreign keys?";

        `a`b`c`d!(
            "Foreign keys require keyed tables; linked columns do not";
            "Linked columns require keyed tables; foreign keys do not";
            "Both require keyed tables";
            "Neither requires keyed tables"
        );

        `a
    );

    `question`answers`correct!(
        "Attempting to enumerate a value not present in the referenced keyed table produces:";

        `a`b`c`d!(
            "'cast";
            "'type";
            "'rank";
            "'elim"
        );

        `a
    );

    `question`answers`correct!(
        "What happens if a second foreign key is created on the same column?";

        `a`b`c`d!(
            "The previous mapping is replaced";
            "Both mappings coexist";
            "An error is thrown";
            "The table becomes keyed"
        );

        `a
    );

    `question`answers`correct!(
        "What is physically stored in a linked-column field?";

        `a`b`c`d!(
            "Row indexes";
            "Symbols";
            "Pointers to memory addresses";
            "GUID values"
        );

        `a
    );

    `question`answers`correct!(
        "When inserting into a simple foreign-key table, kdb+ performs what operation first?";

        `a`b`c`d!(
            "A lookup on the referenced keyed table";
            "A left join";
            "A sort";
            "A hash partition"
        );

        `a
    );

    `question`answers`correct!(
        "Which example correctly accesses data through two foreign-key relationships?";

        `a`b`c`d!(
            "sym.exchangeID.ex";
            "sym.exchangeID[ex]";
            "exchangeID.sym.ex";
            "sym->exchangeID.ex"
        );

        `a
    );

    `question`answers`correct!(
        "When a linked column references a row index that does not exist, queries return:";

        `a`b`c`d!(
            "Null values";
            "A cast error";
            "The first row";
            "The previous value"
        );

        `a
    );

    `question`answers`correct!(
        "Calling value on a complex foreign-key column removes:";

        `a`b`c`d!(
            "The table mapping while leaving integer indexes";
            "Both the mapping and the integer indexes";
            "Only the integer indexes";
            "Nothing"
        );

        `a
    );

    `question`answers`correct!(
        "What requirement must be satisfied before a table can be referenced by a simple foreign key?";

        `a`b`c`d!(
            "The table must be keyed";
            "The table must be partitioned";
            "The table must be grouped";
            "The table must be sorted by time"
        );

        `a
    )
 );
//====================================================================