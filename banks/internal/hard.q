//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions
// Difficulty : Hard
//
//====================================================================
.quiz.internal.hard:`parseVsEval`serializeCompress`compressSerialize`parseTree`tokenization`binaryTransport`roundTrip`runtime`dynamicExecution`interpreter`compressionWorkflow`parseOptimization`serializationLimitations`ipcPipeline`parseErrors`memoryRepresentation`byteStreams`dynamicCode`lowLevelApis`executionModel!
    (
    `question`answers`correct!(
        "Which sequence correctly sends a compressed q object across IPC and reconstructs it on the receiving side?";

        `a`b`c`d!(
            "-8! → -21! → transmit → -19! → -9!";
            "-21! → -8! → transmit → -9! → -19!";
            "-5! → -8! → transmit → -9!";
            "-8! → transmit → -9! → -21!"
        );

        `a
    );

    `question`answers`correct!(
        "Why is serializing before compression generally required?";

        `a`b`c`d!(
            "Compression algorithms operate on byte streams, not arbitrary q objects";
            "Serialization automatically compresses data";
            "Compression requires parse trees";
            "Serialization only works after compression"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary advantage of calling -5! instead of value on dynamically-generated code?";

        `a`b`c`d!(
            "It inspects syntax without executing the code";
            "It executes faster";
            "It serializes the expression";
            "It compresses the expression"
        );

        `a
    );

    `question`answers`correct!(
        "Why would a compiler, linter, or IDE typically use -5!?";

        `a`b`c`d!(
            "To analyze syntax safely without evaluation";
            "To execute user code";
            "To serialize functions";
            "To compress source files"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes the relationship between -4! and -5!?";

        `a`b`c`d!(
            "-4! performs lexical analysis while -5! constructs the parse tree";
            "-4! executes expressions while -5! serializes them";
            "-4! compresses data while -5! decompresses it";
            "-4! is deprecated and replaced by -5!"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation is fundamentally reversible?";

        `a`b`c`d!(
            "-8! followed by -9!";
            "-5! followed by value";
            "-4! followed by -5!";
            "-21! followed by -8!"
        );

        `a
    );

    `question`answers`correct!(
        "Why are internal functions considered lower-level than normal q primitives?";

        `a`b`c`d!(
            "They expose interpreter/runtime functionality directly";
            "They bypass type checking";
            "They are implemented in q";
            "They require external libraries"
        );

        `a
    );

    `question`answers`correct!(
        "Which stage of a serialization/compression pipeline is most suitable for long-term persistence?";

        `a`b`c`d!(
            "Compressed serialized bytes";
            "Parse trees";
            "Token streams";
            "Evaluated expressions"
        );

        `a
    );

    `question`answers`correct!(
        "A byte vector produced by -8! primarily represents:";

        `a`b`c`d!(
            "The internal binary representation of a q object";
            "The source code used to construct the object";
            "A parse tree";
            "A compressed file"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation would normally occur immediately before -9!?";

        `a`b`c`d!(
            "Decompression";
            "Tokenization";
            "Parsing";
            "Garbage collection"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function would be most appropriate when building a syntax highlighter?";

        `a`b`c`d!(
            "-4!";
            "-9!";
            "-21!";
            "-8!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function would be most appropriate when implementing an AST-based code analyzer?";

        `a`b`c`d!(
            "-5!";
            "-8!";
            "-9!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "Why is transmitting serialized data preferable to transmitting text-based q expressions?";

        `a`b`c`d!(
            "It avoids reparsing source code and preserves object structure";
            "Serialized data is human-readable";
            "Serialized data cannot contain functions";
            "It guarantees compression"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement about parse trees is TRUE?";

        `a`b`c`d!(
            "They represent program structure but are not executed";
            "They are compressed byte vectors";
            "They are identical to serialized objects";
            "They can only represent tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which sequence best describes how q evaluates source code?";

        `a`b`c`d!(
            "Tokenize → Parse → Evaluate";
            "Serialize → Parse → Execute";
            "Compress → Parse → Evaluate";
            "Evaluate → Parse → Serialize"
        );

        `a
    );

    `question`answers`correct!(
        "Why is repeatedly parsing the same expression generally avoided in performance-sensitive applications?";

        `a`b`c`d!(
            "Parsing introduces unnecessary interpreter overhead";
            "Parsing changes program semantics";
            "Parsing compresses expressions";
            "Parsing modifies symbol tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best explains why serialization is widely used for IPC?";

        `a`b`c`d!(
            "It provides a portable binary representation understood by q processes";
            "It automatically executes received expressions";
            "It replaces compression";
            "It guarantees zero-copy networking"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation is NOT performed by -5!?";

        `a`b`c`d!(
            "Executing the parsed expression";
            "Checking syntax";
            "Constructing a parse tree";
            "Analyzing program structure"
        );

        `a
    );

    `question`answers`correct!(
        "Which of the following best characterizes internal functions?";

        `a`b`c`d!(
            "Special runtime interfaces exposing interpreter functionality";
            "User-defined helper functions";
            "Database utilities";
            "Namespace constructors"
        );

        `a
    );

    `question`answers`correct!(
        "A developer building a distributed q application is most likely to rely directly on which internal-function pair?";

        `a`b`c`d!(
            "-8! and -9!";
            "-4! and -5!";
            "-19! and -21!";
            "-11! and -22!"
        );

        `a
    )
 );
//====================================================================