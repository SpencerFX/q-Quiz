//====================================================================
//
// q-Quiz
//
// Topic      : .z Internals
// Difficulty : Easy
//
//====================================================================
.quiz.z.easy:`zD`zT`zP`zN`zts`zpc`zpo`zw`zh`zi`zo`zl`za`ze`zd!
    (
    `question`answers`correct!(
        "Which .z variable returns the current date?";

        `a`b`c`d!(
            ".z.D";
            ".z.T";
            ".z.P";
            ".z.N"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable returns the current time?";

        `a`b`c`d!(
            ".z.T";
            ".z.D";
            ".z.P";
            ".z.N"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable returns the current timestamp?";

        `a`b`c`d!(
            ".z.P";
            ".z.D";
            ".z.T";
            ".z.N"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable returns the current timespan since midnight?";

        `a`b`c`d!(
            ".z.N";
            ".z.P";
            ".z.D";
            ".z.T"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z callback is executed whenever a timer fires?";

        `a`b`c`d!(
            ".z.ts";
            ".z.pc";
            ".z.po";
            ".z.pg"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z callback is invoked when an IPC connection is opened?";

        `a`b`c`d!(
            ".z.po";
            ".z.pc";
            ".z.ts";
            ".z.ps"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z callback is invoked when an IPC connection is closed?";

        `a`b`c`d!(
            ".z.pc";
            ".z.po";
            ".z.ts";
            ".z.pg"
        );

        `a
    );

    `question`answers`correct!(
        "What information does .z.w return?";

        `a`b`c`d!(
            "Workspace (memory) statistics";
            "The current working directory";
            "The current process ID";
            "The current timer interval"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable contains the handle of the current IPC connection while processing a request?";

        `a`b`c`d!(
            ".z.w";
            ".z.h";
            ".z.i";
            ".z.o"
        );

        `b
    );

    `question`answers`correct!(
        "Which .z variable identifies the process handle for stdin/stdout?";

        `a`b`c`d!(
            ".z.h";
            ".z.o";
            ".z.l";
            ".z.D"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable stores the process start time?";

        `a`b`c`d!(
            ".z.i";
            ".z.P";
            ".z.N";
            ".z.T"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable returns the operating system name?";

        `a`b`c`d!(
            ".z.o";
            ".z.l";
            ".z.a";
            ".z.w"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable indicates whether q is running in 32-bit or 64-bit mode?";

        `a`b`c`d!(
            ".z.l";
            ".z.o";
            ".z.i";
            ".z.h"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable returns the IP address of the current client connection?";

        `a`b`c`d!(
            ".z.a";
            ".z.w";
            ".z.P";
            ".z.N"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z variable contains the command-line arguments used to start the current q process?";

        `a`b`c`d!(
            ".z.d";
            ".z.x";
            ".z.z";
            ".z.l"
        );

        `a
    )
 );
//====================================================================