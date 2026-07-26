//====================================================================
//
// q-Quiz
//
// Topic      : RDB
// Difficulty : Hard
//
//====================================================================
.quiz.rdb.hard:`lateTicks`recovery`multiRdb`snapshot`deduplication`gatewayMerge`secondaryThreads`partitioning`memoryFragmentation`scaling`ordering`consistency!
    (
    `question`answers`correct!(

        "How should an RDB typically handle late-arriving ticks?";

        `a`b`c`d!(
            "Insert while preserving timestamp ordering";
            "Discard all late ticks";
            "Write directly to the HDB";
            "Restart the tickerplant"
        );

        `a
    );

    `question`answers`correct!(
        "After an RDB failure, what is the preferred recovery mechanism?";

        `a`b`c`d!(
            "Replay the TP transaction log";
            "Restore yesterday's HDB";
            "Reload CSV files";
            "Restart the gateway"
        );

        `a
    );

    `question`answers`correct!(
        "Why might a system deploy multiple RDBs?";

        `a`b`c`d!(
            "Distribute load across independent subscribers";
            "Increase TP logging";
            "Reduce symbol count";
            "Replace the HDB"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main purpose of periodically snapshotting an RDB?";

        `a`b`c`d!(
            "Reduce replay time after failure";
            "Improve compression";
            "Increase query latency";
            "Avoid enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Why is tick deduplication sometimes necessary?";

        `a`b`c`d!(
            "Prevent duplicate market events";
            "Reduce timestamp precision";
            "Improve CSV loading";
            "Reduce partition count"
        );

        `a
    );

    `question`answers`correct!(
        "Why do gateways merge results from the RDB and HDB?";

        `a`b`c`d!(
            "Provide a continuous historical view";
            "Compress market data";
            "Reduce IPC";
            "Restart subscribers"
        );

        `a
    );

    `question`answers`correct!(
        "When using secondary threads in an RDB, they should generally:";

        `a`b`c`d!(
            "Avoid modifying shared tables directly";
            "Replace IPC";
            "Write directly into TP logs";
            "Handle socket connections"
        );

        `a
    );

    `question`answers`correct!(
        "What is one benefit of partitioning data across multiple RDB processes?";

        `a`b`c`d!(
            "Higher throughput and scalability";
            "Smaller timestamps";
            "Automatic compression";
            "Fewer symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Memory fragmentation in an RDB primarily affects:";

        `a`b`c`d!(
            "Long-running performance";
            "Timestamp precision";
            "Symbol enumeration";
            "IPC protocol compatibility"
        );

        `a
    );

    `question`answers`correct!(
        "Which architecture best supports millions of market updates per second?";

        `a`b`c`d!(
            "Multiple feedhandlers, TP, and distributed RDBs";
            "One gateway only";
            "One HDB only";
            "CSV-based ingestion"
        );

        `a
    );

    `question`answers`correct!(
        "Why is maintaining message ordering important in an RDB?";

        `a`b`c`d!(
            "Market state depends on event sequence";
            "Compression requires it";
            "Enumeration requires it";
            "Gateways require sorted symbols"
        );

        `a
    );

    `question`answers`correct!(
        "The greatest challenge when horizontally scaling an RDB is maintaining:";

        `a`b`c`d!(
            "Consistency across subscribers";
            "CSV compatibility";
            "Timestamp formatting";
            "Table names"
        );

        `a
    )
 );