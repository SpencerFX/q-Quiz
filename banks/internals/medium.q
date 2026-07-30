//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions
// Difficulty : Medium
//
//====================================================================
.quiz.internal.medium:
`serializeIPC`deserializeIPC`parseTree`tokenizeVsParse`compressionPipeline`binaryTransport`serializationType`compressionOrder`parseExecution`byteVector`ipcUsage`parseResult`compressionInput`interpreter`internalNumbers`binaryPersistence`parseErrors`deserializeInput`builtins`runtime!
    (
    `question`answers`correct!(
        "Which pair of internal functions is commonly used to send q objects over IPC?";

        `a`b`c`d!(
            "-8! followed by -9!";
            "-4! followed by -5!";
            "-19! followed by -21!";
            "-11! followed by -22!"
        );

        `a
    );

    `question`answers`correct!(
        "What is the output of -5! when given valid q code?";

        `a`b`c`d!(
            "A parse tree";
            "Executed results";
            "A byte vector";
            "A compressed object"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary difference between -4! and -5!?";

        `a`b`c`d!(
            "-4! tokenizes, -5! parses";
            "-4! parses, -5! executes";
            "-4! compresses, -5! decompresses";
            "-4! serializes, -5! deserializes"
        );

        `a
    );

    `question`answers`correct!(
        "Which sequence correctly compresses an arbitrary q object for transmission?";

        `a`b`c`d!(
            "-21@-8!object";
            "-8@-21!object";
            "-9@-21!object";
            "-5@-8!object"
        );

        `a
    );

    `question`answers`correct!(
        "Why does -21! normally operate after -8!?";

        `a`b`c`d!(
            "Compression works on serialized bytes";
            "Serialization requires compressed data";
            "Both operations are identical";
            "Compression only works on tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which datatype is produced by -8!?";

        `a`b`c`d!(
            "Byte vector";
            "Dictionary";
            "Symbol list";
            "General list"
        );

        `a
    );

    `question`answers`correct!(
        "If compressed data is received across the network, what is the correct recovery order?";

        `a`b`c`d!(
            "Decompress then deserialize";
            "Deserialize then decompress";
            "Parse then deserialize";
            "Tokenize then decompress"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement about -5! is TRUE?";

        `a`b`c`d!(
            "It does not execute the supplied code";
            "It executes code and returns the result";
            "It compresses expressions";
            "It converts expressions into byte vectors"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function would be most useful when implementing a custom serializer?";

        `a`b`c`d!(
            "-8!";
            "-5!";
            "-4!";
            "-11!"
        );

        `a
    );

    `question`answers`correct!(
        "What is the expected input to -9!?";

        `a`b`c`d!(
            "A serialized byte vector";
            "A parse tree";
            "A symbol";
            "A dictionary"
        );

        `a
    );

    `question`answers`correct!(
        "Why is serialization used before IPC transmission?";

        `a`b`c`d!(
            "Objects must be converted into a portable binary format";
            "It makes queries execute faster";
            "It automatically compresses data";
            "IPC only accepts symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function would you use to inspect the syntax of q code without evaluating it?";

        `a`b`c`d!(
            "-5!";
            "-8!";
            "-9!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "If -5! encounters invalid q syntax, what happens?";

        `a`b`c`d!(
            "A parse error is returned";
            "The expression is executed";
            "The expression becomes null";
            "It returns an empty parse tree"
        );

        `a
    );

    `question`answers`correct!(
        "Serialization is primarily intended for:";

        `a`b`c`d!(
            "Binary persistence and communication";
            "Sorting tables";
            "Compressing symbols";
            "Partitioning databases"
        );

        `a
    );

    `question`answers`correct!(
        "Internal functions beginning with negative numbers are:";

        `a`b`c`d!(
            "Built directly into the q runtime";
            "Defined in q.k";
            "User-defined utilities";
            "Reserved namespaces"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation generally occurs first when persisting compressed q objects?";

        `a`b`c`d!(
            "Serialization";
            "Compression";
            "Deserialization";
            "Parsing"
        );

        `a
    );

    `question`answers`correct!(
        "Why would a developer use -4! instead of -5!?";

        `a`b`c`d!(
            "To examine lexical tokens without building a parse tree";
            "To serialize data";
            "To execute dynamic code";
            "To compress binary data"
        );

        `a
    );

    `question`answers`correct!(
        "Which of these is NOT a common use of internal functions?";

        `a`b`c`d!(
            "Creating table attributes";
            "Serialization";
            "Compression";
            "Parsing source code"
        );

        `a
    );

    `question`answers`correct!(
        "After receiving serialized data over IPC, which function reconstructs the original q object?";

        `a`b`c`d!(
            "-9!";
            "-8!";
            "-5!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "Why are internal functions considered low-level APIs?";

        `a`b`c`d!(
            "They expose interpreter functionality directly";
            "They are slower than q code";
            "They only work with tables";
            "They require C extensions"
        );

        `a
    )
 );
//====================================================================