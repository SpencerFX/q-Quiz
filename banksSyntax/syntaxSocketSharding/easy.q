//====================================================================
//
// q-Quiz
//
// Topic      : Socket Sharding with kdb+ and Linux — Syntax Focus
// Source     : "Socket sharding with kdb+ and Linux" by Marcus Clarke
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxSocketSharding.easy:`rpCmdLine`rpSession`portInUseError`hopenLoop`negAsync`ziDotAccess`differFunc`groupCount`hcloseUsage`timerSet`zpsHandler`zpgHandler!
    (
    `question`answers`correct!(
        "What does the command-line flag q -p rp,5000 do when starting a kdb+ process?";

        `a`b`c`d!(
            "Starts the process listening on port 5000 with the SO_REUSEPORT socket option enabled";
            "Starts the process listening on port 5000 in read-only mode";
            "Starts the process and immediately opens a connection to port 5000";
            "Restricts the process to only 5000 concurrent connections"
        );

        `a
    );

    `question`answers`correct!(
        "What does the session command backslash-p rp,5000 do, run from within an already-started q session?";

        `a`b`c`d!(
            "Enables listening on port 5000 with SO_REUSEPORT, from within the running session";
            "Prints the current port number";
            "Closes any open connection on port 5000";
            "Restarts the process on port 5000"
        );

        `a
    );

    `question`answers`correct!(
        "What error does backslash-p 5000 signal if port 5000 is already in use without SO_REUSEPORT enabled?";

        `a`b`c`d!(
            "'5000: Address already in use";
            "'access";
            "'port";
            "'nyi"
        );

        `a
    );

    `question`answers`correct!(
        "What does the loop h,:hopen `::5000 each til 1000 do?";

        `a`b`c`d!(
            "Opens 1000 separate connections to port 5000 on the local host, appending each handle to h";
            "Opens a single connection and sends 1000 messages over it";
            "Opens 1000 connections and immediately closes them";
            "Opens a connection to 1000 different ports starting at 5000"
        );

        `a
    );

    `question`answers`correct!(
        "In (neg h)(...), what does applying neg to a connection handle h achieve when the result is called as a function?";

        `a`b`c`d!(
            "It sends the message asynchronously rather than waiting for a synchronous reply";
            "It closes the connection after sending";
            "It reverses the byte order of the message";
            "It sends the message to a negative port number"
        );

        `a
    );

    `question`answers`correct!(
        "What does x`.z.i` return when x is a connection handle?";

        `a`b`c`d!(
            "The process ID of the server at the other end of that connection";
            "The IP address of the server";
            "The number of connections open on that handle";
            "The time the connection was opened"
        );

        `a
    );

    `question`answers`correct!(
        "What does differ{x`.z.i`}each h compute?";

        `a`b`c`d!(
            "A boolean list marking where the process ID changes between consecutive handles in h, showing whether consecutive connections landed on different servers";
            "A list of the differences between successive process IDs as integers";
            "A count of how many distinct process IDs appear in h";
            "A sorted list of unique process IDs across h"
        );

        `a
    );

    `question`answers`correct!(
        "What does count each group {x`.z.i`}each h compute?";

        `a`b`c`d!(
            "The number of connections in h that landed on each distinct server process ID";
            "The number of distinct process IDs seen across h";
            "The average number of connections per server";
            "The total number of connections in h"
        );

        `a
    );

    `question`answers`correct!(
        "What does hclose .z.w do when called from inside a message handler?";

        `a`b`c`d!(
            "Closes the connection handle to whichever process sent the currently-handled message";
            "Closes every open connection on the process";
            "Closes the listening port entirely";
            "Closes the handle to the local process"
        );

        `a
    );

    `question`answers`correct!(
        "What does backslash-t 1000 do when set in a q session?";

        `a`b`c`d!(
            "Sets a timer to fire every 1000 milliseconds, invoking .z.ts on each tick";
            "Sets a 1000-connection limit on the process";
            "Sleeps the process for 1000 milliseconds";
            "Sets the process's port to 1000"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.ps:{system \"sleep 2\"; value x; cnt+:1;} do when set as the asynchronous message handler?";

        `a`b`c`d!(
            "For each incoming async message, sleeps 2 seconds, evaluates the message, then increments a counter";
            "Sleeps 2 seconds before the process starts listening";
            "Increments cnt every 2 seconds regardless of messages received";
            "Rejects any message that arrives within 2 seconds of the last one"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.pg:{`messages insert (.z.T;x)} do when set as the synchronous message handler?";

        `a`b`c`d!(
            "For each incoming synchronous request, inserts the current time and the request value as a new row in the messages table";
            "Rejects all synchronous requests and logs an error";
            "Only inserts a row into messages once per second";
            "Sends the messages table back to the caller synchronously"
        );

        `a
    )
 );