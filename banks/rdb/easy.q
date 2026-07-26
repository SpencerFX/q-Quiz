//====================================================================
//
// q-Quiz
//
// Topic      : RDB
// Difficulty : Easy
//
//====================================================================
.quiz.rdb.easy:`rdbMeaning`memoryStorage`subscriber`historical`updates`querying`endOfDay`tickerplant`intraday`restart`latency`disk!
    (
    `question`answers`correct!(

        "What does RDB stand for?";

        `a`b`c`d!(
            "Real-time Database";
            "Relational Database";
            "Remote Data Buffer";
            "Read Database"
        );

        `a
    );

    `question`answers`correct!(
        "Where is an RDB primarily stored?";

        `a`b`c`d!(
            "Memory";
            "CSV files";
            "Tape";
            "Object storage"
        );

        `a
    );

    `question`answers`correct!(
        "An RDB typically subscribes to:";

        `a`b`c`d!(
            "Gateway";
            "Tickerplant";
            "HDB";
            "Feedhandler"
        );

        `b
    );

    `question`answers`correct!(
        "What kind of data is normally queried from an RDB?";

        `a`b`c`d!(
            "Intraday data";
            "Archived backups";
            "Reference data only";
            "Configuration files"
        );

        `a
    );

    `question`answers`correct!(
        "How does an RDB receive new records?";

        `a`b`c`d!(
            "Subscription updates";
            "CSV imports";
            "Manual entry";
            "Polling disk"
        );

        `a
    );

    `question`answers`correct!(
        "Why is an RDB queried during the trading day?";

        `a`b`c`d!(
            "Fast in-memory access";
            "It stores backups";
            "It compresses files";
            "It hosts web pages"
        );

        `a
    );

    `question`answers`correct!(
        "At the end of the trading day, RDB data is usually:";

        `a`b`c`d!(
            "Deleted";
            "Saved into the HDB";
            "Sent to clients";
            "Converted to CSV"
        );

        `b
    );

    `question`answers`correct!(
        "Which process normally publishes updates to the RDB?";

        `a`b`c`d!(
            "Tickerplant";
            "Gateway";
            "Client";
            "HDB"
        );

        `a
    );

    `question`answers`correct!(
        "An RDB mainly stores:";

        `a`b`c`d!(
            "Today's data";
            "Historical years";
            "Logs";
            "Configuration"
        );

        `a
    );

    `question`answers`correct!(
        "If an RDB restarts during trading, it usually recovers by:";

        `a`b`c`d!(
            "Replaying the TP log";
            "Reading CSV";
            "Restarting the feedhandler";
            "Loading the HDB only"
        );

        `a
    );

    `question`answers`correct!(
        "An RDB is optimized for:";

        `a`b`c`d!(
            "Low-latency queries";
            "Disk compression";
            "Machine learning";
            "File storage"
        );

        `a
    );

    `question`answers`correct!(
        "Unlike the HDB, the RDB primarily operates:";

        `a`b`c`d!(
            "In memory";
            "On disk";
            "In the cloud";
            "Inside the gateway"
        );

        `a
    )
 );