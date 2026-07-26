//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions
// Difficulty : Hard
//
//====================================================================
.quiz.internalFunctions.hard:`serializationTypes`ipcProtocol`compressedIPC`workspaceGrowth`memoryLeaks`symbolEnumeration`debugLogging`transactionReplay`performanceSerialization`binaryCompatibility`internalDebugging`compressionTradeoff`persistentObjects`sharedMemory`productionLogging`workspaceMonitoring`deserializeFailure`serializationCost`systemInternals`advancedBang!
    (
    `question`answers`correct!(
        "Why does IPC rely on binary serialization rather than CSV?";

        `a`b`c`d!(
            "Preserves complete q object types";
            "Improves SQL compatibility";
            "Allows Excel import";
            "Reduces symbol count"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main benefit of q's native serialization format?";

        `a`b`c`d!(
            "Fast transfer between q processes";
            "Readable text";
            "Automatic indexing";
            "Automatic compression"
        );

        `a
    );

    `question`answers`correct!(
        "Before compressing IPC messages, data is normally:";

        `a`b`c`d!(
            "Serialized";
            "Sorted";
            "Enumerated";
            "Partitioned"
        );

        `a
    );

    `question`answers`correct!(
        "A steadily increasing .Q.w memory value most likely indicates:";

        `a`b`c`d!(
            "Growing memory usage";
            "Better compression";
            "Slower IPC";
            "Clock drift"
        );

        `a
    );

    `question`answers`correct!(
        "Long-running q processes should periodically monitor:";

        `a`b`c`d!(
            "Workspace memory";
            "CSV size";
            "Namespace count";
            "Source code length"
        );

        `a
    );

    `question`answers`correct!(
        "Enumerating symbols before serialization mainly reduces:";

        `a`b`c`d!(
            "Memory footprint";
            "Timestamp precision";
            "Disk sectors";
            "Join complexity"
        );

        `a
    );

    `question`answers`correct!(
        "When debugging production q systems, -2 is commonly used for:";

        `a`b`c`d!(
            "Error logging";
            "Table joins";
            "Compression";
            "Serialization"
        );

        `a
    );

    `question`answers`correct!(
        "Transaction logs primarily contain:";

        `a`b`c`d!(
            "Serialized updates";
            "CSV backups";
            "System commands";
            "Compiled code"
        );

        `a
    );

    `question`answers`correct!(
        "The largest serialization cost usually comes from:";

        `a`b`c`d!(
            "Large nested objects";
            "Booleans";
            "Bytes";
            "GUIDs"
        );

        `a
    );

    `question`answers`correct!(
        "Successful deserialization assumes:";

        `a`b`c`d!(
            "Valid serialized input";
            "Sorted tables";
            "Enumerated dates";
            "Compressed CSV"
        );

        `a
    );

    `question`answers`correct!(
        "Why should developers understand internal runtime functions?";

        `a`b`c`d!(
            "To debug and optimize production systems";
            "To replace SQL";
            "To avoid dictionaries";
            "To build GUIs"
        );

        `a
    );

    `question`answers`correct!(
        "Compression primarily trades:";

        `a`b`c`d!(
            "CPU for smaller messages";
            "Memory for timestamps";
            "Disk for joins";
            "IPC for CSV"
        );

        `a
    );

    `question`answers`correct!(
        "Why should persistent objects maintain stable schemas?";

        `a`b`c`d!(
            "Reliable serialization and recovery";
            "Smaller timestamps";
            "Faster sorting";
            "Lower CPU frequency"
        );

        `a
    );

    `question`answers`correct!(
        "Why is shared memory valuable in high-performance q systems?";

        `a`b`c`d!(
            "Processes can share data without copying";
            "It replaces serialization";
            "It automatically compresses tables";
            "It creates HDB partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why do production systems usually separate stderr from stdout?";

        `a`b`c`d!(
            "To separate diagnostics from normal program output";
            "Because stdout cannot print strings";
            "Because stderr is faster";
            "Because stdout cannot serialize data"
        );

        `a
    );

    `question`answers`correct!(
        "Which utility is commonly checked first when investigating memory growth?";

        `a`b`c`d!(
            ".Q.w";
            ".z.P";
            "-1";
            "\\v"
        );

        `a
    );

    `question`answers`correct!(
        "Failed deserialization usually indicates:";

        `a`b`c`d!(
            "Corrupted or invalid serialized data";
            "Missing partitions";
            "Duplicate symbols";
            "Incorrect sorting"
        );

        `a
    );

    `question`answers`correct!(
        "High-frequency IPC systems benefit most from:";

        `a`b`c`d!(
            "Efficient serialization";
            "CSV parsing";
            "Text formatting";
            "Console output"
        );

        `a
    );

    `question`answers`correct!(
        "Internal runtime functions are primarily intended for:";

        `a`b`c`d!(
            "Specialized runtime operations";
            "Arithmetic";
            "Table joins";
            "Window aggregates"
        );

        `a
    );

    `question`answers`correct!(
        "The ! operator underpins many q data structures because it constructs:";

        `a`b`c`d!(
            "Dictionaries";
            "Lists";
            "Tables";
            "Projections"
        );

        `a
    )

 );
//====================================================================