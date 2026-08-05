//====================================================================
//
// q-Quiz
//
// Topic      : .z Internals
// Difficulty : Medium
//
//====================================================================
.quiz.Z.medium:`zpg`zps`zpw`zpi`zpoConnection`zpcConnection`zTimer`zTimestamp`zHandle`zClientAddress`zExit`zDateTime`zCallbacks`zIPC`zStartup!
    (
    `question`answers`correct!(
        "Which callback should be overridden to intercept synchronous IPC requests?";

        `a`b`c`d!(
            ".z.pg";
            ".z.ps";
            ".z.po";
            ".z.pc"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback processes asynchronous IPC messages?";

        `a`b`c`d!(
            ".z.ps";
            ".z.pg";
            ".z.ts";
            ".z.pc"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback is used to authenticate incoming IPC connections?";

        `a`b`c`d!(
            ".z.pw";
            ".z.pg";
            ".z.po";
            ".z.pc"
        );

        `a
    );

    `question`answers`correct!(
        "What should .z.pw return after successful authentication?";

        `a`b`c`d!(
            "1b";
            "The username";
            "The password";
            "The client handle"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback executes immediately after a successful IPC connection is established?";

        `a`b`c`d!(
            ".z.po";
            ".z.pc";
            ".z.pg";
            ".z.ps"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback executes after an IPC connection has been closed?";

        `a`b`c`d!(
            ".z.pc";
            ".z.po";
            ".z.pw";
            ".z.pg"
        );

        `a
    );

    `question`answers`correct!(
        "How is .z.ts normally triggered?";

        `a`b`c`d!(
            "By setting the timer using system\"t ...\"";
            "Whenever an IPC message arrives";
            "Whenever memory usage changes";
            "After every insert"
        );

        `a
    );

    `question`answers`correct!(
        "During execution of .z.pg, which variable identifies the requesting client?";

        `a`b`c`d!(
            ".z.w";
            ".z.h";
            ".z.a";
            ".z.i"
        );

        `b
    );

    `question`answers`correct!(
        "Which .z variable would typically be logged alongside .z.pg requests for auditing remote clients?";

        `a`b`c`d!(
            ".z.a";
            ".z.T";
            ".z.N";
            ".z.o"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback is typically overridden to perform periodic maintenance tasks?";

        `a`b`c`d!(
            ".z.ts";
            ".z.pg";
            ".z.ps";
            ".z.po"
        );

        `a
    );

    `question`answers`correct!(
        "Which combination is commonly used to timestamp incoming IPC requests?";

        `a`b`c`d!(
            ".z.P and .z.h";
            ".z.D and .z.N";
            ".z.w and .z.a";
            ".z.l and .z.o"
        );

        `a
    );

    `question`answers`correct!(
        "Which callback should NOT normally contain long-running computations because it delays synchronous IPC responses?";

        `a`b`c`d!(
            ".z.pg";
            ".z.pc";
            ".z.po";
            ".z.pw"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of .z.exit?";

        `a`b`c`d!(
            "Execute cleanup logic before the process terminates";
            "Authenticate IPC users";
            "Schedule timer events";
            "Reload the HDB"
        );

        `a
    );

    `question`answers`correct!(
        "Which category best describes most .z symbols?";

        `a`b`c`d!(
            "Runtime variables and callback hooks";
            "Compression utilities";
            "Database administration commands";
            "Functional SQL helpers"
        );

        `a
    );

    `question`answers`correct!(
        "Why are .z callbacks heavily used in tickerplant and RDB architectures?";

        `a`b`c`d!(
            "They allow applications to react automatically to runtime events";
            "They improve compression ratios";
            "They replace qSQL";
            "They automatically partition databases"
        );

        `a
    )
 );
//====================================================================