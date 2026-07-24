//====================================================================
//
// q-Quiz
//
// Topic      : IPC
// Difficulty : Hard
//
//====================================================================
.quiz.ipc.hard:`serializationCost`syncScalability`asyncFireForget`messageOrdering`gatewayBenefit`tpAsync`tpReplay`handleLeak`largeMessages`batching`compressionTradeoff`backpressure`blockingCalls`parallelRequests`fanOut`requestReply`reconnectStrategy`latencyVsThroughput`singleConnection`ipcBottleneck!
    (
    `question`answers`correct!(
        "Why can IPC serialization become a performance bottleneck?";
        `a`b`c`d!(
            "Objects must be converted into a byte stream";
            "Tables must always be sorted";
            "Symbols become strings";
            "IPC always compresses data"
        );
        `a
    );

    `question`answers`correct!(
        "Why can many synchronous IPC requests limit throughput?";
        `a`b`c`d!(
            "Each request blocks waiting for a reply";
            "Handles cannot be reused";
            "Serialization is disabled";
            "Sockets become read-only"
        );
        `a
    );

    `question`answers`correct!(
        "When is asynchronous IPC generally preferred?";
        `a`b`c`d!(
            "When no immediate reply is required";
            "When reading an HDB";
            "When executing aj";
            "When loading partitions"
        );
        `a
    );

    `question`answers`correct!(
        "Messages sent over the same IPC connection are generally:";
        `a`b`c`d!(
            "Delivered in order";
            "Delivered randomly";
            "Executed in parallel";
            "Sorted before delivery"
        );
        `a
    );

    `question`answers`correct!(
        "Why is a gateway commonly used in large kdb+ systems?";
        `a`b`c`d!(
            "To route queries and hide backend topology";
            "To compress IPC traffic";
            "To replace the tickerplant";
            "To store historical data"
        );
        `a
    );

    `question`answers`correct!(
        "Why does a tickerplant usually publish updates asynchronously?";
        `a`b`c`d!(
            "Waiting for subscribers would slow market data ingestion";
            "Serialization only works asynchronously";
            "Synchronous IPC is deprecated";
            "Subscribers cannot receive synchronous messages"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of the tickerplant transaction log?";
        `a`b`c`d!(
            "Replay and recovery";
            "Compression";
            "Authentication";
            "IPC routing"
        );
        `a
    );

    `question`answers`correct!(
        "Why should applications avoid repeatedly opening IPC connections?";
        `a`b`c`d!(
            "Connection establishment has overhead";
            "Handles consume disk space";
            "Serialization becomes slower";
            "Messages become synchronous"
        );
        `a
    );

    `question`answers`correct!(
        "Large IPC messages generally:";
        `a`b`c`d!(
            "Take longer to serialize and transmit";
            "Are always compressed";
            "Cannot contain tables";
            "Automatically use secondary threads"
        );
        `a
    );

    `question`answers`correct!(
        "Why is batching small IPC messages often beneficial?";
        `a`b`c`d!(
            "It reduces per-message overhead";
            "It eliminates serialization";
            "It removes network latency";
            "It guarantees parallel execution"
        );
        `a
    );

    `question`answers`correct!(
        "What is the trade-off when enabling IPC compression?";
        `a`b`c`d!(
            "Lower bandwidth but additional CPU usage";
            "Higher bandwidth and lower CPU";
            "More memory with no benefit";
            "Compression only affects symbols"
        );
        `a
    );

    `question`answers`correct!(
        "If a receiver cannot process messages quickly enough, what typically happens?";
        `a`b`c`d!(
            "Messages accumulate in buffers";
            "Messages are silently reordered";
            "Serialization stops";
            "Connections automatically reconnect"
        );
        `a
    );

    `question`answers`correct!(
        "Why should long-running work be avoided inside IPC request handlers?";
        `a`b`c`d!(
            "It delays processing of subsequent requests";
            "It corrupts serialized data";
            "It closes the socket";
            "It disables callbacks"
        );
        `a
    );

    `question`answers`correct!(
        "If many independent requests must be sent, what generally improves throughput?";
        `a`b`c`d!(
            "Parallel requests where appropriate";
            "Using exec instead of select";
            "Converting symbols to strings";
            "Using larger ports"
        );
        `a
    );

    `question`answers`correct!(
        "What does 'fan-out' describe in IPC architectures?";
        `a`b`c`d!(
            "One publisher sending to many consumers";
            "Multiple HDB partitions";
            "Joining several tables";
            "Multiple threads updating one table"
        );
        `a
    );

    `question`answers`correct!(
        "Which communication pattern is typical for client queries?";
        `a`b`c`d!(
            "Request followed by reply";
            "Continuous publish only";
            "Disk replication";
            "Symbol enumeration"
        );
        `a
    );

    `question`answers`correct!(
        "A robust production IPC client should:";
        `a`b`c`d!(
            "Detect failures and reconnect";
            "Assume connections never fail";
            "Open a new handle for every request";
            "Ignore socket errors"
        );
        `a
    );

    `question`answers`correct!(
        "Reducing latency often comes at the cost of:";
        `a`b`c`d!(
            "Lower overall throughput";
            "Reduced symbol count";
            "Less serialization";
            "Smaller tables"
        );
        `a
    );

    `question`answers`correct!(
        "Why is repeatedly creating and closing IPC handles discouraged?";
        `a`b`c`d!(
            "Connection setup is relatively expensive";
            "Handles leak symbols";
            "Compression stops working";
            "The HDB becomes fragmented"
        );
        `a
    );

    `question`answers`correct!(
        "In high-frequency systems, the IPC bottleneck is often:";
        `a`b`c`d!(
            "Serialization and network transfer";
            "SQL parsing";
            "Dictionary creation";
            "Symbol enumeration"
        );
        `a
    )
 );
//====================================================================