//====================================================================
//
// q-Quiz
//
// Topic      : Intraday Writedown
// Difficulty : Hard
//
//====================================================================
.quiz.intradayWritedown.hard:`eodBottleneck`disksortOptimization`partitionedArchitecture`integerPartitionReason`lasttimeOptimization`genQueryOptimization`memoryStructure`writeToTmp`appendHdbPipeline`queryStrategy`partedAttribute`symEnumeration`bulkUpdates`qchkPurpose`wqRecovery`timerTradeoff`eodParallelism`partitionPerformance`writecountLogic`overallTradeoffs!
    (
    `question`answers`correct!(
        "Why is disksort the primary bottleneck during end-of-day processing in w.q?";

        `a`b`c`d!(
            "Entire temporary tables must be reorganized by symbol before becoming HDB partitions";
            "The tickerplant log must be replayed";
            "Every symbol must be re-enumerated";
            "Compression is performed after sorting"
        );

        `a
    );

    `question`answers`correct!(
        "Which optimization does disksort perform to avoid unnecessary work?";

        `a`b`c`d!(
            "It skips sorting columns whose values are already ordered or identical";
            "It compresses identical columns";
            "It partitions by timestamp";
            "It removes duplicate rows"
        );

        `a
    );

    `question`answers`correct!(
        "Why is partitioning the temporary database by integer significantly faster at end-of-day?";

        `a`b`c`d!(
            "Data is already grouped by symbol, eliminating the expensive table-wide sort";
            "Integer partitions compress better";
            "The HDB automatically reloads partitions";
            "Enumeration is no longer required"
        );

        `a
    );

    `question`answers`correct!(
        "Why are integer partitions chosen instead of symbol partitions?";

        `a`b`c`d!(
            "They directly correspond to HDB symbol enumeration values";
            "Symbols cannot be partition keys";
            "Integers require less RAM";
            "Symbols cannot be memory-mapped"
        );

        `a
    );

    `question`answers`correct!(
        "How does LASTTIME improve query performance?";

        `a`b`c`d!(
            "It allows disk queries to be skipped when the requested interval exists entirely in memory";
            "It identifies the newest HDB partition";
            "It determines when TP recovery finishes";
            "It controls timer frequency"
        );

        `a
    );

    `question`answers`correct!(
        "Why does genQuery execute functional selects separately for each requested symbol?";

        `a`b`c`d!(
            "Because each symbol is stored independently in both memory and the temporary partition";
            "To improve compression";
            "To avoid enumeration";
            "Because qSQL cannot query multiple symbols"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary advantage of storing the in-memory portion as .mem[table;sym]?";

        `a`b`c`d!(
            "Memory organization mirrors the temporary partition layout";
            "It reduces symbol enumeration";
            "It eliminates grouped attributes";
            "It automatically creates HDB partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why does writeToTmp immediately reapply the sorted attribute after deleting written rows?";

        `a`b`c`d!(
            "To preserve efficient ordered access to the remaining in-memory data";
            "To reduce disk usage";
            "To compress the table";
            "To rebuild the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Which sequence best describes the partitioned end-of-day pipeline?";

        `a`b`c`d!(
            "Flush memory → append temporary partitions into HDB → reload HDB → clear temporary directory";
            "Reload HDB → flush memory → compress → enumerate";
            "Compress → reload TP → append HDB";
            "Replay TP log → reload gateway → clear RDB"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, when should aggregation usually occur when querying partitioned writedown data?";

        `a`b`c`d!(
            "After combining the raw memory and disk results";
            "Before reading from disk";
            "Inside every individual partition";
            "Only after HDB reload"
        );

        `a
    );

    `question`answers`correct!(
        "Why is the `p attribute applied only after data reaches the HDB?";

        `a`b`c`d!(
            "The final HDB partition must support efficient symbol-based lookups";
            "Temporary directories cannot contain attributes";
            "`p automatically compresses data";
            "`p is required for enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Why must symbols be enumerated before writing into the temporary partitioned database?";

        `a`b`c`d!(
            "The partition identifiers correspond directly to HDB symbol enumeration values";
            "Enumeration is required by disksort";
            "Compression only accepts enumerated symbols";
            "Grouped attributes require enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the updated upd function group incoming updates by sym before insertion?";

        `a`b`c`d!(
            "To efficiently distribute bulk updates into each symbol's in-memory table";
            "To improve compression ratios";
            "To reduce TP latency";
            "To rebuild the HDB partition"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .Q.chk called whenever a new temporary partition or table is created?";

        `a`b`c`d!(
            "To populate missing partition/table structure so the temporary database remains valid";
            "To compress the partition";
            "To replay TP logs";
            "To enumerate symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the default recovery strategy delete the temporary writedown directory?";

        `a`b`c`d!(
            "Recovering from the tickerplant log is simpler than determining what has already been committed";
            "Temporary partitions cannot be recovered";
            "The HDB already contains every row";
            "Enumeration becomes invalid after restart"
        );

        `a
    );

    `question`answers`correct!(
        "What tradeoff does timer-based writedown introduce compared with row-count-based flushing?";

        `a`b`c`d!(
            "It reduces disk overhead but keeps a variable amount of recent data in memory";
            "It removes the need for HDB reload";
            "It guarantees constant memory usage";
            "It eliminates sorting"
        );

        `a
    );

    `question`answers`correct!(
        "The whitepaper suggests that which end-of-day task could be moved into a separate process?";

        `a`b`c`d!(
            "Sorting and moving temporary partitions into the HDB";
            "Tickerplant logging";
            "Gateway queries";
            "Symbol enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Compared with w.q, why does the partitioned writedown solution produce dramatically faster disk queries?";

        `a`b`c`d!(
            "Queries touch only the symbol-specific partition instead of scanning an entire unsorted table";
            "The data is fully compressed";
            "It uses keyed tables";
            "The gateway caches every result"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the writecount function?";

        `a`b`c`d!(
            "Determine exactly how many rows should be flushed while leaving the configured minimum in memory";
            "Count rows written to the HDB";
            "Calculate compression ratios";
            "Determine TP log offsets"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best summarizes the design philosophy of the partitioned intraday writedown approach?";

        `a`b`c`d!(
            "Increase implementation complexity to substantially improve end-of-day processing and intraday query performance";
            "Optimize only for compression ratio";
            "Replace both the RDB and HDB";
            "Eliminate the need for symbol enumeration"
        );

        `a
    )
 );
//====================================================================