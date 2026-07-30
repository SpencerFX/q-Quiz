//====================================================================
//
// q-Quiz
//
// Topic      : .Q Internals
// Difficulty : Easy
//
//====================================================================
.quiz.Q.easy:`Qdpft`Qen`Qpar`Qchk`Qview`Qind`Qid`Qty`Qfmt`Qopt`Qfc`Qcn`Qhost`Qaddr`Qx`Qs1`Qs`Qw`Qgc`Qres!
    (
    `question`answers`correct!(
        "Which .Q function is commonly used to write a partitioned table to disk?";

        `a`b`c`d!(
            ".Q.dpft";
            ".Q.en";
            ".Q.chk";
            ".Q.gc"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of .Q.en?";

        `a`b`c`d!(
            "Enumerate symbols against a sym file";
            "Encrypt a table";
            "Sort a table";
            "Compress a table"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function constructs the path to a partitioned table?";

        `a`b`c`d!(
            ".Q.par";
            ".Q.view";
            ".Q.gc";
            ".Q.ind"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.chk primarily do?";

        `a`b`c`d!(
            "Ensures partitioned database consistency";
            "Checks IPC connections";
            "Validates syntax";
            "Compacts memory"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function is commonly used to create an in-memory view of a table?";

        `a`b`c`d!(
            ".Q.view";
            ".Q.en";
            ".Q.par";
            ".Q.fc"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function returns the indices that satisfy a condition?";

        `a`b`c`d!(
            ".Q.ind";
            ".Q.id";
            ".Q.ty";
            ".Q.chk"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of .Q.id?";

        `a`b`c`d!(
            "Generate or retrieve unique identifiers";
            "Return process memory";
            "Create dictionaries";
            "Read compressed files"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function returns information about datatypes?";

        `a`b`c`d!(
            ".Q.ty";
            ".Q.par";
            ".Q.gc";
            ".Q.addr"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q utility is commonly used for formatting values as strings?";

        `a`b`c`d!(
            ".Q.fmt";
            ".Q.en";
            ".Q.chk";
            ".Q.host"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function helps parse command-line options?";

        `a`b`c`d!(
            ".Q.opt";
            ".Q.dpft";
            ".Q.gc";
            ".Q.view"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q utility is commonly used when reading CSV files?";

        `a`b`c`d!(
            ".Q.fc";
            ".Q.en";
            ".Q.id";
            ".Q.addr"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.cn primarily return?";

        `a`b`c`d!(
            "Column names";
            "Connection handles";
            "Compression levels";
            "CPU count"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function returns the current hostname?";

        `a`b`c`d!(
            ".Q.host";
            ".Q.addr";
            ".Q.gc";
            ".Q.chk"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function returns the machine's IP address information?";

        `a`b`c`d!(
            ".Q.addr";
            ".Q.host";
            ".Q.id";
            ".Q.opt"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q variable is commonly used by tickerplant processes to identify subscribers?";

        `a`b`c`d!(
            ".Q.x";
            ".Q.id";
            ".Q.cn";
            ".Q.ty"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function formats timestamps into ISO-style strings?";

        `a`b`c`d!(
            ".Q.s1";
            ".Q.gc";
            ".Q.chk";
            ".Q.dpft"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function is a more general string formatting helper?";

        `a`b`c`d!(
            ".Q.s";
            ".Q.en";
            ".Q.par";
            ".Q.view"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function reports workspace or memory usage information?";

        `a`b`c`d!(
            ".Q.w";
            ".Q.chk";
            ".Q.host";
            ".Q.cn"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q function requests garbage collection?";

        `a`b`c`d!(
            ".Q.gc";
            ".Q.en";
            ".Q.par";
            ".Q.addr"
        );

        `a
    );

    `question`answers`correct!(
        "Which .Q utility is commonly used to inspect runtime resource usage?";

        `a`b`c`d!(
            ".Q.res";
            ".Q.fc";
            ".Q.dpft";
            ".Q.id"
        );

        `a
    )
 );
//====================================================================