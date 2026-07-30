//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxSocketSharding.hard:`fullZtsClient`fullUtilConnect`reconnectZpc`tmsShrink`hopenSuccessCheck`fullZpsListener`messagesTableDef`distributionCheckFull`asyncCallbackChain`sleepListenerVariant`portReuseFirstProcess`hOpenSyncSend!
    (
    `question`answers`correct!(
        "Which snippet correctly reproduces the client's timer function that records a send time, opens a connection, and sends an asynchronous nested callback carrying that send time?";

        `a`b`c`d!(
            ".z.ts:{st:.z.T; h:hopen 5000; (neg h)({(neg .z.w)({(x;.z.T;.z.T-x;hclose .z.w)};x)};st)}";
            ".z.ts:{st:.z.T; h:hopen 5000; h({(neg .z.w)({(x;.z.T;.z.T-x;hclose .z.w)};x)};st)}";
            ".z.ts:{h:hopen 5000; (neg h)({(neg .z.w)({(x;.z.T;.z.T-x;hclose .z.w)};x)};.z.T)}";
            ".z.ts:{st:.z.T; h:hopen 5000; (neg h)({(.z.w)({(x;.z.T;.z.T-x;hclose .z.w)};x)};st)}"
        );

        `a
    );

    `question`answers`correct!(
        "Which snippet correctly reproduces the reconnect helper .util.connect, which retries hopen with an exponential backoff and reports success or failure after 4 attempts?";

        `a`b`c`d!(
            ".util.connect:{tms:2 xexp til 4; while[(not h:@[hopen;5000;0]) and count tms; stdout \"Connection failed, waiting \",(string first tms),\" seconds before retrying...\"; system \"sleep \",string first tms; tms:1_tms;]; $[0=h;stdout \"Connection failed after 4 attempts, exiting.\";stdout \"Connection established\"]; h}";
            ".util.connect:{tms:2 xexp til 4; while[h:@[hopen;5000;0]; system \"sleep \",string first tms; tms:1_tms;]; h}";
            ".util.connect:{while[not h:hopen[5000]; system \"sleep 2\"]; h}";
            ".util.connect:{tms:til 4; while[(not h:@[hopen;5000;0]) and count tms; tms:_1 tms]; h}"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z.pc definition correctly triggers the reconnect logic whenever the connection to the HDB is lost?";

        `a`b`c`d!(
            ".z.pc:{stdout \"Connection lost to HDB, attempting to reconnect...\"; .util.connect[]}";
            ".z.pc:{stdout \"Connection lost to HDB\"; .util.connect}";
            ".z.pc:{.util.connect[]; stdout \"Connection lost to HDB, attempting to reconnect...\"}";
            ".z.pc:{[x] stdout \"Connection lost to HDB, attempting to reconnect...\"; .util.connect[x]}"
        );

        `a
    );

    `question`answers`correct!(
        "In the retry loop, what does tms:1_tms do on each failed iteration, and why does this matter for the loop's termination?";

        `a`b`c`d!(
            "Drops the first (just-used) backoff value from tms, so the loop eventually terminates when tms becomes empty and count tms is 0";
            "Drops the last backoff value from tms, keeping the smallest values for last";
            "Doubles every remaining value in tms for a longer backoff";
            "Resets tms back to its original four values for another round of retries"
        );

        `a
    );

    `question`answers`correct!(
        "In $[0=h;stdout \"Connection failed after 4 attempts, exiting.\";stdout \"Connection established\"], what determines which branch executes?";

        `a`b`c`d!(
            "Whether h equals 0 (all retries exhausted and the final hopen attempt failed) versus h holding a valid non-zero handle";
            "Whether h is a valid handle greater than 5000";
            "Whether tms still has elements remaining";
            "Whether the process is running as a client or a server"
        );

        `a
    );

    `question`answers`correct!(
        "Which listener definition correctly sleeps the process for 2 seconds on every asynchronous message before evaluating it and incrementing a counter?";

        `a`b`c`d!(
            "cnt:0; .z.ps:{system \"sleep 2\"; value x; cnt+:1;}";
            "cnt:0; .z.ps:{value x; system \"sleep 2\"; cnt+:1;}";
            "cnt:0; .z.pg:{system \"sleep 2\"; value x; cnt+:1;}";
            "cnt:0; .z.ts:{system \"sleep 2\"; cnt+:1;}"
        );

        `a
    );

    `question`answers`correct!(
        "Which table definition correctly matches messages:([]sendTime:();receiveTime:();timeTaken:()) as used on the client to record timing data?";

        `a`b`c`d!(
            "An unkeyed table with three empty columns: sendTime, receiveTime, and timeTaken";
            "A keyed table keyed on sendTime, with receiveTime and timeTaken as data columns";
            "A table with a single nested column containing sendTime, receiveTime and timeTaken as sub-fields";
            "A table pre-populated with one row of null values for each of the three columns"
        );

        `a
    );

    `question`answers`correct!(
        "Which pair of expressions correctly checks connection distribution across servers, first flagging where consecutive handles land on a different server, then counting connections per server?";

        `a`b`c`d!(
            "differ{x`.z.i`}each h  followed by  count each group {x`.z.i`}each h";
            "group{x`.z.i`}each h  followed by  count each differ {x`.z.i`}each h";
            "differ{x`.z.i`}each h  followed by  sum each group {x`.z.i`}each h";
            "count{x`.z.i`}each h  followed by  differ each group {x`.z.i`}each h"
        );

        `a
    );

    `question`answers`correct!(
        "In the two-level asynchronous callback chain (neg h)({(neg .z.w)({...};x)};st), what does .z.w refer to inside the outer anonymous function once it is executing on the server?";

        `a`b`c`d!(
            "The handle of the connection over which the current message was received, i.e. the client's handle from the server's perspective";
            "The handle the server used to originally connect out to the client";
            "The server's own listening port number";
            "The handle of the most recently closed connection"
        );

        `a
    );

    `question`answers`correct!(
        "Which listener variant correctly matches the high-volume test, where the timer runs every 100ms and the listener sleeps 0.2 seconds per message?";

        `a`b`c`d!(
            "Client: backslash-t 100.  Listener: \\p rp,5000 then .z.ps:{system \"sleep 0.2\"; value x}";
            "Client: backslash-t 100.  Listener: \\p rp,5000 then .z.ps:{system \"sleep 2\"; value x}";
            "Client: backslash-t 200.  Listener: \\p rp,5000 then .z.ps:{system \"sleep 0.1\"; value x}";
            "Client: backslash-t 1000. Listener: \\p 5000 then .z.ps:{system \"sleep 0.2\"; value x}"
        );

        `a
    );

    `question`answers`correct!(
        "According to the paper, which condition must hold for a second process to later bind to a port that a first process already opened with rp?";

        `a`b`c`d!(
            "The first process to open the port must itself have used the rp option, allowing later processes to also bind to that same port";
            "The second process must use a higher port number offset by one";
            "The first process must close the port before the second can bind to it";
            "Both processes must be started with the exact same PID"
        );

        `a
    );

    `question`answers`correct!(
        "Which call correctly opens a connection and sends a request SYNCHRONOUSLY, blocking for a reply, as used by the client that stores message arrival times?";

        `a`b`c`d!(
            "h:hopen 5000; h(cnt); hclose h";
            "h:hopen 5000; (neg h)(cnt); hclose h";
            "h:hopen 5000; neg[h](cnt)";
            "h:hopen[5000;0]; h(cnt)"
        );

        `a
    )
 );
//====================================================================