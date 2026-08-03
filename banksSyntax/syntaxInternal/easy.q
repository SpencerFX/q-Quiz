//====================================================================
//
// q-Quiz
//
// Topic      : Internal Functions (negative-integer Enumerate) — Syntax Focus
// Source     : "Internal functions" (code.kx.com/q/basics/internal)
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxInternal.easy:`showIdentity`tokensBasic`toBytes`fromBytes`refCount`uncompressedLenShortcut`compressBytesBasic`sha1Basic`memoryDomainBasic`quoteEscapeBasic`memoryMapBasic`typeEnumBasic!
    (
    `question`answers`correct!(
        "What does 0N!x do?";

        `a`b`c`d!(
            "Writes x to the console and then returns x unchanged (the identity function, useful for debugging)";
            "Rounds x to the nearest null value";
            "Deletes x from memory after printing it";
            "Converts x to its byte representation for IPC"
        );

        `a
    );

    `question`answers`correct!(
        "What does -4!x return, given x is a string such as \"select this from that\"?";

        `a`b`c`d!(
            "The list of q tokens found in the string x";
            "The parsed q expression tree for x, ready to evaluate";
            "The IPC byte representation of the string x";
            "A single boolean indicating whether x is valid q syntax"
        );

        `a
    );

    `question`answers`correct!(
        "What does -8!x return?";

        `a`b`c`d!(
            "The IPC byte representation of x";
            "The number of bytes x occupies in memory";
            "A compressed version of x written directly to disk";
            "The reference count of x"
        );

        `a
    );

    `question`answers`correct!(
        "What does -9!x do, as used in -9!-8!1 2 3?";

        `a`b`c`d!(
            "Creates data from an IPC byte representation, reversing what -8!x produced";
            "Converts x into its IPC byte representation, same as -8!x";
            "Compresses the byte representation x further";
            "Returns the reference count of the byte representation x"
        );

        `a
    );

    `question`answers`correct!(
        "What does -16!x return?";

        `a`b`c`d!(
            "The reference count for the variable x";
            "The number of bytes x occupies uncompressed";
            "The number of distinct values in x";
            "The memory domain that x is allocated in"
        );

        `a
    );

    `question`answers`correct!(
        "What does -22!x compute, and how does it compare to count -8!x?";

        `a`b`c`d!(
            "The uncompressed serialized length of x; it is an optimized shortcut that returns the same value as count -8!x but much faster";
            "The compressed length of x; it is always smaller than count -8!x";
            "The number of columns in x if x is a table; unrelated to -8!x";
            "The reference count of x; identical in meaning to -16!x"
        );

        `a
    );

    `question`answers`correct!(
        "What does -18!x return?";

        `a`b`c`d!(
            "The IPC byte representation of x, with compression applied according to the IPC compression rules";
            "The uncompressed IPC byte representation of x, identical to -8!x";
            "The number of bytes needed to store x uncompressed";
            "A boolean indicating whether x is currently compressed on disk"
        );

        `a
    );

    `question`answers`correct!(
        "What does -33!x return, where x is a string such as \"mypassword\"?";

        `a`b`c`d!(
            "Its SHA-1 hash, as a list of strings of hex codes";
            "Its MD5 checksum as a single string";
            "The IPC byte representation of the string, hashed for comparison";
            "The number of characters in x after escaping"
        );

        `a
    );

    `question`answers`correct!(
        "What does -120!x return?";

        `a`b`c`d!(
            "x's memory domain (currently 0 or 1)";
            "The number of bytes x occupies in a memory-mapped file";
            "A boolean indicating whether x is resident in memory";
            "The process ID of the memory owner for x"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of -14!x (quote escape)?";

        `a`b`c`d!(
            "Handles double-quote escaping in strings, used to prepare data for CSV export";
            "Escapes backtick symbols so they can be safely printed";
            "Removes all quote characters from a string entirely";
            "Converts a string into its tokenized q representation"
        );

        `a
    );

    `question`answers`correct!(
        "What does -23!x attempt to do?";

        `a`b`c`d!(
            "Forces the object x to be resident in memory by hinting to the OS and/or faulting the underlying memory pages";
            "Compresses x and writes it to a memory-mapped file";
            "Frees the memory currently occupied by x";
            "Returns the memory address of x as an integer"
        );

        `a
    );

    `question`answers`correct!(
        "What does -10!x do when x is a type number such as 20h?";

        `a`b`c`d!(
            "Resolves the type number to an enum vector and checks whether it is available, returning a boolean";
            "Converts the type number into its corresponding type character, such as \"j\"";
            "Returns the byte size of that type";
            "Casts x to that type directly"
        );

        `a
    )
 );