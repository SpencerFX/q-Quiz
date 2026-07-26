//====================================================================
//
// q-Quiz
//
// Topic      : RDB
// Difficulty : Medium
//
//====================================================================
.quiz.rdb.medium:`replayLog`uUpd`batching`enumeration`eodSave`queryMerge`subscription`memoryGrowth`idbDifference`asyncIPC`schema`tickFlow!
    (
    `question`answers`correct!(

        "Why does an RDB replay the tickerplant log after restarting?";

        `a`b`c`d!(
            "To rebuild its in-memory state";
            "To create backups";
            "To compress tables";
            "To reload the HDB"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback normally receives updates from the tickerplant?";

        `a`b`c`d!(
            ".z.ts";
            ".u.upd";
            ".z.pg";
            ".Q.dpft"
        );

        `b
    );

    `question`answers`correct!(
        "Why are updates typically processed in batches?";

        `a`b`c`d!(
            "Reduce IPC overhead";
            "Improve compression";
            "Reduce disk usage";
            "Increase partition count"
        );

        `a
    );

    `question`answers`correct!(
        "Why are symbol columns usually enumerated?";

        `a`b`c`d!(
            "Reduce memory usage";
            "Increase timestamp precision";
            "Compress integers";
            "Improve IPC security"
        );

        `a
    );

    `question`answers`correct!(
        "What normally happens to the RDB at end-of-day?";

        `a`b`c`d!(
            "Its tables are persisted into the HDB";
            "It is archived as CSV";
            "Its memory is duplicated";
            "It becomes the gateway"
        );

        `a
    );

    `question`answers`correct!(
        "Why do gateways often query both the RDB and HDB?";

        `a`b`c`d!(
            "To combine today's data with historical data";
            "To improve compression";
            "To reduce memory";
            "To replay logs"
        );

        `a
    );

    `question`answers`correct!(
        "An RDB receives market data primarily through:";

        `a`b`c`d!(
            "IPC subscriptions";
            "CSV polling";
            "REST APIs";
            "FTP downloads"
        );

        `a
    );

    `question`answers`correct!(
        "Why must an RDB carefully manage memory?";

        `a`b`c`d!(
            "All intraday data remains resident";
            "It stores operating system files";
            "It executes SQL";
            "It hosts web services"
        );

        `a
    );

    `question`answers`correct!(
        "Compared with an RDB, an IDB primarily:";

        `a`b`c`d!(
            "Stores interval bars";
            "Publishes market data";
            "Receives feedhandler messages";
            "Maintains transaction logs"
        );

        `a
    );

    `question`answers`correct!(
        "Why is asynchronous IPC commonly used between TP and RDB?";

        `a`b`c`d!(
            "Avoid blocking the tickerplant";
            "Improve disk writes";
            "Reduce partitions";
            "Improve CSV loading"
        );

        `a
    );

    `question`answers`correct!(
        "Why should incoming updates match the existing table schema?";

        `a`b`c`d!(
            "To avoid update failures";
            "To reduce latency";
            "To improve sorting";
            "To compress symbols"
        );

        `a
    );

    `question`answers`correct!(
        "The normal data flow into an RDB is:";

        `a`b`c`d!(
            "Feedhandler → TP → RDB";
            "Gateway → TP → RDB";
            "HDB → TP → RDB";
            "Client → TP → RDB"
        );

        `a
    )
 );