//====================================================================
//
// q-Quiz
//
// Topic      : The .Q Namespace (Utility Functions) — Syntax Focus
// Source     : "The .Q namespace" (code.kx.com/q/ref/dotq)
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxQ.easy:`ddBasic`addrBasic`hostBasic`qpBasic`qtBasic`fkBasic`gcBasic`vBasic`s1Basic`sha1Basic`btoaAtobBasic`optBasic!
    (
    `question`answers`correct!(
        "What does .Q.dd[`:dir]`file return, given .Q.dd[x;y] is shorthand for ` sv x,`$string y?";

        `a`b`c`d!(
            "`:dir/file — a single filepath symbol joining the two arguments with a slash";
            "A two-item list containing `:dir and `file separately";
            "The string \"dir/file\" rather than a symbol";
            "An error, since .Q.dd requires both arguments to already be strings"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.addr x return, where x is a hostname or IP address as a symbol atom?";

        `a`b`c`d!(
            "The IP address as an integer";
            "The hostname as a symbol, resolved from the IP";
            "A boolean indicating whether the host is reachable";
            "The dotted-decimal string representation of the IP"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.host x return, where x is an IP address as an int atom?";

        `a`b`c`d!(
            "The hostname as a symbol atom";
            "The IP address re-formatted as a dotted-decimal string";
            "A boolean indicating whether the IP is currently reachable";
            "The IP address unchanged, since .Q.host is only for symbols"
        );

        `a
    );

    `question`answers`correct!(
        "What are the three possible return values of .Q.qp x, and what do they indicate?";

        `a`b`c`d!(
            "1b for a partitioned table, 0b for a splayed table, and 0 (non-boolean) for anything else";
            "1b for a keyed table, 0b for an unkeyed table, and 0 for a dictionary";
            "1b for a compressed table, 0b for uncompressed, and 0 for encrypted";
            "1b for in-memory, 0b for on-disk, and 0 for partially loaded"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.qt x return?";

        `a`b`c`d!(
            "1b if x is a table, else 0b";
            "1b if x is a partitioned table specifically, else 0b";
            "The number of columns in x if it is a table";
            "1b if x is keyed, else 0b"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.fk x return, where x is a table column?";

        `a`b`c`d!(
            "The null symbol ` if the column is not a foreign key, or the name of the referenced table if it is";
            "1b if the column is a foreign key, 0b otherwise";
            "The domain name the column is enumerated against, regardless of whether it's a true foreign key";
            "A list of every table that column could potentially reference"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.gc[] return?";

        `a`b`c`d!(
            "The amount of memory (in bytes) that was returned to the OS by garbage collection";
            "A boolean indicating whether garbage collection ran successfully";
            "A dictionary of memory statistics, identical to .Q.w[]";
            "The number of objects that were garbage collected"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.v x return when x is a filepath, versus when x is any other symbol?";

        `a`b`c`d!(
            "For a filepath, it returns the splayed table stored there; for any other symbol, it returns the global variable named x";
            "For a filepath, it returns the file's raw bytes; for any other symbol, it enumerates x";
            "Both cases return the same thing: x converted to a string";
            "For a filepath it signals an error; only plain symbols are valid input"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.s1 x return?";

        `a`b`c`d!(
            "A string representation of x";
            "x formatted to plain text as the console would display it, respecting console width/height";
            "The SHA-1 hash of x";
            "The first element of x as a string"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.sha1 x return, where x is a string?";

        `a`b`c`d!(
            "Its SHA-1 hash, as a bytestream";
            "Its SHA-1 hash, as a hex-encoded string";
            "A boolean indicating whether x matches a stored hash";
            "The base64 encoding of x, not a hash at all"
        );

        `a
    );

    `question`answers`correct!(
        "What is the relationship between .Q.btoa and .Q.atob?";

        `a`b`c`d!(
            ".Q.btoa encodes data to base64, while .Q.atob decodes base64 data back to bytes — they are inverses";
            "Both encode to base64; they differ only in which alphabet they use";
            ".Q.btoa hashes data with SHA-1, while .Q.atob verifies that hash";
            ".Q.btoa and .Q.atob are aliases for the same function"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.opt .z.x return?";

        `a`b`c`d!(
            "A dictionary presenting the command-line arguments (from .z.x) keyed by parameter name";
            "A single string of the entire raw command line";
            "The count of command-line arguments passed";
            "A table of parameter names, types, and default values"
        );

        `a
    )
 );