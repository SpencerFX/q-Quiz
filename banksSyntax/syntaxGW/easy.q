//====================================================================
//
// q-Quiz
//
// Topic      : Query Routing (Load Balancer / Gateway Framework) — Syntax Focus
// Source     : "Query Routing: A kdb+ framework for a scalable, load balanced system"
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxGW.easy:`pPortCmd`negFlushPattern`chainedHandleAssign`resourcesTableDef`addResourceUpsert`queryTableColumns`userQueryValidation`seqNumIncrement`nlbAsyncSend`allocNullCheck`returnResLookup`ztsOnceAtStartup`timerViaValueString`tTimeoutCmd!
    (
    `question`answers`correct!(
        "What does backslash-p 5555, run at the top of a script, do?";

        `a`b`c`d!(
            "Sets the process to listen for incoming connections on port 5555";
            "Opens a connection to a remote process on port 5555";
            "Sets a query timeout of 5555 milliseconds";
            "Pings port 5555 to check if it is reachable"
        );

        `a
    );

    `question`answers`correct!(
        "In gw:{h:hopen x;{(neg x)(`userQuery;y);x[]}[h]}[`:localhost:5555], what do (neg x)(`userQuery;y) and the following x[] do together?";

        `a`b`c`d!(
            "(neg x)(...) sends the request asynchronously over handle x, and the bare x[] call then blocks to receive the deferred synchronous reply";
            "(neg x)(...) sends the request synchronously, and x[] closes the handle afterward";
            "(neg x)(...) opens the connection, and x[] sends the actual query";
            "Both calls are equivalent; x[] simply repeats the same async send as a retry"
        );

        `a
    );

    `question`answers`correct!(
        "What does manageConn:{@[{NLB::neg LB::hopen x};`:localhost:1234;{show x}]} set up, focusing on the chained assignment NLB::neg LB::hopen x?";

        `a`b`c`d!(
            "LB is set to the synchronous handle from hopen, and NLB is set to the negative of that same handle, for use in asynchronous sends";
            "LB and NLB are set to two independent handles opened by two separate hopen calls";
            "NLB is set first, and LB is derived from it by negation";
            "LB is a boolean flag, and NLB is the actual handle"
        );

        `a
    );

    `question`answers`correct!(
        "What does resources:([address:()] source:();sh:()) define?";

        `a`b`c`d!(
            "An empty table keyed on address, with source and sh as data columns";
            "An empty table keyed on both source and sh";
            "A dictionary mapping address to a two-item list";
            "A function named resources taking no arguments"
        );

        `a
    );

    `question`answers`correct!(
        "In addResource:{`resources upsert `address xkey update sh:{hopen first x}each address from x}, what does the update sh:{hopen first x}each address from x portion do?";

        `a`b`c`d!(
            "Opens a connection handle for each row's address and stores it in a new sh column";
            "Deletes the sh column from the incoming table x";
            "Renames the address column to sh";
            "Counts how many addresses are present in x"
        );

        `a
    );

    `question`answers`correct!(
        "In the gateway's queryTable schema, what do the columns rec, snt and ret represent?";

        `a`b`c`d!(
            "Timestamps for when the query was received, when it was sent to a service, and when results were returned to the user, respectively";
            "Record count, sent-byte count, and return-byte count, respectively";
            "The receiving handle, sending handle, and returning handle, respectively";
            "Boolean flags for received, sent and returned status, respectively"
        );

        `a
    );

    `question`answers`correct!(
        "In userQuery, what does the condition (serv:x 0) in exec distinct source from resources check?";

        `a`b`c`d!(
            "Whether the requested service name (the first item of the user's argument) matches a known, registered resource source";
            "Whether the user's handle is already present in the resources table";
            "Whether the query string itself is non-empty";
            "Whether the sequence number has already been used"
        );

        `a
    );

    `question`answers`correct!(
        "What does SEQ+:1 accomplish when used inside the row being appended to queryTable?";

        `a`b`c`d!(
            "Increments the shared sequence-number counter and uses the new value as this query's unique sq value";
            "Adds 1 to every existing sq value already in queryTable";
            "Resets the sequence counter back to 1 for a new user session";
            "Counts how many queries are currently queued"
        );

        `a
    );

    `question`answers`correct!(
        "What does NLB(`requestService;SEQ;serv) do, as the final step of userQuery for a valid service?";

        `a`b`c`d!(
            "Asynchronously sends a requestService message to the Load Balancer, passing the new sequence number and the requested service name";
            "Synchronously blocks until the Load Balancer responds with an allocated resource";
            "Registers a brand new service under the name serv";
            "Closes the connection to the Load Balancer"
        );

        `a
    );

    `question`answers`correct!(
        "In serviceAlloc, what does the check $[null queryTable[sq;`uh]; ...] test for, and what does a true result imply?";

        `a`b`c`d!(
            "Whether the user handle for this query is null, implying the user has since disconnected from the gateway before a resource could be allocated";
            "Whether the query string itself is empty";
            "Whether the service address is null, implying the resource is not yet connected";
            "Whether the sequence number sq itself failed to be generated"
        );

        `a
    );

    `question`answers`correct!(
        "In returnRes, what does uh:first exec uh from queryTable where sq=(res 0) retrieve?";

        `a`b`c`d!(
            "The user's connection handle, looked up from queryTable using the sequence number carried in the incoming result message";
            "The handle of the service that produced the result";
            "The total count of queries this user has sent";
            "The timestamp at which the query was originally received"
        );

        `a
    );

    `question`answers`correct!(
        "Why is .z.ts[] explicitly called once at the bottom of the gateway/service scripts, in addition to .z.ts being assigned as a callback?";

        `a`b`c`d!(
            "To trigger the initial connection/registration logic immediately on script startup, rather than waiting for the first timer tick to fire on its own";
            "To permanently disable the timer after the first call";
            "To test that .z.ts is syntactically valid before the script continues";
            "Because .z.ts must be called manually every time; it is never invoked by the timer itself"
        );

        `a
    );

    `question`answers`correct!(
        "What does value\"backslash-t 10000\" (executing the string form of the system command) do?";

        `a`b`c`d!(
            "Sets the timer to fire every 10000 milliseconds, invoking .z.ts on each tick";
            "Pauses the process for 10000 milliseconds before continuing";
            "Sets the query timeout to 10000 milliseconds for the next query only";
            "Immediately calls .z.ts 10000 times in a row"
        );

        `a
    );

    `question`answers`correct!(
        "What does backslash-T 10, set at the top of the example service, do?";

        `a`b`c`d!(
            "Sets a per-query execution timeout of 10 seconds, after which a running query is stopped";
            "Sets the timer interval to 10 seconds";
            "Limits the service to accepting only 10 concurrent connections";
            "Delays the service's startup by 10 seconds"
        );

        `a
    )
 );
