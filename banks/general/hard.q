.quiz.general.hard:`memoryLayout`copyReference`symbolLeak`attributeChoice`attributeInvalid`ajPerformance`ajVsLj`functionalSQL`parseTree`parseEval`enumerationReason`peachOverhead`secondaryThreads`tickerplantLogging`rdbVsHdb`gatewayPurpose`hdbPartitions`symFile`ipcSyncAsync`serialization`columnStore`cacheLocality`compression`multithreadedPrimitive!
    (  
    `question`answers`correct!(
        "Why is q considered a column-oriented database?";
        `a`b`c`d!(
            "Tables are stored row-by-row";
            "Each column is stored independently";
            "Columns are compressed into JSON";
            "Rows are dictionaries"
        );
        `b
    );

    `question`answers`correct!(
        "Why is assigning one variable to another usually inexpensive?";
        `a`b`c`d!(
            "Because q compresses the object";
            "Because q uses reference counting and copy-on-write";
            "Because q always copies lazily to disk";
            "Because variables are pointers in SQL"
        );
        `b
    );

    `question`answers`correct!(
        "Why can converting arbitrary user input to symbols eventually exhaust memory?";
        `a`b`c`d!(
            "Symbols are never compressed";
            "The symbol intern table only grows";
            "Symbols cannot be garbage collected individually";
            "Both b and c"
        );
        `d
    );

    `question`answers`correct!(
        "Which attribute is most appropriate for a timestamp column sorted in ascending order?";
        `a`b`c`d!(
            "`g";
            "`u";
            "`s";
            "`p"
        );
        `c
    );

    `question`answers`correct!(
        "What happens if an incorrect attribute is applied to data that violates its requirements?";
        `a`b`c`d!(
            "q automatically fixes the data";
            "Queries may return incorrect results";
            "The attribute is ignored";
            "The process terminates"
        );
        `b
    );

    `question`answers`correct!(
        "Why must the right table of an aj normally be sorted by the as-of column?";
        `a`b`c`d!(
            "To enable binary/linear merge searching";
            "To compress memory";
            "To allow parallel execution";
            "To enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary semantic difference between lj and aj?";
        `a`b`c`d!(
            "lj matches exact keys, aj matches the most recent prior row";
            "aj is parallel";
            "lj only works on keyed tables";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "Why is functional SQL useful?";
        `a`b`c`d!(
            "It allows SQL queries to be built dynamically";
            "It is faster than select";
            "It avoids parsing";
            "It enables compression"
        );
        `a
    );

    `question`answers`correct!(
        "What does parse return?";
        `a`b`c`d!(
            "A result";
            "A parse tree";
            "Compiled machine code";
            "A dictionary"
        );
        `b
    );

    `question`answers`correct!(
        "What is the relationship between parse and value?";
        `a`b`c`d!(
            "parse evaluates expressions";
            "value evaluates parsed expressions";
            "They are identical";
            "parse executes SQL"
        );
        `b
    );

    `question`answers`correct!(
        "Why are HDB symbol columns enumerated?";
        `a`b`c`d!(
            "Reduce storage and accelerate comparisons";
            "Increase precision";
            "Allow timestamps";
            "Avoid attributes"
        );
        `a
    );

    `question`answers`correct!(
        "When can peach be slower than each?";
        `a`b`c`d!(
            "When the work per task is too small";
            "Never";
            "Only on Linux";
            "Only on tables"
        );
        `a
    );

    `question`answers`correct!(
        "Secondary threads in q are primarily used for:";
        `a`b`c`d!(
            "GUI rendering";
            "Parallel execution of supported operations";
            "IPC";
            "Memory allocation"
        );
        `b
    );

    `question`answers`correct!(
        "Why does a tickerplant maintain a transaction log?";
        `a`b`c`d!(
            "For replay and recovery";
            "To compress messages";
            "To improve joins";
            "To accelerate IPC"
        );
        `a
    );

    `question`answers`correct!(
        "Why are recent updates typically kept in an RDB rather than written immediately to an HDB?";
        `a`b`c`d!(
            "The HDB is optimized for historical, mostly read-only storage";
            "HDBs cannot store today's data";
            "RDBs are compressed";
            "HDBs cannot be queried"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary role of a gateway process?";
        `a`b`c`d!(
            "Route client queries to the appropriate process";
            "Store historical data";
            "Receive market data";
            "Compress partitions"
        );
        `a
    );

    `question`answers`correct!(
        "Why are HDBs commonly partitioned by date?";
        `a`b`c`d!(
            "Most financial queries are time-bounded";
            "Dates compress better";
            "Symbols require dates";
            "IPC requires partitions"
        );
        `a
    );

    `question`answers`correct!(
        "What information is stored in the sym file?";
        `a`b`c`d!(
            "Enumerated symbol values";
            "Schemas";
            "Attributes";
            "IPC handles"
        );
        `a
    );

    `question`answers`correct!(
        "What is the difference between synchronous and asynchronous IPC?";
        `a`b`c`d!(
            "Synchronous waits for a reply";
            "Asynchronous waits for a reply";
            "They are identical";
            "Only synchronous sends data"
        );
        `a
    );

    `question`answers`correct!(
        "Why is q's IPC serialization highly efficient?";
        `a`b`c`d!(
            "It serializes native q data structures directly";
            "It converts everything to JSON";
            "It uses XML";
            "It compresses every message"
        );
        `a
    );

    `question`answers`correct!(
        "Why are column stores often faster for analytical workloads?";
        `a`b`c`d!(
            "Only required columns are read";
            "Rows are compressed";
            "Joins disappear";
            "Everything is cached"
        );
        `a
    );

    `question`answers`correct!(
        "Why do column stores often have better CPU cache locality for analytics?";
        `a`b`c`d!(
            "Values from one column are stored contiguously";
            "Rows are shorter";
            "Tables are keyed";
            "Symbols are interned"
        );
        `a
    );

    `question`answers`correct!(
        "Why is compression especially effective on column-oriented databases?";
        `a`b`c`d!(
            "Adjacent values in a column tend to be similar";
            "Rows are duplicated";
            "Tables are keyed";
            "IPC compresses automatically"
        );
        `a
    );

    `question`answers`correct!(
        "Which type of q operation benefits most from secondary threads?";
        `a`b`c`d!(
            "Large vector operations supported by the runtime";
            "Every q function";
            "IPC";
            "Parsing source code"
        );
        `a
    )
 );