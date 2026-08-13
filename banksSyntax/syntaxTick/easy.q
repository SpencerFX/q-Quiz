//====================================================================
//
// q-Quiz
//
// Topic      : kdb+tick — Tickerplant Syntax & Architecture
// Difficulty : Easy / Medium / Hard
//
//
//====================================================================


//--------------------------------------------------------------------
// EASY — core tickerplant functions and syntax
//--------------------------------------------------------------------
.quiz.syntaxTick.easy:`uUpd`uUpdTable`uUpdData`uSub`uSubAll`uTick`uTs`uEndofday`schemaTimesym`tpLogFilename`tpLogHandle`tpDate`tickTimer`tickTimerZero`!
    (
    `question`answers`correct! (
        "What is the purpose of .u.upd in tick.q";

        `a`b`c`d! (
            "It receives incoming table updates and processes them for logging and publication";
            "It replays the tickerplant log into an RDB";
            "It writes the end-of-day RDB tables to the HDB";
            "It registers a new subscriber with the tickerplant"
        );

        `a
    );

    `question`answers`correct! (
        "What does the first argument to .u.upd represent in .u.upd[x;y]?";

        `a`b`c`d! (
            "The name of the table being updated";
            "The tickerplant log file";
            "The subscriber handle";
            "The current trading date"
        );

        `a
    );

    `question`answers`correct! (
        "What does the second argument to .u.upd represent?";

        `a`b`c`d! (
            "The data to be inserted into the table named by the first argument";
            "The tickerplant listening port";
            "The list of subscriber handles";
            "The current tickerplant date"
        );

        `a
    );

    `question`answers`correct! (
        "Which function does a client call to subscribe to tickerplant updates?";

        `a`b`c`d! (
            ".u.sub";
            ".u.upd";
            ".u.rep";
            ".u.end"
        );

        `a
    );

    `question`answers`correct! (
        "What does .u.sub[`;`] request?";

        `a`b`c`d! (
            "Subscribe to all tickerplant updates";
            "Subscribe only to trade updates";
            "Subscribe only to quote updates";
            "Replay the entire tickerplant log"
        );

        `a
    );

    `question`answers`correct! (
        "What is the purpose of .u.tick[x;y]?";

        `a`b`c`d! (
            "Initialize tickerplant state using schema x and log directory y";
            "Replay log y into table x";
            "Subscribe table x to tickerplant y";
            "Write the RDB tables to HDB"
        );

        `a
    );

    `question`answers`correct! (
        "What does .u.ts check?";

        `a`b`c`d! (
            "Whether the supplied date has changed from the tickerplant's current date";
            "Whether the TP log is compressed";
            "Whether an RDB subscriber has disconnected";
            "Whether a table contains a sym column"
        );

        `a
    );

    `question`answers`correct! (
        "What is the purpose of .u.endofday?";

        `a`b`c`d! (
            "Perform tickerplant end-of-day processing and roll the TP log";
            "Replay the TP log into the RDB";
            "Subscribe all clients to the next table";
            "Apply the parted attribute to every column"
        );

        `a
    );

    `question`answers`correct! (
        "In the standard tick.q schema, what are the first two required columns of each table?";

        `a`b`c`d! (
            "`time and `sym";
            "`sym and `time";
            "`date and `sym";
            "`time and `date"
        );

        `a
    );

    `question`answers`correct! (
        "What happens if a tick.q schema does not have `time and `sym as its first two columns?";

        `a`b`c`d! (
            "The tickerplant signals a timesym error";
            "The tickerplant automatically adds both columns";
            "The tickerplant ignores the schema";
            "The tickerplant converts the first two columns to symbols"
        );

        `a
    );

    `question`answers`correct! (
        "Which variable identifies the tickerplant log filename?";

        `a`b`c`d! (
            ".u.L";
            ".u.l";
            ".u.i";
            ".u.j"
        );

        `a
    );

    `question`answers`correct! (
        "What does .u.l represent in tick.q?";

        `a`b`c`d! (
            "The handle to the open tickerplant log";
            "The tickerplant log filename";
            "The number of messages processed";
            "The current tickerplant date"
        );

        `a
    );

    `question`answers`correct! (
        "Which tickerplant variable contains the current date?";

        `a`b`c`d! (
            ".u.d";
            ".u.D";
            ".u.t";
            ".u.i"
        );

        `a
    );

    `question`answers`correct! (
        "Which command-line option controls the tickerplant timer period?";

        `a`b`c`d! (
            "-t";
            "-p";
            "-o";
            "-d"
        );

        `a
    );

    `question`answers`correct! (
        "What does -t 0 enable for tick.q?";

        `a`b`c`d! (
            "Real-time publishing";
            "A zero-length tickerplant log";
            "End-of-day processing only";
            "Automatic HDB replay"
        );

        `a
    )
    );