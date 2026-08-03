//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxInternal.medium:`roundTripSerialize`compressVsUncompressCount`statsDict21`asyncBroadcastVsNeg`ieee754Format`deferredResponseBasic`socketTableCols`streamingExecuteForms`sslViewCall`masterKeyQuery`compareNeg4Neg5`refCountSharing!
    (
    `question`answers`correct!(
        "What does -9!-8!1 2 3 demonstrate, and what would you expect the result to equal?";

        `a`b`c`d!(
            "A round trip through serialization and deserialization; the result equals the original list 1 2 3";
            "That -8! and -9! are inverses only for atoms, so the result is a single value rather than a list";
            "The reference count of the list 1 2 3 after being serialized";
            "The compressed byte length of the list 1 2 3"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing count -8!til 1000 with count -18!til 1000, what does the difference in results demonstrate?";

        `a`b`c`d!(
            "That -18!x applies compression to the IPC byte representation, producing a smaller byte count than the uncompressed -8!x";
            "That -18!x always produces a larger result than -8!x due to compression overhead";
            "That -8!x and -18!x always return identical results for any input";
            "That til 1000 is not serializable, so -18! falls back to a fixed-size placeholder"
        );

        `a
    );

    `question`answers`correct!(
        "In the dictionary returned by -21!`:ztest, what do the compressedLength and uncompressedLength keys represent?";

        `a`b`c`d!(
            "The on-disk compressed size of the file and its size once decompressed, respectively";
            "The length of the file's name in bytes, compressed and uncompressed";
            "The number of compressed and uncompressed columns in the file's table";
            "The minimum and maximum block sizes used during compression"
        );

        `a
    );

    `question`answers`correct!(
        "What advantage does -25!(handles;msg) have over neg[handles]@\\:msg for broadcasting to multiple handles?";

        `a`b`c`d!(
            "It serializes msg only once for the whole broadcast, rather than once per handle, reducing CPU and memory load";
            "It sends the message synchronously instead of asynchronously";
            "It bypasses the main loop and sends immediately without queuing";
            "It automatically retries failed handles until they succeed"
        );

        `a
    );

    `question`answers`correct!(
        "What does -27!(3i;0 1+123456789.4567) return, and what does the first argument (3i) control?";

        `a`b`c`d!(
            "The float value(s) formatted as strings to 3 decimal places, using IEEE754 rounding";
            "The float value(s) rounded to the nearest multiple of 3";
            "A boolean list of length 3 indicating precision validity";
            "The float value(s) truncated to 3 significant figures, ignoring rounding"
        );

        `a
    );

    `question`answers`correct!(
        "Inside a callback like .z.pg, what does calling -30!(::) achieve, and how is the deferred reply sent later?";

        `a`b`c`d!(
            "It lets the callback complete without responding immediately; the handle from .z.w is saved, and the reply is later sent via -30!(handle;0b;msg) or -30!(handle;1b;errorMsg)";
            "It immediately sends an empty reply to the client and closes the connection";
            "It permanently disables replies on that handle until the process restarts";
            "It queues the message for replay via -11! at a later time"
        );

        `a
    );

    `question`answers`correct!(
        "In the result of -38!x, what do the p and f columns represent?";

        `a`b`c`d!(
            "p is the protocol (q for IPC or w for WebSocket) and f is the socket family (t for TCP or u for Unix domain socket)";
            "p is the port number and f is a flag for whether the socket is flushed";
            "p is the process ID and f is the file descriptor number";
            "p is a boolean for ping status and f is the number of failed sends"
        );

        `a
    );

    `question`answers`correct!(
        "What is the difference in behavior between -11!x (or -11!(-1;x)) and -11!(-2;x) when x is a logfile handle?";

        `a`b`c`d!(
            "-11!x replays the log and returns the number of chunks executed, while -11!(-2;x) instead returns the count of consecutive valid chunks and the length of the valid part of the file, without replaying";
            "-11!x only validates the file without replaying, while -11!(-2;x) replays it fully";
            "Both behave identically, differing only in return type";
            "-11!x replays from the end of the file backwards, while -11!(-2;x) replays from the start"
        );

        `a
    );

    `question`answers`correct!(
        "What does calling (-26!)[] (equivalent to -26!()) return?";

        `a`b`c`d!(
            "A dictionary of TLS settings for the current process, mostly initialized from corresponding environment variables";
            "A boolean indicating whether SSL is currently enabled";
            "The SSL certificate file contents as a string";
            "A list of all handles currently using an encrypted connection"
        );

        `a
    );

    `question`answers`correct!(
        "What does -36!(::) report, as opposed to -36!(x;y)?";

        `a`b`c`d!(
            "-36!(::) exposes whether a master key has already been loaded (returning a boolean); -36!(x;y) actually loads and validates a master key file x with password y";
            "-36!(::) loads a default master key; -36!(x;y) only checks if one is loaded";
            "Both calls are equivalent, differing only in argument style";
            "-36!(::) locks the currently loaded key; -36!(x;y) unlocks it"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing -4!\"select this from that\" with -5!\"select this from that\", what is the key difference in what each returns?";

        `a`b`c`d!(
            "-4! returns the raw list of q tokens found in the string, while -5! parses the string into its structured parse-tree representation";
            "-4! parses the string into executable q, while -5! only tokenizes it";
            "Both return identical output, since -4 and -5 are aliases in modern kdb+";
            "-4! requires a file handle argument, while -5! works on strings directly"
        );

        `a
    );

    `question`answers`correct!(
        "Given a:b:c:d:e:1 2 3 (five variables all bound to the same list), what would -16!a most likely reflect, and why?";

        `a`b`c`d!(
            "A reference count of 5, since all five variable names share/reference the same underlying list object";
            "A reference count of 1, since -16! only counts references made after the variable named a";
            "A reference count of 3, matching the number of elements in the list";
            "An error, since -16! cannot be used on chained assignments"
        );

        `a
    )
 );