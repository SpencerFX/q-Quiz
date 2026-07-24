//====================================================================
//
// q-Quiz
//
// Topic      : IPC
// Difficulty : Medium
//
//====================================================================

.quiz.ipc.medium:`zpg`zps`zpo`zpc`hopenCredentials`syncVsAsync`negHandle`serialization`asyncOrdering`gatewayRouting`tickerplantPub`rdbSubscription`broadcast`messageQueue`callback`remoteEval`latency`compression`reconnect`handleReuse!
    (
    `question`answers`correct!(
        "Which callback is invoked when a synchronous IPC request is received?";
        `a`b`c`d!(
            ".z.ps";
            ".z.pg";
            ".z.po";
            ".z.pc"
        );
        `b
    );

    `question`answers`correct!(
        "Which callback is invoked for asynchronous IPC messages?";
        `a`b`c`d!(
            ".z.ps";
            ".z.pg";
            ".z.po";
            ".z.pc"
        );
        `a
    );

    `question`answers`correct!(
        "Which callback executes when a client connects?";
        `a`b`c`d!(
            ".z.po";
            ".z.pc";
            ".z.pg";
            ".z.ps"
        );
        `a
    );

    `question`answers`correct!(
        "Which callback executes when a client disconnects?";
        `a`b`c`d!(
            ".z.po";
            ".z.pc";
            ".z.pg";
            ".z.ps"
        );
        `b
    );

    `question`answers`correct!(
        "How can hopen authenticate with a username and password?";
        `a`b`c`d!(
            "`:host:port:user:pass";
            "`:user:pass@host:port";
            "`host:user:pass";
            "`:host:user"
        );
        `b
    );

    `question`answers`correct!(
        "When is synchronous IPC generally preferred?";
        `a`b`c`d!(
            "When a reply is required";
            "For market data publishing";
            "For tickerplant subscriptions";
            "For logging only"
        );
        `a
    );

    `question`answers`correct!(
        "Why are negative handles commonly used by tickerplants?";
        `a`b`c`d!(
            "They send asynchronous messages";
            "They compress messages";
            "They reconnect automatically";
            "They reduce memory usage"
        );
        `a
    );

    `question`answers`correct!(
        "What is serialized before an IPC message is sent?";
        `a`b`c`d!(
            "Only tables";
            "Only strings";
            "The complete q object";
            "Only symbols"
        );
        `c
    );

    `question`answers`correct!(
        "Asynchronous IPC guarantees:";
        `a`b`c`d!(
            "A response";
            "Delivery order on a connection";
            "Automatic retries";
            "Parallel execution"
        );
        `b
    );

    `question`answers`correct!(
        "What is the primary role of a gateway?";
        `a`b`c`d!(
            "Store historical data";
            "Route client requests";
            "Receive exchange feeds";
            "Compress HDB partitions"
        );
        `b
    );

    `question`answers`correct!(
        "What does a tickerplant primarily publish?";
        `a`b`c`d!(
            "Historical data";
            "Market updates";
            "SQL queries";
            "Configuration files"
        );
        `b
    );

    `question`answers`correct!(
        "An RDB normally receives market data by:";
        `a`b`c`d!(
            "Polling the HDB";
            "Subscribing to the tickerplant";
            "Reading log files";
            "Calling exec"
        );
        `b
    );

    `question`answers`correct!(
        "When sending one message to many subscribers, the sender is:";
        `a`b`c`d!(
            "Broadcasting";
            "Joining";
            "Enumerating";
            "Serializing"
        );
        `a
    );

    `question`answers`correct!(
        "If messages are produced faster than they can be sent, they typically:";
        `a`b`c`d!(
            "Disappear immediately";
            "Queue until written";
            "Become synchronous";
            "Are compressed into one message"
        );
        `b
    );

    `question`answers`correct!(
        "What is the purpose of IPC callbacks?";
        `a`b`c`d!(
            "Handle connection and message events";
            "Compress tables";
            "Perform joins";
            "Build HDB partitions"
        );
        `a
    );

    `question`answers`correct!(
        "What can be evaluated remotely using IPC?";
        `a`b`c`d!(
            "Only SQL";
            "Any valid q expression";
            "Only functions";
            "Only updates"
        );
        `b
    );

    `question`answers`correct!(
        "Network latency primarily affects:";
        `a`b`c`d!(
            "Time taken for IPC requests";
            "Table compression";
            "Symbol enumeration";
            "Vector operations"
        );
        `a
    );

    `question`answers`correct!(
        "IPC message compression primarily reduces:";
        `a`b`c`d!(
            "CPU usage";
            "Network bandwidth";
            "Disk seeks";
            "Memory allocation"
        );
        `b
    );

    `question`answers`correct!(
        "A production client should generally:";
        `a`b`c`d!(
            "Reconnect after connection loss";
            "Terminate immediately";
            "Ignore failures";
            "Create a new process"
        );
        `a
    );

    `question`answers`correct!(
        "Why should an application reuse IPC handles?";
        `a`b`c`d!(
            "Opening connections is relatively expensive";
            "Handles consume disk space";
            "Handles improve compression";
            "It changes serialization format"
        );
        `a
    )

 );
//====================================================================