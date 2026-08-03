//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxZ.medium:`zpcExampleMeaning`zpsVsZpgUsage`zvsSignature`zpwSignature`zacTupleMeaning`zzdVectorForm`zHvsZW`zpdBasicSetup`zTtdShorthand`zexitParamMeaning`zbmCallbackMeaning`zVersusZaInCallback!
    (
    `question`answers`correct!(
        "In .z.pc:{0N!(.z.a;.z.u;.z.w;x);x}, why are .z.a, .z.u and .z.w described as returning LOCAL values here rather than values describing the just-closed remote connection?";

        `a`b`c`d!(
            "Because .z.pc fires after the connection has already been closed, so there is no remote session left to describe — only the local process's own values are available";
            "Because .z.pc always ignores its environment variables and returns constants";
            "Because .z.a, .z.u and .z.w only work when called from the console, never in callbacks";
            "Because the argument x already contains the remote values, making the others redundant"
        );

        `a
    );

    `question`answers`correct!(
        "What determines whether .z.ps or .z.pg is invoked for an incoming message?";

        `a`b`c`d!(
            ".z.ps handles asynchronous requests (and requests sent via handle 0), while .z.pg handles synchronous requests";
            ".z.ps handles requests from the console, while .z.pg handles all IPC requests";
            ".z.ps handles HTTP requests, while .z.pg handles plain IPC requests";
            "They are interchangeable and either may fire for any message type"
        );

        `a
    );

    `question`answers`correct!(
        "In .z.vs:{0N!(x;y;value x)}, what do the parameters x and y represent when this callback fires after m[1;1]:0?";

        `a`b`c`d!(
            "x is the symbol of the modified variable (`m), and y is the index into it that was modified (1 1)";
            "x is the old value of the variable, and y is the new value";
            "x is the handle that made the change, and y is the variable's symbol";
            "x is the variable's new value, and y is a timestamp of the change"
        );

        `a
    );

    `question`answers`correct!(
        "What are the two arguments passed to .z.pw, and what type of value must it return?";

        `a`b`c`d!(
            "The user ID as a symbol and the password as a string; it must return a boolean atom indicating whether the connection is permitted";
            "The handle and the IP address; it must return a symbol representing the authenticated username";
            "The request text and header dictionary; it must return a two-item list";
            "The old password and new password; it must return the updated password string"
        );

        `a
    );

    `question`answers`correct!(
        "In a .z.ac implementation, what is the difference in meaning between returning (1;\"username\") and returning (4;\"\")?";

        `a`b`c`d!(
            "(1;\"username\") authorizes the request directly, setting .z.u to that username; (4;\"\") instead falls back to basic access authentication via the -u/-U file and .z.pw";
            "(1;\"username\") and (4;\"\") are equivalent, both authorizing the request with a default username";
            "(1;\"username\") rejects the request with a custom message; (4;\"\") authorizes it";
            "(1;\"username\") is only valid for WebSocket connections, while (4;\"\") is only valid for HTTP"
        );

        `a
    );

    `question`answers`correct!(
        "What does assigning .z.zd:17 2 4 (a plain three-item int vector) set as the default, compared to assigning a dictionary like ``a`b!(17 5 3;17 2 6;17 2 6)?";

        `a`b`c`d!(
            "The vector form sets one uniform default (logicalBlockSize;algorithm;level) for every column, while the dictionary form sets different parameters per named column, with the null-symbol key giving the default for unlisted columns";
            "The vector form only applies to numeric columns, while the dictionary form applies to symbol columns only";
            "The vector form is for encryption, while the dictionary form is for compression";
            "Both forms are functionally identical; the dictionary is just a more verbose way of writing the same defaults"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main practical difference between using .z.H and using .z.W to inspect active connections?";

        `a`b`c`d!(
            ".z.H is a lower-cost method returning just the list of active socket handles, while .z.W additionally returns the number of bytes waiting in each handle's output queue, at higher cost";
            ".z.H only works for websocket connections, while .z.W only works for plain TCP connections";
            ".z.H returns a dictionary, while .z.W returns a plain list";
            ".z.H is deprecated in favor of .z.W and should not be used"
        );

        `a
    );

    `question`answers`correct!(
        "In .z.pd:`u#hopen each 20000+til 4, what does prefixing the result with `u# accomplish, and why does it matter here?";

        `a`b`c`d!(
            "It applies the unique attribute to the resulting handle vector, which is required since .z.pd's returned int vector must have the unique attribute set";
            "It marks the handles as read-only so peach cannot close them";
            "It sorts the handles in ascending order before use";
            "It converts the handles from symbols to integers"
        );

        `a
    );

    `question`answers`correct!(
        "What do the shorthand definitions .z.T:`time$.z.Z and .z.D:`date$.z.Z represent?";

        `a`b`c`d!(
            "The time and date portions of the local datetime .z.Z, extracted via casting";
            "The time and date at which the process was started, cached at boot";
            "The time and date of the next scheduled timer tick";
            "UTC equivalents of .z.Z, unrelated to casting"
        );

        `a
    );

    `question`answers`correct!(
        "In .z.exit:f, what value is passed as the argument to f when the session exits via backslash backslash (manual quit) versus via exit 42?";

        `a`b`c`d!(
            "0 is passed for a manual backslash-backslash quit, while 42 is passed for exit 42, since the exit parameter is the argument given to exit (or 0 for manual exit)";
            "The same value, typically 0, is passed regardless of how the session exits";
            "1 is passed for manual quit, and -1 is passed for exit 42";
            "No argument is passed in either case; f is called niladic"
        );

        `a
    );

    `question`answers`correct!(
        "In the callback definition .z.bm:{`msg set (.z.p;x);}, what does x represent when a malformed IPC message triggers this callback?";

        `a`b`c`d!(
            "A 2-item list of the handle and the raw message bytes that failed validation";
            "The parsed q value that was successfully reconstructed from the message";
            "A boolean indicating whether the message was recoverable";
            "The error string 'badmsg itself"
        );

        `a
    );

    `question`answers`correct!(
        "Why does h\"\\\"i\\\"$0x0 vs .z.a\" return the client's remote IP address rather than the server's own IP, when h is a handle opened by the client to the server?";

        `a`b`c`d!(
            "Because the expression is executed on the server inside a callback invoked via that IPC connection, and in that context .z.a returns the IP of the client session that triggered it, not the server's own address";
            "Because vs always reverses the byte order of whichever IP is queried";
            "Because 0x0 forces .z.a to look up a hardcoded loopback address";
            "Because h always evaluates expressions on the client side, never the server"
        );

        `a
    )
 );