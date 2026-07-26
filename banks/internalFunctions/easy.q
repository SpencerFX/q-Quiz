//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions
// Difficulty : Easy
//
//====================================================================
.quiz.internalFunctions.easy:`negativeOne`negativeTwo`negativeEight`negativeNine`negativeEleven`bangOperator`serialize`deserialize`consoleOutput`workspace`systemCommand`zP`zD`zT`zW`dotQw`memoryStats`loadScript`saveTable`systemNamespace!
    (
    `question`answers`correct!(
        "What is the primary purpose of -1 in q?";

        `a`b`c`d!(
            "Print output to the console";
            "Open an IPC connection";
            "Serialize data";
            "Load a script"
        );

        `a
    );

    `question`answers`correct!(
        "What is -2 commonly used for?";

        `a`b`c`d!(
            "Print output to stderr";
            "Open a socket";
            "Save a table";
            "Exit q"
        );

        `a
    );

    `question`answers`correct!(
        "What does -8! primarily do?";

        `a`b`c`d!(
            "Deserialize data";
            "Compress tables";
            "Serialize data";
            "Load namespaces"
        );

        `c
    );

    `question`answers`correct!(
        "What does -9! primarily do?";

        `a`b`c`d!(
            "Deserialize serialized data";
            "Delete symbols";
            "Save an HDB";
            "Connect to another process"
        );

        `a
    );

    `question`answers`correct!(
        "What is -11! most commonly associated with?";

        `a`b`c`d!(
            "IPC and serialization internals";
            "Table joins";
            "CSV loading";
            "Sorting lists"
        );

        `a
    );

    `question`answers`correct!(
        "In q, the ! operator is commonly used to create a:";

        `a`b`c`d!(
            "Dictionary";
            "Table";
            "Namespace";
            "Projection"
        );

        `a
    );

    `question`answers`correct!(
        "Serialization converts q objects into:";

        `a`b`c`d!(
            "A byte stream";
            "A CSV file";
            "A table";
            "A symbol"
        );

        `a
    );

    `question`answers`correct!(
        "Deserialization converts a byte stream back into:";

        `a`b`c`d!(
            "A q object";
            "A socket";
            "A namespace";
            "A script"
        );

        `a
    );

    `question`answers`correct!(
        "Which function is commonly used to print text to the console?";

        `a`b`c`d!(
            "-1";
            ".z.P";
            ".Q.w";
            "system"
        );

        `a
    );

    `question`answers`correct!(
        ".Q.w primarily returns information about:";

        `a`b`c`d!(
            "Workspace and memory usage";
            "Current date";
            "Current user";
            "Current namespace"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword executes operating system commands?";

        `a`b`c`d!(
            "system";
            "exec";
            "shell";
            "run"
        );

        `a
    );

    `question`answers`correct!(
        ".z.P returns the current:";

        `a`b`c`d!(
            "Timestamp";
            "Port";
            "PID";
            "Namespace"
        );

        `a
    );

    `question`answers`correct!(
        ".z.D returns the current:";

        `a`b`c`d!(
            "Date";
            "Dictionary";
            "Database";
            "Directory"
        );

        `a
    );

    `question`answers`correct!(
        ".z.T returns the current:";

        `a`b`c`d!(
            "Time";
            "Table";
            "Timer interval";
            "Timezone"
        );

        `a
    );

    `question`answers`correct!(
        "Within an IPC callback, .z.W contains the current:";

        `a`b`c`d!(
            "Connection handle";
            "Workspace";
            "Working directory";
            "Window size"
        );

        `a
    );

    `question`answers`correct!(
        "Which namespace contains many useful utility functions supplied with q?";

        `a`b`c`d!(
            ".Q";
            ".K";
            ".H";
            ".U"
        );

        `a
    );

    `question`answers`correct!(
        "Why might a developer inspect .Q.w?";

        `a`b`c`d!(
            "To monitor memory usage";
            "To execute SQL";
            "To enumerate symbols";
            "To sort a table"
        );

        `a
    );

    `question`answers`correct!(
        "Which command is commonly used to load another q script?";

        `a`b`c`d!(
            "\\l";
            "\\cd";
            "\\ts";
            "\\v"
        );

        `a
    );

    `question`answers`correct!(
        "What is the normal way to persist a table to disk in q?";

        `a`b`c`d!(
            "Save the table to a file or database directory";
            "Serialize it with -8! only";
            "Print it with -1";
            "Use .z.P"
        );

        `a
    );

    `question`answers`correct!(
        "The system namespace in q is accessed using:";

        `a`b`c`d!(
            "system";
            ".sys";
            ".system";
            ".os"
        );

        `a
    )

 );
//====================================================================