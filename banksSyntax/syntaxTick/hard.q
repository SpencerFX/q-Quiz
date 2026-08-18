//--------------------------------------------------------------------
// HARD — recovery, architecture and implementation details
//--------------------------------------------------------------------
.quiz.syntaxTick.hard:`rdbRecoveryFlow`tpDoesNotReplay`updMessageShape`rdbReplayInsert`logCounters`eodLogRoll`missingDayHandling`tpFailure`tpLightweight`rdbRole`rdbEndOfDay`chainedTp`chainedTpUseCase`feedhandlerRole`tpAvailability`liveUpdateFlow`subscriberRecovery`logReplaySemantics`architectureSeparation`recoveryArchitecture!
    (
    `question`answers`correct! (
        "When an RDB reconnects after failure, which component normally replays the tickerplant log?";

        `a`b`c`d! (
            "The RDB itself";
            "The tickerplant";
            "The HDB";
            "The feedhandler"
        );

        `a
    );

    `question`answers`correct! (
        "Why does the tickerplant not normally replay its log directly to a recovering subscriber?";

        `a`b`c`d! (
            "The subscriber performs the replay itself using the TP log information";
            "The TP log contains only metadata";
            "The tickerplant cannot read its own log";
            "Replay is performed exclusively by the HDB"
        );

        `a
    );

    `question`answers`correct! (
        "What is the conceptual structure of a tickerplant log message?";

        `a`b`c`d! (
            "(upd function; table name; table data)";
            "(table name; subscriber handle; date)";
            "(date; table name; HDB partition)";
            "(sym; price; size)"
        );

        `a
    );

    `question`answers`correct! (
        "For a standard RDB where upd performs an insert, what is the conceptual equivalent of replaying a single TP-log message?";

        `a`b`c`d! (
            "insert[`tablename;tabledata]";
            ".u.sub[tablename;tabledata]";
            ".u.pub[tablename;tabledata]";
            "select from tablename"
        );

        `a
    );

    `question`answers`correct! (
        "Why must .u.i and .u.j be kept distinct in batch mode?";

        `a`b`c`d! (
            ".u.i tracks processed/logged messages while .u.j includes messages accumulated in the current batch";
            "They are two aliases for the same variable";
            ".u.i counts subscribers while .u.j counts tables";
            ".u.i tracks HDB rows while .u.j tracks RDB rows"
        );

        `a
    );

    `question`answers`correct! (
        "What does .u.endofday do to the tickerplant log?";

        `a`b`c`d! (
            "It closes the current log and creates or opens the log for the next date";
            "It deletes the current log";
            "It replays the entire log into the HDB";
            "It compresses the current log in place"
        );

        `a
    );

    `question`answers`correct! (
        "What happens if .u.ts detects that the incoming date is more than one day ahead of .u.d?";

        `a`b`c`d! (
            "It signals an error and cancels the kdb+ timer";
            "It silently advances .u.d by the required number of days";
            "It replays all missing days from the TP log";
            "It resets .u.d to the incoming date"
        );

        `a
    );

    `question`answers`correct! (
        "Why is a tickerplant normally kept lightweight in a production kdb+ architecture?";

        `a`b`c`d! (
            "It should capture, log and publish data with minimal processing and memory use";
            "It should perform all downstream analytics before publication";
            "It should maintain the complete HDB in memory";
            "It should calculate all RTE outputs centrally"
        );

        `a
    );

    `question`answers`correct! (
        "What is the main role of an RDB in the standard kdb+tick architecture?";

        `a`b`c`d! (
            "Maintain the current day's data in memory";
            "Receive external market data and translate it into .u.upd calls";
            "Maintain the permanent historical database";
            "Manage all tickerplant subscriptions"
        );

        `a
    );

    `question`answers`correct! (
        "What is the typical end-of-day responsibility of the RDB?";

        `a`b`c`d! (
            "Save its intraday data to the HDB and clear or reload its state for the next day";
            "Replay the tickerplant log into the tickerplant";
            "Create the tickerplant schema";
            "Subscribe all RTEs to the HDB"
        );

        `a
    );

    `question`answers`correct! (
        "In a chained tickerplant architecture, what is the role of the secondary tickerplant?";

        `a`b`c`d! (
            "Subscribe to the primary tickerplant and publish its updates to its own subscribers";
            "Replace the HDB and permanently store all historical data";
            "Replay failed RDB logs into the primary tickerplant";
            "Act as a feedhandler for external market data"
        );

        `a
    );

    `question`answers`correct! (
        "Why might a chained tickerplant be useful when a client only needs updates every few seconds rather than every tick?";

        `a`b`c`d! (
            "It can decouple slower subscribers from the primary tickerplant's zero-latency publication stream";
            "It increases the precision of timestamps";
            "It eliminates the need for an RDB";
            "It removes the need for a TP log"
        );

        `a
    );

    `question`answers`correct! (
        "What is the fundamental responsibility of a feedhandler in kdb+tick?";

        `a`b`c`d! (
            "Convert an external data stream into messages suitable for the tickerplant";
            "Persist the historical database";
            "Replay the tickerplant log";
            "Perform end-of-day processing"
        );

        `a
    );

    `question`answers`correct! (
        "Why is tickerplant availability particularly important in a standard tick architecture?";

        `a`b`c`d! (
            "If the TP is unavailable, downstream subscribers do not receive live updates during its downtime";
            "The HDB cannot be queried without the TP";
            "The sym file becomes unreadable";
            "The RDB automatically deletes all historical data"
        );

        `a
    );

    `question`answers`correct! (
        "Which sequence best describes the normal flow of a live update in kdb+tick?";

        `a`b`c`d! (
            "Feedhandler -> TP -> subscribers such as RDB/RTE";
            "Feedhandler -> HDB -> TP -> RDB";
            "RDB -> TP -> feedhandler -> HDB";
            "HDB -> feedhandler -> TP -> RDB"
        );

        `a
    );

    `question`answers`correct! (
        "During RDB recovery, what is the purpose of replaying the tickerplant log from the appropriate point?";

        `a`b`c`d! (
            "To reconstruct the RDB state that was missed after the failure";
            "To rebuild the tickerplant's own log";
            "To recreate the HDB partitions";
            "To resend data to the external feedhandler"
        );

        `a
    );

    `question`answers`correct! (
        "What is the key difference between normal TP publication and log replay?";

        `a`b`c`d! (
            "Normal publication sends new live updates, while replay reconstructs previously logged updates for a recovering subscriber";
            "Normal publication writes to the HDB, while replay writes to the feedhandler";
            "Normal publication uses SQL, while replay uses q";
            "There is no architectural difference"
        );

        `a
    );

    `question`answers`correct! (
        "Why is the shape of the TP log message important to recovery logic?";

        `a`b`c`d! (
            "The recovery process must extract the update function, table name and table data so it can reproduce the original update";
            "The message contains the HDB partition path that must always be recreated";
            "The message identifies which feedhandler produced the original packet";
            "The message contains only the timestamp needed to restart the RDB"
        );

        `a
    );

    `question`answers`correct! (
        "What is the architectural advantage of keeping recovery responsibilities separate from tickerplant publication responsibilities?";

        `a`b`c`d! (
            "The TP can remain focused on reliable live capture, logging and publication while subscribers independently recover missed state";
            "It forces every subscriber to maintain its own tickerplant";
            "It removes the need for persistent TP logs";
            "It allows the HDB to replace the feedhandler"
        );

        `a
    );

    `question`answers`correct! (
        "Which statement best summarizes the recovery and data-flow architecture of kdb+tick?";

        `a`b`c`d! (
            "The feedhandler supplies live data to the TP, the TP logs and publishes it, subscribers maintain downstream state, and a recovering subscriber can replay the TP log to reconstruct missed updates";
            "The feedhandler writes directly to the HDB and the TP is only used for queries";
            "The TP permanently stores all historical data while the RDB only forwards messages";
            "The HDB publishes live updates to the TP and feedhandler"
        );

        `a
    )
    );