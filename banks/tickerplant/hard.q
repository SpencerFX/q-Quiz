//====================================================================
//
// q-Quiz
//
// Topic      : Tickerplant
// Difficulty : Hard
//
//====================================================================
.quiz.tickerplant.hard:`haReplay`duplicateTicks`idempotentReplay`slowConsumer`publisherFailure`orderingGuarantee`schemaChange`logCorruption`backpressure`recoverySequence`multiPublisher`eodRecovery`memoryGrowth`asyncOrdering`replayPerformance`subscriberRecovery`failover`logDurability`tpResponsibility`architecture!
    (
    `question`answers`correct!(
        "Why should replaying a tickerplant log be idempotent?";
        `a`b`c`d!(
            "To reduce disk usage";
            "To allow repeated recovery without corrupting state";
            "To improve compression";
            "To eliminate IPC"
        );
        `b
    );

    `question`answers`correct!(
        "If the same tick is replayed twice, what should ideally happen?";
        `a`b`c`d!(
            "The subscriber should remain in a consistent state";
            "The tickerplant should restart";
            "The log should be deleted";
            "The schema should be rebuilt"
        );
        `a
    );

    `question`answers`correct!(
        "What is the biggest risk of a slow subscriber?";
        `a`b`c`d!(
            "It may exhaust memory by falling behind";
            "It corrupts the transaction log";
            "It changes table schemas";
            "It recompiles q code"
        );
        `a
    );

    `question`answers`correct!(
        "If the publisher disconnects unexpectedly, what should the tickerplant typically preserve?";
        `a`b`c`d!(
            "The existing subscriber state and transaction log";
            "Only the HDB";
            "Only the gateway";
            "Nothing"
        );
        `a
    );

    `question`answers`correct!(
        "Why is preserving message order critical?";
        `a`b`c`d!(
            "Subscribers must reconstruct the exact market state";
            "It improves query speed";
            "It reduces serialization cost";
            "It shortens log files"
        );
        `a
    );

    `question`answers`correct!(
        "Changing a table schema during trading hours without coordination may:";
        `a`b`c`d!(
            "Cause subscribers to deserialize updates incorrectly";
            "Reduce CPU usage";
            "Improve replay performance";
            "Automatically migrate all subscribers"
        );
        `a
    );

    `question`answers`correct!(
        "If a tickerplant log becomes corrupted, the most likely consequence is:";
        `a`b`c`d!(
            "Subscribers may be unable to replay the full trading session";
            "IPC stops supporting asynchronous messaging";
            "The feedhandler recompiles";
            "The gateway deletes cached queries"
        );
        `a
    );

    `question`answers`correct!(
        "What is backpressure in a tickerplant architecture?";
        `a`b`c`d!(
            "Pressure applied to the operating system";
            "Subscribers cannot consume updates as fast as they arrive";
            "Compression of transaction logs";
            "A synchronization protocol"
        );
        `b
    );

    `question`answers`correct!(
        "Following a tickerplant restart during trading hours, what is usually required?";
        `a`b`c`d!(
            "Replay the log before accepting live updates";
            "Delete the RDB";
            "Repartition the HDB";
            "Restart every client"
        );
        `a
    );

    `question`answers`correct!(
        "When multiple publishers exist, a production tickerplant should:";
        `a`b`c`d!(
            "Guarantee deterministic publication ordering";
            "Allow updates to arrive randomly";
            "Ignore timestamps";
            "Publish directly to the HDB"
        );
        `a
    );

    `question`answers`correct!(
        "After end-of-day, the transaction log is primarily used to:";
        `a`b`c`d!(
            "Recover failures and rebuild intraday databases";
            "Generate source code";
            "Replace the HDB";
            "Compress symbol files"
        );
        `a
    );

    `question`answers`correct!(
        "A continually growing tickerplant process usually indicates:";
        `a`b`c`d!(
            "Subscribers are not consuming updates quickly enough";
            "The schema has too few columns";
            "Compression is enabled";
            "The HDB is offline"
        );
        `a
    );

    `question`answers`correct!(
        "Asynchronous publication provides:";
        `a`b`c`d!(
            "Lower latency because the publisher does not wait for replies";
            "Guaranteed acknowledgements";
            "Automatic replay";
            "Automatic failover"
        );
        `a
    );

    `question`answers`correct!(
        "During replay, updates should generally be applied:";
        `a`b`c`d!(
            "In the exact order they were originally published";
            "Sorted alphabetically";
            "Sorted by symbol";
            "Grouped by subscriber"
        );
        `a
    );

    `question`answers`correct!(
        "A fast replay implementation is important because:";
        `a`b`c`d!(
            "Recovery time directly affects system availability";
            "It reduces schema size";
            "It improves query syntax";
            "It removes duplicate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "If an RDB crashes intraday, the normal recovery sequence is:";
        `a`b`c`d!(
            "Restart, replay the tickerplant log, then resubscribe";
            "Reload the HDB only";
            "Reconnect directly to the feedhandler";
            "Delete the transaction log"
        );
        `a
    );

    `question`answers`correct!(
        "High-availability tickerplant deployments commonly use:";
        `a`b`c`d!(
            "Active/passive or redundant tickerplants";
            "Multiple HDB partitions";
            "Multiple gateways only";
            "Multiple q namespaces"
        );
        `a
    );

    `question`answers`correct!(
        "The durability of a tickerplant primarily depends on:";
        `a`b`c`d!(
            "Persisting updates to the transaction log";
            "Running more subscribers";
            "Increasing IPC ports";
            "Compressing messages"
        );
        `a
    );

    `question`answers`correct!(
        "Which responsibility does NOT normally belong to a tickerplant?";
        `a`b`c`d!(
            "Executing complex analytical queries";
            "Publishing updates";
            "Logging incoming data";
            "Managing subscriptions"
        );
        `a
    );

    `question`answers`correct!(
        "Which design principle best describes a production tickerplant?";
        `a`b`c`d!(
            "Keep the tickerplant lightweight and push business logic downstream";
            "Perform all analytics inside the tickerplant";
            "Store all historical data in memory";
            "Allow subscribers to modify published messages"
        );
        `a
    )
 );
//====================================================================