//====================================================================
//
// q-Quiz
//
// Topic      : Intraday Writedown
// Difficulty : Easy
//
//====================================================================
.quiz.intradayWD.easy:`purpose`twoSolutions`standardArchitecture`intradayWrite`freeMemory`temporaryDirectory`maxRows`updFunction`endOfDay`tickerplant`rdb`hdb`timerWrite`wqPurpose`disksort`partedAttribute`queryLimitation`recentData`writeTables`memoryBenefit!
    (
    `question`answers`correct!(
        "What is the primary purpose of intraday writedown?";

        `a`b`c`d!(
            "Reduce memory usage by writing data to disk during the trading day";
            "Compress historical databases";
            "Replace the tickerplant";
            "Increase network throughput"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, what are the two broad solutions for handling increasing data volumes?";

        `a`b`c`d!(
            "Hardware solutions and software solutions";
            "Compression and partitioning";
            "Tickerplants and gateways";
            "Compression and IPC"
        );

        `a
    );

    `question`answers`correct!(
        "In a standard tick architecture, where is today's market data normally stored?";

        `a`b`c`d!(
            "The RDB";
            "The HDB";
            "The tickerplant log";
            "The gateway"
        );

        `a
    );

    `question`answers`correct!(
        "During an intraday writedown, what happens to older data?";

        `a`b`c`d!(
            "It is written to disk and removed from memory";
            "It is permanently deleted";
            "It is sent back to the tickerplant";
            "It is compressed only"
        );

        `a
    );

    `question`answers`correct!(
        "Why is data removed from memory after being written down?";

        `a`b`c`d!(
            "To free RAM";
            "To improve symbol enumeration";
            "To reduce disk usage";
            "To increase CPU utilization"
        );

        `a
    );

    `question`answers`correct!(
        "Where does w.q temporarily store intraday data?";

        `a`b`c`d!(
            "A temporary directory on disk";
            "The HDB partition";
            "The TP log";
            "Shared memory"
        );

        `a
    );

    `question`answers`correct!(
        "What causes w.q to flush buffered rows to disk?";

        `a`b`c`d!(
            "The table exceeds MAXROWS";
            "The tickerplant disconnects";
            "The HDB reloads";
            "The gateway requests data"
        );

        `a
    );

    `question`answers`correct!(
        "Which function processes incoming updates from the tickerplant in w.q?";

        `a`b`c`d!(
            "upd";
            ".u.end";
            ".z.ts";
            ".Q.dpft"
        );

        `a
    );

    `question`answers`correct!(
        "Which function performs the end-of-day processing?";

        `a`b`c`d!(
            ".u.end";
            "upd";
            ".z.ts";
            ".Q.chk"
        );

        `a
    );

    `question`answers`correct!(
        "Which component publishes market data to the RDB?";

        `a`b`c`d!(
            "The tickerplant";
            "The gateway";
            "The HDB";
            "The feedhandler"
        );

        `a
    );

    `question`answers`correct!(
        "What does RDB stand for?";

        `a`b`c`d!(
            "Realtime Database";
            "Remote Database";
            "Reference Database";
            "Relational Database"
        );

        `a
    );

    `question`answers`correct!(
        "What does HDB stand for?";

        `a`b`c`d!(
            "Historical Database";
            "Hybrid Database";
            "Hosted Database";
            "High-speed Database"
        );

        `a
    );

    `question`answers`correct!(
        "Which feature can periodically write older data to disk instead of waiting for MAXROWS?";

        `a`b`c`d!(
            "A timer using .z.ts";
            "A gateway callback";
            "A second tickerplant";
            "A partition attribute"
        );

        `a
    );

    `question`answers`correct!(
        "What is w.q primarily designed to be?";

        `a`b`c`d!(
            "A write-only RDB";
            "A gateway";
            "A tickerplant";
            "A historical database"
        );

        `a
    );

    `question`answers`correct!(
        "Why is disksort used during end-of-day processing?";

        `a`b`c`d!(
            "To sort temporary data before moving it into the HDB";
            "To compress temporary data";
            "To replay tickerplant logs";
            "To enumerate symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is commonly applied to the sym column after sorting?";

        `a`b`c`d!(
            "`p (parted)";
            "`g (grouped)";
            "`u (unique)";
            "`s (sorted)"
        );

        `a
    );

    `question`answers`correct!(
        "One drawback of intraday writedown is that queries may need to:";

        `a`b`c`d!(
            "Combine data from memory and disk";
            "Replay the tickerplant log";
            "Restart the HDB";
            "Rebuild the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Why might an application keep the most recent few minutes of data in memory?";

        `a`b`c`d!(
            "Recent data is usually queried most frequently";
            "Older data cannot be stored";
            "It removes the need for an HDB";
            "It avoids symbol enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Which configuration variable identifies the tables that should be written down intraday?";

        `a`b`c`d!(
            "WRITETBLS";
            "MAXROWS";
            "LASTTIME";
            "TMPSAVE"
        );

        `a
    );

    `question`answers`correct!(
        "Overall, intraday writedown allows a system to:";

        `a`b`c`d!(
            "Store a full trading day on a machine with limited RAM";
            "Eliminate the HDB completely";
            "Remove the need for a tickerplant";
            "Avoid using partitioned databases"
        );

        `a
    )
 );
//====================================================================