//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxZ.hard:`fullExitExampleTrio`fullPdSetupFunction`zzdExtensionWorkaround`fullVsMatrixExample`acDecisionMatching`zwFormatChangePick`fullBmSequence`zeInvokedViaZw`zaUnixDomainSocket`zXvsZx`zKvsZk`peachHandleRestriction!
    (
    `question`answers`correct!(
        "Given .z.exit:{0N!x}, which sequence of results correctly matches: (1) a manual backslash-backslash quit, (2) exit 42, and (3) exit 0, in that order?";

        `a`b`c`d!(
            "0 , then 42 , then 0";
            "1 , then 42 , then 0";
            "0 , then 0 , then 42";
            "42 , then 42 , then 0"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z.pd definition correctly reproduces the paper's more comprehensive setup, reusing existing handles if the count matches, otherwise closing and reopening the correct number of unique-attributed handles?";

        `a`b`c`d!(
            ".z.pd:{n:abs system\"s\";$[n=count handles;handles;[hclose each handles;:handles::`u#hopen each 20000+til n]]}";
            ".z.pd:{n:abs system\"s\"; handles::`u#hopen each 20000+til n}";
            ".z.pd:{hclose each handles; handles::`u#hopen each 20000+til abs system\"s\"}";
            ".z.pd:{n:count handles; handles::`u#hopen each 20000+til n}"
        );

        `a
    );

    `question`answers`correct!(
        "Given .z.zd:17 2 4 is set, which block correctly demonstrates the workaround needed to compress a file whose name contains an extension (a '.' in the filename)?";

        `a`b`c`d!(
            "`:file.something set til 1000  fails to compress under .z.zd alone, so instead use (`:file.something;17;2;4) set til 1000 to pass the compression settings explicitly on creation";
            "`:file.something set til 1000  compresses correctly under .z.zd exactly like extensionless files, no workaround needed";
            "Extension files can never be compressed in kdb+, regardless of method used";
            "Set .z.zd to a dictionary keyed by file extension instead of a plain vector to fix this automatically"
        );

        `a
    );

    `question`answers`correct!(
        "Given .z.vs:{0N!(x;y;value x)}, m:(1 2;3 4), and then m[1;1]:0, which result correctly matches what .z.vs reports?";

        `a`b`c`d!(
            "(`m;1 1;(1 2;3 0))";
            "(`m;();1 2 3 4)";
            "(`m;0;(1 2;3 4))";
            "(`m;1 1;0)"
        );

        `a
    );

    `question`answers`correct!(
        "A kdb+ HTTP process wants to authenticate using a custom OAuth check in .z.ac, and reject unauthenticated users with the default 401 response (no custom body) rather than allowing any fallback. Which return value from .z.ac correctly matches this requirement?";

        `a`b`c`d!(
            "(0;\"\")";
            "(1;\"\")";
            "(2;\"\")";
            "(4;\"\")"
        );

        `a
    );

    `question`answers`correct!(
        "Since v4.1 2023.09.15, how did the return format of .z.W change, and what does sum each .z.W do to remain compatible with the older format's semantics?";

        `a`b`c`d!(
            ".z.W changed from handles mapped to a list of individual message sizes, to handles mapped to a single total-bytes integer (I!J); sum each .z.W reduces the older per-message list format down to that same single total";
            ".z.W changed from a single total-bytes integer per handle to a list of individual message sizes; sum each .z.W is now unnecessary and was only needed pre-4.1";
            ".z.W changed from a dictionary to a plain list of handles; sum each .z.W now counts the handles instead of bytes";
            "There was no change to .z.W's format across versions; sum each .z.W has always been required"
        );

        `a
    );

    `question`answers`correct!(
        "Which sequence correctly describes what happens, in order, when kdb+ receives a malformed IPC message from a sender?";

        `a`b`c`d!(
            ".z.bm is called with (handle;msgBytes), then the handle is closed and .z.pc is called, then 'badmsg is signaled";
            "'badmsg is signaled immediately, then .z.bm is called for logging purposes only";
            "The handle is closed first, then .z.bm is called with the handle only (no message bytes), then .z.pc fires";
            ".z.pc is called first to clean up, then .z.bm receives the message, then the handle is closed"
        );

        `a
    );

    `question`answers`correct!(
        "In .z.po:{show\"SSL server connection info:\";show .z.e;show\"SSL client connection info:\";show .z.w\".z.e\"}, what is the purpose of the .z.w\".z.e\" call specifically, as opposed to just calling .z.e again?";

        `a`b`c`d!(
            "It sends a synchronous request back over the connection (via the handle .z.w) asking the CLIENT to run .z.e itself, retrieving the client's view of the TLS connection rather than the server's own view";
            "It is functionally identical to calling .z.e a second time, just written differently for style";
            "It closes the connection immediately after printing the server's TLS info";
            "It converts the server's TLS info into a string representation for display"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.a return when a connection is opened via a Unix Domain Socket, e.g. h:hopen `:unix://1234, and h\".z.a\" is then run?";

        `a`b`c`d!(
            "0i";
            "127 0 0 1i";
            "The same non-zero integer returned for a TCP loopback connection";
            "A 'domain error, since .z.a is not supported over Unix domain sockets"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference between .z.X and .z.x, given a process started with q somefile.q -customarg 42 -p localhost:17200?";

        `a`b`c`d!(
            ".z.X returns the full raw, unfiltered command line including the invocation name and script; .z.x returns only the user-supplied command-line arguments, excluding the script name and q's own single-letter options";
            ".z.X and .z.x are identical, differing only in case sensitivity";
            ".z.X returns arguments as a dictionary, while .z.x returns them as a flat string";
            ".z.X only includes single-letter options, while .z.x only includes the script name"
        );

        `a
    );

    `question`answers`correct!(
        "What is the relationship between .z.K and .z.k, and why might a session check .z.k against .Q.k at startup?";

        `a`b`c`d!(
            ".z.K is the major version number as a float, while .z.k is the release date of that version; startup checks .z.k against .Q.k to ensure the executable and the version of q.k being loaded are compatible";
            ".z.K and .z.k are the same value, one for the console and one for scripts; the check just confirms both agree";
            ".z.K is the release date, while .z.k is the version number — the reverse of the actual behavior";
            ".z.K and .z.k are unrelated; .z.K is a kernel setting and .z.k is a keyboard-locale flag"
        );

        `a
    );

    `question`answers`correct!(
        "According to the documentation, what is disabled in V4.1t regarding .z.pd, and what should be used as an alternative inside a peach call?";

        `a`b`c`d!(
            "Using handles directly within peach (e.g. {x\"\"}peach H) is not supported; one-shot IPC requests should be used within peach instead";
            "The .z.pd variable itself is removed entirely and must be replaced with -38!";
            "Load balancing via .z.pd is disabled, forcing all peach calls to run single-threaded";
            "Only the unique attribute requirement on .z.pd's handle vector is dropped; everything else still works as before"
        );

        `a
    )
 );
//====================================================================