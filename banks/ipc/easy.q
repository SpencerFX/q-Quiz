//====================================================================
//
// q-Quiz
//
// Topic      : IPC
// Difficulty : Easy
//
//====================================================================
.quiz.ipc.easy:`ipcMeaning`ipcPurpose`syncMessage`asyncMessage`handle`negHandle`remoteFunction`responseWait`dotZW`hopen`hclose`messageTypes`clientServer`serialization`processCommunication`localhost`syncSyntax`asyncSyntax`connectionFailure`portNumber!
    (
    `question`answers`correct!(
        "What does IPC stand for?";
        `a`b`c`d!(
            "Internal Process Communication";
            "Inter-Process Communication";
            "Internet Protocol Connection";
            "Internal Program Control"
        );
        `b
    );

    `question`answers`correct!(
        "What is the primary purpose of IPC in q?";
        `a`b`c`d!(
            "Compress tables";
            "Allow processes to communicate";
            "Speed up vector operations";
            "Store historical data"
        );
        `b
    );

    `question`answers`correct!(
        "What does a synchronous IPC call do?";
        `a`b`c`d!(
            "Returns immediately";
            "Waits for a response";
            "Broadcasts to every process";
            "Writes to disk"
        );
        `b
    );

    `question`answers`correct!(
        "What does an asynchronous IPC call do?";
        `a`b`c`d!(
            "Waits for a reply";
            "Returns immediately without waiting";
            "Writes to the HDB";
            "Closes the connection"
        );
        `b
    );

    `question`answers`correct!(
        "What is a handle in q?";
        `a`b`c`d!(
            "A table";
            "A connection to another process";
            "A dictionary";
            "A namespace"
        );
        `b
    );

    `question`answers`correct!(
        "What does a negative handle indicate when sending a message?";
        `a`b`c`d!(
            "The connection failed";
            "An asynchronous message";
            "A synchronous message";
            "A closed socket"
        );
        `b
    );

    `question`answers`correct!(
        "What can be executed on a remote q process using IPC?";
        `a`b`c`d!(
            "Only SQL queries";
            "Only built-in functions";
            "Functions and expressions";
            "Only table updates"
        );
        `c
    );

    `question`answers`correct!(
        "After making a synchronous IPC request, what happens?";
        `a`b`c`d!(
            "Execution continues immediately";
            "The caller waits for a reply";
            "The connection closes";
            "The request is discarded"
        );
        `b
    );

    `question`answers`correct!(
        "Which special variable contains the handle of the current IPC connection?";
        `a`b`c`d!(
            ".z.P";
            ".z.W";
            ".z.H";
            ".z.K"
        );
        `b
    );

    `question`answers`correct!(
        "Which function opens a connection to another q process?";
        `a`b`c`d!(
            "connect";
            "hopen";
            "open";
            "listen"
        );
        `b
    );

    `question`answers`correct!(
        "How is an IPC connection typically closed?";
        `a`b`c`d!(
            "delete";
            "close";
            "hclose";
            "disconnect"
        );
        `c
    );

    `question`answers`correct!(
        "IPC is primarily used between:";
        `a`b`c`d!(
            "Functions";
            "Processes";
            "Columns";
            "Namespaces"
        );
        `b
    );

    `question`answers`correct!(
        "In a typical kdb+ system, clients communicate with:";
        `a`b`c`d!(
            "CSV files";
            "Other users";
            "Server processes";
            "The compiler"
        );
        `c
    );

    `question`answers`correct!(
        "Before data is sent over IPC it is:";
        `a`b`c`d!(
            "Compressed into CSV";
            "Serialized";
            "Converted to XML";
            "Sorted"
        );
        `b
    );

    `question`answers`correct!(
        "IPC allows communication between:";
        `a`b`c`d!(
            "Different q processes";
            "Only functions in one process";
            "Only HDB partitions";
            "Only tables"
        );
        `a
    );

    `question`answers`correct!(
        "Which host name refers to the local machine?";
        `a`b`c`d!(
            "home";
            "localhost";
            "127";
            "machine"
        );
        `b
    );

    `question`answers`correct!(
        "Which handle is used for a synchronous request?";
        `a`b`c`d!(
            "A positive handle";
            "A negative handle";
            "A symbol";
            "A dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "Which handle is used for an asynchronous request?";
        `a`b`c`d!(
            "A positive handle";
            "A negative handle";
            "Handle 0";
            "No handle"
        );
        `b
    );

    `question`answers`correct!(
        "If a connection cannot be established, q typically:";
        `a`b`c`d!(
            "Silently retries forever";
            "Returns a null table";
            "Signals an error";
            "Starts another process"
        );
        `c
    );

    `question`answers`correct!(
        "What identifies a listening q process on a machine?";
        `a`b`c`d!(
            "Its namespace";
            "Its port number";
            "Its process ID";
            "Its table name"
        );
        `b
    )

 );
//====================================================================