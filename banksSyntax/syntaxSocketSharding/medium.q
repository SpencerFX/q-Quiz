//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxSocketSharding.medium:`zTsClientBody`nestedNegCallback`insertListParse`minuteBucket`avgByMinute`counterIncrement`sleepBlock`zPoHandler`zPcBasic`hopenZeroFlag`stdoutHelper`xexpBackoffList!
    (
    `question`answers`correct!(
        "In the client's .z.ts:{st:.z.T; h:hopen 5000; (neg h)({...};st)}, what is the purpose of capturing st:.z.T before opening the handle?";

        `a`b`c`d!(
            "To record the send time before the connection is opened, so elapsed time can be calculated once a reply arrives";
            "To use st as the port number for hopen";
            "To store the previous timer's send time for comparison";
            "To seed the random number generator used for the request ID"
        );

        `a
    );

    `question`answers`correct!(
        "In the nested callback (neg h)({(neg .z.w)({(x;.z.T;.z.T-x;hclose .z.w)};x)};st), what does the inner (neg .z.w)(...) call do on the server side?";

        `a`b`c`d!(
            "Asynchronously sends a reply back to whichever handle sent the original request";
            "Synchronously blocks until the client acknowledges the reply";
            "Opens a brand new handle back to the client on a different port";
            "Broadcasts the reply to every open handle on the server"
        );

        `a
    );

    `question`answers`correct!(
        "In .z.ps:{0N!list:3#value x;`messages insert list}, what does 3#value x do?";

        `a`b`c`d!(
            "Evaluates the incoming message and takes the first 3 elements of the resulting list";
            "Splits the message into 3 equal parts";
            "Repeats the evaluated message 3 times";
            "Rounds the evaluated message to 3 decimal places"
        );

        `a
    );

    `question`answers`correct!(
        "What does select `time$avg timeTaken by sendTime.minute from update sendTime-00:00:10.514 from messages do as a whole?";

        `a`b`c`d!(
            "Shifts sendTime by a fixed offset, then groups rows into one-minute buckets and computes the average timeTaken (cast to time) within each bucket";
            "Deletes all rows where timeTaken exceeds 10.514 seconds";
            "Sorts the messages table by sendTime in descending order";
            "Computes the total timeTaken across the whole table, ignoring minute buckets"
        );

        `a
    );

    `question`answers`correct!(
        "What does the by sendTime.minute clause specifically extract from the sendTime column for grouping?";

        `a`b`c`d!(
            "The minute component of each sendTime timestamp, used to bucket rows into one-minute groups";
            "The number of minutes elapsed since midnight as a float";
            "A boolean indicating whether sendTime falls on the minute exactly";
            "The minute of the current system time, not sendTime"
        );

        `a
    );

    `question`answers`correct!(
        "In cnt:0 followed by .z.ts:{cnt+:1; h:hopen 5000; h(cnt); hclose h}, what does h(cnt) do compared to (neg h)(cnt)?";

        `a`b`c`d!(
            "Sends cnt synchronously and blocks waiting for a reply, unlike neg h which would send it asynchronously";
            "Sends cnt asynchronously, identical in effect to neg h";
            "Sends cnt as a string rather than as a value";
            "Opens a new handle rather than reusing h"
        );

        `a
    );

    `question`answers`correct!(
        "What does system \"sleep 2\" do when run inside a message handler on the listener?";

        `a`b`c`d!(
            "Blocks the single-threaded q process for 2 seconds, delaying processing of the current and any queued messages";
            "Schedules a background sleep that doesn't block message processing";
            "Sleeps only the connection that triggered the handler, not the whole process";
            "Waits 2 seconds before opening the listening port"
        );

        `a
    );

    `question`answers`correct!(
        "What do .z.po:{stdout \"Connection established from handle \",string x;} and .z.pc:{stdout \"Connect lost to handle \",string x;} represent?";

        `a`b`c`d!(
            "Handlers that fire on connection open (.z.po) and connection close (.z.pc), logging the handle involved in each case";
            "Handlers that fire only when a synchronous request is received or times out";
            "Handlers used to open and close ports rather than individual connections";
            "Handlers that run once at process startup and shutdown, not per-connection"
        );

        `a
    );

    `question`answers`correct!(
        "In while[(not h:@[hopen;5000;0]) and count tms; ...], what does @[hopen;5000;0] achieve?";

        `a`b`c`d!(
            "Attempts to open a connection to port 5000, returning 0 instead of signaling an error if the attempt fails";
            "Opens a connection to port 5000 and immediately closes it";
            "Opens 0 connections to port 5000 as a no-op check";
            "Retries hopen exactly 5000 times before giving up"
        );

        `a
    );

    `question`answers`correct!(
        "What does the loop condition (not h:@[hopen;5000;0]) and count tms as a whole control?";

        `a`b`c`d!(
            "The loop continues retrying the connection as long as the last attempt failed (h is falsy) and there are still backoff times left in tms";
            "The loop continues until h successfully connects, ignoring tms entirely";
            "The loop runs exactly once regardless of h or tms";
            "The loop stops as soon as tms is non-empty, regardless of h"
        );

        `a
    );

    `question`answers`correct!(
        "What does stdout:{0N!(string .z.T),\" : \",x} do when called as stdout \"some message\"?";

        `a`b`c`d!(
            "Prints the current time followed by the given message string to standard output";
            "Writes the message to a log file named stdout";
            "Sends the message to every open connection";
            "Suppresses output unless x is non-empty"
        );

        `a
    );

    `question`answers`correct!(
        "What list does tms:2 xexp til 4 produce, and how is it used in the retry loop?";

        `a`b`c`d!(
            "1 2 4 8 (powers of 2), used as successive backoff wait times in seconds between reconnect attempts";
            "0 2 4 6, used as a fixed retry interval";
            "2 4 6 8, used as connection timeout values";
            "4 3 2 1, used as a countdown before giving up"
        );

        `a
    )
 );