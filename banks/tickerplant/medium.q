//====================================================================
//
// q-Quiz
//
// Topic      : Tickerplant
// Difficulty : Medium
//
//====================================================================
.quiz.tickerplant.medium:`updFunction`subscription`uSub`uUpd`logReplay`schemaConsistency`lateSubscriber`multipleTables`asyncPublish`tickOrdering`rdbReplay`logRecovery`batching`slowSubscriber`ipcTransport`publisherOrdering`eodRoll`tickLog`subscriptionHandle`replayPurpose!
    (
    `question`answers`correct!(
        "Which function is typically responsible for processing incoming updates in a tickerplant?";
        `a`b`c`d!(
            ".u.sub";
            ".z.pg";
            ".u.upd";
            ".Q.dpft"
        );
        `c
    );

    `question`answers`correct!(
        "What is the purpose of .u.sub?";
        `a`b`c`d!(
            "Subscribe a client to one or more tables";
            "Replay the transaction log";
            "Write updates to disk";
            "Create new schemas"
        );
        `a
    );

    `question`answers`correct!(
        "Why must all subscribers agree on the schema of a table?";
        `a`b`c`d!(
            "To reduce disk usage";
            "Updates are positional and column order must match";
            "To improve compression";
            "To allow SQL joins"
        );
        `b
    );

    `question`answers`correct!(
        "What happens when a new RDB starts during the trading day?";
        `a`b`c`d!(
            "It waits until end-of-day";
            "It normally replays the tickerplant log before subscribing";
            "It requests data from the HDB";
            "It recreates the schema automatically"
        );
        `b
    );

    `question`answers`correct!(
        "Why does a tickerplant maintain a transaction log?";
        `a`b`c`d!(
            "To recover or initialize subscribers";
            "To compress market data";
            "To improve IPC throughput";
            "To speed up SQL queries"
        );
        `a
    );

    `question`answers`correct!(
        "Why can a tickerplant publish updates asynchronously?";
        `a`b`c`d!(
            "Subscribers acknowledge every message";
            "Publishing waits for every client";
            "It minimizes latency by not waiting for replies";
            "It reduces memory usage"
        );
        `c
    );

    `question`answers`correct!(
        "What is the advantage of separating trades and quotes into different tables?";
        `a`b`c`d!(
            "Tables become immutable";
            "Different data types and update rates can be handled independently";
            "It eliminates IPC";
            "It removes the need for schemas"
        );
        `b
    );

    `question`answers`correct!(
        "Why is the order of updates important?";
        `a`b`c`d!(
            "Subscribers must reconstruct the same market state";
            "It improves file compression";
            "It reduces CPU usage";
            "It makes queries shorter"
        );
        `a
    );

    `question`answers`correct!(
        "What is replaying the tickerplant log primarily used for?";
        `a`b`c`d!(
            "Creating historical charts";
            "Rebuilding a subscriber's in-memory state";
            "Compiling q scripts";
            "Testing IPC latency"
        );
        `b
    );

    `question`answers`correct!(
        "What is a potential problem with a slow subscriber?";
        `a`b`c`d!(
            "It may fall behind incoming updates";
            "It changes the tickerplant schema";
            "It deletes the log";
            "It blocks disk writes"
        );
        `a
    );

    `question`answers`correct!(
        "Tickerplants most commonly communicate with subscribers using:";
        `a`b`c`d!(
            "HTTP";
            "FTP";
            "IPC";
            "SMTP"
        );
        `c
    );

    `question`answers`correct!(
        "What should happen after a successful replay?";
        `a`b`c`d!(
            "The subscriber begins receiving live updates";
            "The tickerplant shuts down";
            "The transaction log is deleted";
            "The schema is regenerated"
        );
        `a
    );

    `question`answers`correct!(
        "Why might updates be batched before publication?";
        `a`b`c`d!(
            "To reduce the number of IPC messages";
            "To increase replay time";
            "To avoid logging";
            "To eliminate subscribers"
        );
        `a
    );

    `question`answers`correct!(
        "What is typically rolled at end-of-day?";
        `a`b`c`d!(
            "The transaction log";
            "The operating system";
            "The schema";
            "The IPC protocol"
        );
        `a
    );

    `question`answers`correct!(
        "A subscriber normally identifies itself to the tickerplant by:";
        `a`b`c`d!(
            "Sending an email";
            "Calling the subscription function";
            "Writing directly to the log";
            "Opening the HDB"
        );
        `b
    );

    `question`answers`correct!(
        "If updates arrive from multiple publishers, what is important?";
        `a`b`c`d!(
            "Maintaining a deterministic publication order";
            "Using different schemas";
            "Compressing every message";
            "Writing directly to disk"
        );
        `a
    );

    `question`answers`correct!(
        "Why is replay generally faster than reloading an HDB?";
        `a`b`c`d!(
            "Replay only processes today's updates";
            "Replay skips serialization";
            "Replay ignores schemas";
            "Replay removes timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "What information is commonly included in every published update?";
        `a`b`c`d!(
            "The table name and inserted rows";
            "The subscriber count";
            "The transaction log filename";
            "The operating system version"
        );
        `a
    );

    `question`answers`correct!(
        "Why should a tickerplant remain lightweight?";
        `a`b`c`d!(
            "To minimize latency and maximize throughput";
            "To improve SQL optimization";
            "To eliminate disk writes";
            "To reduce table sizes"
        );
        `a
    );

    `question`answers`correct!(
        "Which component is primarily responsible for long-term historical storage?";
        `a`b`c`d!(
            "Feedhandler";
            "Tickerplant";
            "Gateway";
            "HDB"
        );
        `d
    )
 );
//====================================================================