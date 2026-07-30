//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions
// Difficulty : Easy
//
//====================================================================
.quiz.internal.easy:
`serialize`deserialize`compress`decompress`workspace`gc`version`typeCode`parse`tokenize`loadLibrary`dynamicLibrary`sslRandom`systemCommand`internalPrefix`negativeBang`ipc`binaryData`reserved`documentation!
    (
    `question`answers`correct!(
        "Which internal function serializes q data into a byte vector?";

        `a`b`c`d!(
            "-8!";
            "-9!";
            "-11!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function deserializes a byte vector back into q data?";

        `a`b`c`d!(
            "-9!";
            "-8!";
            "-11!";
            "-25!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function is commonly used for compression?";

        `a`b`c`d!(
            "-21!";
            "-19!";
            "-8!";
            "-9!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function reverses compression?";

        `a`b`c`d!(
            "-19!";
            "-21!";
            "-8!";
            "-9!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function reports workspace statistics?";

        `a`b`c`d!(
            "-22!";
            "-8!";
            "-11!";
            "-19!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function forces garbage collection?";

        `a`b`c`d!(
            "-22!";
            "-8!";
            "-21!";
            "-9!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function returns the kdb+ version information?";

        `a`b`c`d!(
            "-11!";
            "-8!";
            "-19!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "Internal functions in q are identified by:";

        `a`b`c`d!(
            "A negative integer followed by !";
            "A positive integer followed by !";
            "A colon prefix";
            "A double backslash"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function parses q code without executing it?";

        `a`b`c`d!(
            "-5!";
            "-8!";
            "-11!";
            "-21!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function tokenizes q source code?";

        `a`b`c`d!(
            "-4!";
            "-5!";
            "-8!";
            "-11!"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function is commonly used to load a shared library?";

        `a`b`c`d!(
            "-11!";
            "-8!";
            "-21!";
            "-19!"
        );

        `a
    );

    `question`answers`correct!(
        "Why are internal functions generally written with a negative number?";

        `a`b`c`d!(
            "They access built-in interpreter functionality";
            "They execute more slowly";
            "They are user-defined";
            "They only work on Windows"
        );

        `a
    );

    `question`answers`correct!(
        "What datatype does -8! typically produce?";

        `a`b`c`d!(
            "Byte vector";
            "Symbol";
            "Dictionary";
            "Table"
        );

        `a
    );

    `question`answers`correct!(
        "What does -9! expect as input?";

        `a`b`c`d!(
            "A serialized byte vector";
            "A table";
            "A symbol";
            "A namespace"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement about internal functions is TRUE?";

        `a`b`c`d!(
            "They are built directly into the q interpreter";
            "They must be loaded from a script";
            "They are all documented in q.k";
            "They only exist in 64-bit versions"
        );

        `a
    );

    `question`answers`correct!(
        "Which internal function pair is commonly used for IPC messaging?";

        `a`b`c`d!(
            "-8! and -9!";
            "-19! and -21!";
            "-4! and -5!";
            "-11! and -22!"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary purpose of serialization?";

        `a`b`c`d!(
            "Convert q objects into a binary representation";
            "Convert tables into CSV";
            "Convert symbols into strings";
            "Sort a table"
        );

        `a
    );

    `question`answers`correct!(
        "Compression functions primarily operate on:";

        `a`b`c`d!(
            "Binary data";
            "Namespaces";
            "Handles";
            "Dictionaries"
        );

        `a
    );

    `question`answers`correct!(
        "Most developers encounter which internal function first?";

        `a`b`c`d!(
            "-8!";
            "-31!";
            "-100!";
            "-42!"
        );

        `a
    );

    `question`answers`correct!(
        "Where are internal functions implemented?";

        `a`b`c`d!(
            "Inside the kdb+ runtime";
            "In q scripts";
            "In the sym file";
            "Inside the database"
        );

        `a
    )
 );
//====================================================================