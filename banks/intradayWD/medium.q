//====================================================================
//
// q-Quiz
//
// Topic      : Intraday Writedown
// Difficulty : Medium
//
//====================================================================
.quiz.intradayWritedown.medium:`appendLogic`maxrowsLogic`timerApproach`disksortPurpose`temporaryTables`queryPerformance`memoryWindow`wrtbls`minmaxRows`lasttime`partitionedWrite`integerPartitions`enumeration`appendHdb`genQuery`unEnum`partedVsSorted`eodProcessing`wqLimitations`partitionBenefits!
    (
    `question`answers`correct!(
        "Why does the modified upd function in w.q enumerate data before writing it to disk?";

        `a`b`c`d!(
            "To make it compatible with the HDB sym file";
            "To compress the data";
            "To apply grouped attributes";
            "To reduce the number of columns"
        );

        `a
    );

    `question`answers`correct!(
        "When does the append function in w.q trigger a writedown?";

        `a`b`c`d!(
            "When the table row count exceeds MAXROWS";
            "Every incoming update";
            "Only at end of day";
            "When memory exceeds 50%"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the whitepaper recommend using a timer-based writedown instead of writing every few rows?";

        `a`b`c`d!(
            "It reduces the overhead of frequent small disk writes";
            "It avoids enumeration";
            "It removes the need for sorting";
            "It guarantees zero downtime"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of disksort during end-of-day processing?";

        `a`b`c`d!(
            "Sort temporary splayed tables before moving them into the HDB";
            "Compress historical data";
            "Recover the tickerplant log";
            "Merge multiple HDB partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why are temporary intraday tables not immediately suitable as HDB partitions?";

        `a`b`c`d!(
            "They must be reorganized by sym and given appropriate attributes";
            "They are compressed";
            "They use keyed tables";
            "They contain duplicate timestamps"
        );

        `a
    );

    `question`answers`correct!(
        "Why are queries against w.q generally slower than a normal RDB?";

        `a`b`c`d!(
            "Data must be combined from memory and unsorted disk tables";
            "The tickerplant becomes synchronous";
            "All queries require IPC";
            "Tables are compressed"
        );

        `a
    );

    `question`answers`correct!(
        "Keeping only the most recent five minutes in memory primarily improves:";

        `a`b`c`d!(
            "Performance for the most frequently accessed data";
            "Compression ratios";
            "Symbol enumeration";
            "Disk fragmentation"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the WRITETBLS variable?";

        `a`b`c`d!(
            "Specify which tables participate in intraday writedown";
            "Specify HDB partitions";
            "Control tickerplant subscriptions";
            "Define grouped attributes"
        );

        `a
    );

    `question`answers`correct!(
        "Why are MINROWS and MAXROWS both useful?";

        `a`b`c`d!(
            "They guarantee some recent data always remains in memory";
            "They improve compression";
            "They reduce symbol enumeration";
            "They eliminate end-of-day processing"
        );

        `a
    );

    `question`answers`correct!(
        "What information does LASTTIME store in the partitioned writedown implementation?";

        `a`b`c`d!(
            "The last timestamp written to disk for each table and symbol";
            "The last tickerplant update";
            "The last HDB reload";
            "The oldest row in memory"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the partitioned writedown partition by integer rather than date?";

        `a`b`c`d!(
            "Each integer represents an enumerated symbol";
            "Integer partitions compress better";
            "Date partitions cannot be queried";
            "The HDB requires integer partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Each partition in the temporary database represents:";

        `a`b`c`d!(
            "One enumerated symbol";
            "One trading day";
            "One table";
            "One exchange"
        );

        `a
    );

    `question`answers`correct!(
        "Why is the HDB sym file shared with the temporary database?";

        `a`b`c`d!(
            "To ensure consistent symbol enumeration";
            "To improve compression";
            "To avoid disk sorting";
            "To rebuild partitions"
        );

        `a
    );

    `question`answers`correct!(
        "What does appendHDB primarily do?";

        `a`b`c`d!(
            "Merge the temporary partitioned data into the final HDB partition";
            "Replay tickerplant logs";
            "Compress the HDB";
            "Reload the gateway"
        );

        `a
    );

    `question`answers`correct!(
        "The purpose of genQuery is to:";

        `a`b`c`d!(
            "Combine results from memory and the temporary partitioned database";
            "Sort HDB partitions";
            "Replay TP logs";
            "Enumerate symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Why is unEnum applied to results read from the temporary database?";

        `a`b`c`d!(
            "To convert enumerated symbols back into ordinary symbols before combining results";
            "To compress the data";
            "To sort the results";
            "To apply grouped attributes"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is normally applied during disksort before data enters the HDB?";

        `a`b`c`d!(
            "`p on the sym column";
            "`g on the time column";
            "`u on the sym column";
            "`s on every column"
        );

        `a
    );

    `question`answers`correct!(
        "Why can end-of-day processing in w.q introduce noticeable downtime?";

        `a`b`c`d!(
            "Large on-disk tables must be sorted before becoming queryable";
            "The tickerplant stops logging";
            "Compression blocks queries";
            "Enumeration must be rebuilt"
        );

        `a
    );

    `question`answers`correct!(
        "One major limitation of w.q compared with a standard RDB is:";

        `a`b`c`d!(
            "Intraday queries against disk data are significantly slower";
            "It cannot receive asynchronous updates";
            "It cannot write to an HDB";
            "It does not support symbol columns"
        );

        `a
    );

    `question`answers`correct!(
        "Compared with w.q, the partitioned writedown approach mainly improves:";

        `a`b`c`d!(
            "End-of-day processing speed and intraday query performance";
            "Tickerplant throughput only";
            "Compression ratio only";
            "Network bandwidth only"
        );

        `a
    )
 );
//====================================================================