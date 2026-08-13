//--------------------------------------------------------------------
// MEDIUM — publication, logging and batch/realtime behavior
//--------------------------------------------------------------------
.quiz.syntaxTick.medium:`uPub`uW`uI`uJ`realtimeUpd`batchUpd`timespanInjection`batchTimespan`tpLogUpdCall`logReplay`rdbRecovery`rdbLogPosition`uPubArgs`subscriberFiltering`schemaAttr!    
    (
    `question`answers`correct!(
        "In realtime mode, what does .u.upd call after constructing the table data for publication?";

        `a`b`c`d!(
            ".u.pub";
            ".u.sub";
            ".u.rep";
            ".u.endofday"
        );

        `a
    );

    `question`answers`correct!(
        "What does .u.w contain?";

        `a`b`c`d!(
            "The registered clients and their interests in tickerplant data";
            "The current contents of the tickerplant log";
            "The HDB connection handles";
            "The list of schema files loaded by tick.q"
        );

        `a
    );

    `question`answers`correct!(
        "What does .u.i represent in tick.q?";

        `a`b`c`d!(
            "The number of messages processed in the tickerplant log";
            "The number of subscribers";
            "The current date";
            "The number of tables in the schema"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of .u.j in batch mode?";

        `a`b`c`d!(
            "It tracks the total number of messages in the log plus the current batch";
            "It stores the number of connected subscribers";
            "It stores the current TP date";
            "It identifies the HDB process"
        );

        `a
    );

    `question`answers`correct!(
        "In batch mode, when are accumulated updates normally published?";

        `a`b`c`d!(
            "When the tickerplant timer fires";
            "Immediately when .u.upd is called";
            "Only at end of day";
            "When an RDB requests them"
        );

        `a
    );

    `question`answers`correct!(
        "In realtime mode, how does .u.upd normally publish incoming data?";

        `a`b`c`d!(
            "Immediately to interested subscribers";
            "After the next one-second batch";
            "Only after the TP log is closed";
            "Only after the RDB requests the data"
        );

        `a
    );

    `question`answers`correct!(
        "If incoming data to .u.upd does not begin with a timespan, what does tick.q do?";

        `a`b`c`d!(
            "It adds a timespan column using the current local time";
            "It rejects the update";
            "It converts the sym column to a timespan";
            "It delays the update until end of day"
        );

        `a
    );

    `question`answers`correct!(
        "If multiple rows arrive in one .u.upd call without a supplied timespan, what time is assigned to them?";

        `a`b`c`d!(
            "The same current local time is assigned to all rows";
            "A different timestamp is generated for every row";
            "The previous row's timestamp is reused";
            "The date from .u.d is assigned"
        );

        `a
    );

    `question`answers`correct!(
        "What is written to the tickerplant log when logging is enabled?";

        `a`b`c`d!(
            "The upd function call and its arguments";
            "Only the resulting table contents";
            "Only the subscriber handles";
            "Only the current message count"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the tickerplant log store the upd call rather than simply storing a snapshot of the RDB?";

        `a`b`c`d!(
            "The update messages can be replayed to reconstruct subscriber state";
            "Snapshots cannot contain symbol columns";
            "The RDB cannot be written to disk";
            "The tickerplant does not have access to table data"
        );

        `a
    );

    `question`answers`correct!(
        "Which process is responsible for replaying the TP log during RDB recovery?";

        `a`b`c`d!(
            "The RDB/client performing recovery";
            "The tickerplant automatically";
            "The HDB";
            "The feedhandler"
        );

        `a
    );

    `question`answers`correct!(
        "What information does an RDB obtain from the tickerplant to determine what portion of the TP log it needs to replay?";

        `a`b`c`d!(
            "The TP log location and message count";
            "The HDB schema and partition count";
            "The feedhandler IP and port";
            "The RDB table count and sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What does .u.pub receive in the standard tickerplant publication flow?";

        `a`b`c`d!(
            "The table name and the table of data to publish";
            "Only the subscriber handle";
            "Only the tickerplant log handle";
            "The HDB partition and date"
        );

        `a
    );

    `question`answers`correct!(
        "How can a subscriber restrict a .u.sub subscription to particular symbols?";

        `a`b`c`d!(
            "By supplying the table name and a symbol list";
            "By modifying .u.i";
            "By setting the TP timer to zero";
            "By changing .u.d"
        );

        `a
    );

    `question`answers`correct!(
        "What happens to the grouped attribute on the sym column during batch publication?";

        `a`b`c`d!(
            "It is reapplied after the batch is published";
            "It is permanently removed";
            "It is converted to parted";
            "It is copied into the TP log"
        );

        `a
    )
 );