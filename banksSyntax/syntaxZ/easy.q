//====================================================================
//
// q-Quiz
//
// Topic      : The .z Namespace — Syntax Focus
// Source     : "The .z namespace" (code.kx.com/q/ref/dotz)
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxZ.easy:`zaBasic`zhBasic`ziBasic`zpBasic`zPBasic`zuBasic`zwBasic`callbackAssignSyntax`unsetCallbackSyntax`zsSelfRef`ztsTimerBasic`zfFileBasic!
    (
    `question`answers`correct!(
        "What does .z.a return, when NOT invoked inside an IPC callback?";

        `a`b`c`d!(
            "The current process's own IP address, as a 32-bit integer";
            "The IP address of the most recently connected client";
            "A list of all IP addresses currently connected to the process";
            "The IP address as a dotted-decimal string"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.h return?";

        `a`b`c`d!(
            "The host name of the current machine, as a symbol";
            "The IP address of the current host, as an integer";
            "The host name of the most recently connected client";
            "A boolean indicating whether the host is reachable"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.i return?";

        `a`b`c`d!(
            "The process ID of the current kdb+ session, as an integer";
            "The number of active IPC handles";
            "The number of physical cores available";
            "The internal build ID of the kdb+ executable"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.p return?";

        `a`b`c`d!(
            "The current UTC time as a timestamp (nanosecond precision)";
            "The current local time as a timestamp";
            "The UTC time as a datetime atom, not a timestamp";
            "The process's start time as a timestamp"
        );

        `a
    );

    `question`answers`correct!(
        "How does .z.P differ from .z.p?";

        `a`b`c`d!(
            ".z.P returns local time as a timestamp, while .z.p returns UTC time as a timestamp";
            ".z.P returns UTC time, while .z.p returns local time — the reverse of the actual behavior";
            ".z.P returns a timespan, while .z.p returns a timestamp";
            "They are identical; .z.P is just a deprecated alias for .z.p"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.u return when called from handle 0 (the console)?";

        `a`b`c`d!(
            "The user ID under which the current process is running, as a symbol";
            "The null symbol, since handle 0 has no associated user";
            "The user ID of the most recently connected remote client";
            "A list of all user IDs currently connected"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.w return when called directly from the session console (not inside a callback)?";

        `a`b`c`d!(
            "0i, representing the current session's own handle";
            "The null symbol, since there is no remote connection";
            "The handle of the most recently opened connection";
            "-1i, indicating no handle is active"
        );

        `a
    );

    `question`answers`correct!(
        "What does the assignment .z.pg:f do, where f is a unary function?";

        `a`b`c`d!(
            "Registers f as the callback invoked with the object passed via a synchronous IPC request, with f's return value sent back to the caller";
            "Registers f to run once when the process starts up";
            "Registers f as the callback for asynchronous requests, discarding its return value";
            "Registers f to run every time a websocket message arrives"
        );

        `a
    );

    `question`answers`correct!(
        "What does running backslash-x .z.pg do?";

        `a`b`c`d!(
            "Deletes the custom .z.pg definition, restoring the default behavior";
            "Displays the current definition of .z.pg without changing it";
            "Executes .z.pg immediately with no arguments";
            "Permanently disables synchronous requests on this process"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.s refer to inside a function body, as used in {$[x<=0;1;x*.z.s x-1]}?";

        `a`b`c`d!(
            "A reference to the current function itself, allowing it to call itself recursively";
            "The name of the function as a symbol";
            "The handle of the process that called this function";
            "The source code text of the function as a string"
        );

        `a
    );

    `question`answers`correct!(
        "What triggers .z.ts to be evaluated, once it has been assigned a unary function?";

        `a`b`c`d!(
            "Ticks of the interval set by the backslash-t system command";
            "Every synchronous request received by the process";
            "Every time a new IPC connection is opened";
            "Every console input line, regardless of timer settings"
        );

        `a
    );

    `question`answers`correct!(
        "What does .z.f return, given the process was started with q test.q?";

        `a`b`c`d!(
            "The symbol `test.q, the name of the script that was loaded";
            "The full raw command line used to start the process";
            "The current working directory as a symbol";
            "A boolean indicating whether a script was passed at startup"
        );

        `a
    )
 );