.quiz.general.medium:`evaluationOrder`copyOnWrite`attributeSorted`attributeParted`attributeGrouped`attributeUnique`ajRequirement`execBy`functionalSQL`projection`scanVsOver`peach`enumeration`flipInternal`keyedTableInternal`parseValue`upsert`insert`symbolLeak`wherePerformance!
   (
    `question`answers`correct!(
        "How are expressions evaluated in q?";
        `a`b`c`d!(
            "Left to right";
            "Right to left";
            "Highest precedence first";
            "Random order"
        );
        `b
    );

    `question`answers`correct!(
        "What does copy-on-write mean in q?";
        `a`b`c`d!(
            "Every assignment copies data";
            "Objects are copied only when modified";
            "Everything is immutable";
            "Tables are never copied"
        );
        `b
    );

    `question`answers`correct!(
        "What is the primary benefit of the sorted (`s) attribute?";
        `a`b`c`d!(
            "Reduces memory";
            "Allows binary search";
            "Compresses symbols";
            "Improves IPC"
        );
        `b
    );

    `question`answers`correct!(
        "When should the parted (`p) attribute be applied?";
        `a`b`c`d!(
            "To randomly ordered data";
            "To grouped values stored contiguously";
            "Only to timestamps";
            "Only to keyed tables"
        );
        `b
    );

    `question`answers`correct!(
        "What does the grouped (`g) attribute optimize?";
        `a`b`c`d!(
            "Arithmetic";
            "Equality lookups";
            "Sorting";
            "IPC serialization"
        );
        `b
    );

    `question`answers`correct!(
        "What does the unique (`u) attribute indicate?";
        `a`b`c`d!(
            "Values are sorted";
            "Every value is distinct";
            "Values are compressed";
            "Values are enumerated"
        );
        `b
    );

    `question`answers`correct!(
        "For best performance, what should be true of the right table in an aj?";
        `a`b`c`d!(
            "Sorted by the as-of column";
            "Keyed by every column";
            "Compressed";
            "Grouped by symbol only"
        );
        `a
    );

    `question`answers`correct!(
        "What does 'exec price by sym from trade' return?";
        `a`b`c`d!(
            "A table";
            "A dictionary";
            "A keyed table";
            "A symbol vector"
        );
        `b
    );

    `question`answers`correct!(
        "What is functional SQL primarily used for?";
        `a`b`c`d!(
            "Building queries programmatically";
            "Replacing joins";
            "Compressing tables";
            "Parallel execution"
        );
        `a
    );

    `question`answers`correct!(
        "What is produced by partially applying a function?";
        `a`b`c`d!(
            "A projection";
            "A closure";
            "An iterator";
            "A dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "What is the difference between over (/) and scan (\\)?";
        `a`b`c`d!(
            "None";
            "Scan returns every intermediate result";
            "Over is parallel";
            "Scan only works on tables"
        );
        `b
    );

    `question`answers`correct!(
        "When can peach improve performance?";
        `a`b`c`d!(
            "When work is independent and sufficiently large";
            "Always";
            "Only on joins";
            "Only on tables"
        );
        `a
    );

    `question`answers`correct!(
        "Why are symbols enumerated in an HDB?";
        `a`b`c`d!(
            "To reduce storage and improve joins";
            "To improve floating point precision";
            "To sort timestamps";
            "To remove duplicates"
        );
        `a
    );

    `question`answers`correct!(
        "Internally, what is a table?";
        `a`b`c`d!(
            "A flipped dictionary";
            "A keyed table";
            "A symbol list";
            "A matrix"
        );
        `a
    );

    `question`answers`correct!(
        "Internally, what is a keyed table?";
        `a`b`c`d!(
            "A dictionary whose keys and values are tables";
            "A list";
            "A matrix";
            "A nested dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "What is the difference between parse and value?";
        `a`b`c`d!(
            "parse evaluates code";
            "value parses text";
            "parse builds a parse tree, value evaluates";
            "There is no difference"
        );
        `c
    );

    `question`answers`correct!(
        "What does upsert do on a keyed table?";
        `a`b`c`d!(
            "Always appends";
            "Updates existing keys or inserts new ones";
            "Deletes duplicates";
            "Sorts the table"
        );
        `b
    );

    `question`answers`correct!(
        "What is insert primarily used for?";
        `a`b`c`d!(
            "Appending rows";
            "Updating rows";
            "Sorting tables";
            "Joining tables"
        );
        `a
    );

    `question`answers`correct!(
        "Why can converting arbitrary user input to symbols be dangerous?";
        `a`b`c`d!(
            "Symbols cannot be compared";
            "The symbol table continually grows";
            "Symbols become unsorted";
            "IPC cannot serialize them"
        );
        `b
    );

    `question`answers`correct!(
        "Why is 'where sym=`IBM' typically faster than 'where sym in enlist `IBM' ?";
        `a`b`c`d!(
            "It avoids constructing a temporary list";
            "It uses parallelism";
            "It compresses symbols";
            "It automatically keys the table"
        );
        `a
    )
 )