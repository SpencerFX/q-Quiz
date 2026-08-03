//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxInternal.hard:`tokensFullOutput`ieee754VsQf`compress21FullDict`asyncBroadcastError1`asyncBroadcastError2`deferredResponseError`optimizedLenBenchmark`memoryDomainEach`sha1FullExample`typeEnumWorkedExample`streamingExecuteFormsPick`socketTableWorkedExample!
    (
    `question`answers`correct!(
        "Which output correctly matches -4!\"a variable named aa_bb\", respecting how q tokenizes names with embedded underscores?";

        `a`b`c`d!(
            ",\"a\"; \" \"; \"variable\"; \" \"; \"named\"; \" \"; \"aa_bb\"";
            ",\"a\"; \" \"; \"variable\"; \" \"; \"named\"; \" \"; \"aa\"; \"_\"; \"bb\"";
            "\"a\"; \"variable\"; \"named\"; \"aa_bb\"  (with no whitespace tokens)";
            ",\"a variable named aa_bb\"  (a single unsplit token)"
        );

        `a
    );

    `question`answers`correct!(
        "Given .045 actually stores as 0.044999999999999998 internally, which pair of results correctly contrasts -27!(2i;.045) with .Q.f[2;.045]?";

        `a`b`c`d!(
            "-27!(2i;.045) returns \"0.04\" (IEEE754 rounding on the true stored value), while .Q.f[2;.045] returns \"0.05\" (its own rounding behavior)";
            "-27!(2i;.045) returns \"0.05\" while .Q.f[2;.045] returns \"0.04\" — the reverse of the actual behavior";
            "Both return \"0.04\", since IEEE754 rounding and .Q.f always agree";
            "Both return \"0.05\", since both round half-up regardless of stored precision"
        );

        `a
    );

    `question`answers`correct!(
        "Which dictionary correctly matches the shape of -21!`:ztest for a compressed (not encrypted) file, based on the paper's example?";

        `a`b`c`d!(
            "compressedLength; uncompressedLength; algorithm; logicalBlockSize; zipLevel — five keys, with algorithm and zipLevel as small integers";
            "compressedLength; uncompressedLength; checksum; blockCount — four keys, with no algorithm key";
            "algorithm; zipLevel only — two keys, omitting length information";
            "fileName; compressedLength; uncompressedLength; owner — four keys including file metadata"
        );

        `a
    );

    `question`answers`correct!(
        "In the example connecting to two processes on different kdb+ versions via h:hopen each 5000 5001, which call correctly demonstrates -25! failing because one handle's version cannot serialize a GUID?";

        `a`b`c`d!(
            "-25!(h;0Ng)  — signals 'type error serializing for handle 5 because the older-version handle can't support GUID";
            "-25!(h;0Ng)  — succeeds silently, downgrading the GUID to a string for the older handle";
            "-25!(h;0Ng)  — signals an error only if BOTH handles are on old versions, otherwise it succeeds";
            "-25!(h;0Ng)  — always succeeds since -25! ignores per-handle capability differences"
        );

        `a
    );

    `question`answers`correct!(
        "What error does -25!(7 8;0Ng) signal, and why?";

        `a`b`c`d!(
            "'7 is not an ipc handle — because 7 and 8 are plain integers that don't correspond to open IPC handles";
            "'type — because 0Ng (a GUID) can never be broadcast via -25!";
            "'length — because the handle list and message must be the same length";
            "'domain — because 7 and 8 fall outside the valid handle numbering range"
        );

        `a
    );

    `question`answers`correct!(
        "Given key .z.W returns a list including handle 8i, what happens when running -30!(8i;0b;`hello`world) if handle 8 is not currently awaiting a deferred reply?";

        `a`b`c`d!(
            "It signals 'Handle 8 was not expecting a response msg";
            "It silently succeeds, queuing the message for whenever handle 8 next sends a request";
            "It signals a generic 'domain error with no further detail";
            "It closes handle 8 and reopens it before sending the message"
        );

        `a
    );

    `question`answers`correct!(
        "Given the benchmark backslash-t do[5000;-22!v] reporting a much smaller time than backslash-t do[5000;count -8!v] (for v:til 100000), what does this demonstrate about -22!x?";

        `a`b`c`d!(
            "-22!x is an optimized shortcut that computes the uncompressed serialized length directly, without doing the full serialization that count -8!x requires";
            "-22!x is slower than count -8!x because it also validates the data before measuring it";
            "-22!x and count -8!x are computed identically internally, so any timing difference is measurement noise";
            "-22!x only works correctly on lists shorter than 100000 elements, explaining the speed difference"
        );

        `a
    );

    `question`answers`correct!(
        "What does -120!'(1 2 3;.m.x:1 2 3) return, and what does applying -120! Each (') to each item of the list achieve?";

        `a`b`c`d!(
            "0 1 — it returns the memory domain of each item separately, showing the plain list and the .m.x-tagged list may live in different memory domains";
            "0 0 — both items always share the same memory domain regardless of tagging";
            "A single value 1, since Each collapses the two results into one before returning";
            "An error, since -120! cannot be applied with Each"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression correctly computes and displays the SHA-1 hash of the string \"mypassword\" as a single hex string, matching the paper's example?";

        `a`b`c`d!(
            "raze string -33!\"mypassword\"";
            "string raze -33!\"mypassword\"";
            "-33!string \"mypassword\"";
            "raze -33!string \"mypassword\""
        );

        `a
    );

    `question`answers`correct!(
        "Working through -10!20h after ee:`a`b`c; vv:`ee$`a`a`b, why does -10!20h return 0b the second time it's called, given it returned 1b before vv was created?";

        `a`b`c`d!(
            "Because creating the enumeration vv against domain ee consumes/claims one of the limited enum-type slots, so type 20h (a different, still-unclaimed enum type) is no longer available in the way it was before";
            "Because -10!20h is stateless and its result is random each time it's called";
            "Because vv itself has type 20h, and querying its own type always returns 0b";
            "Because ee must be deleted before -10!20h can return 1b again"
        );

        `a
    );

    `question`answers`correct!(
        "Which set of forms correctly lists ALL the valid call shapes for -11! (streaming execute) described in the paper?";

        `a`b`c`d!(
            "-11!x ,  -11!(-1;x) ,  -11!(-2;x) ,  -11!(n;x)  where n is a non-negative integer";
            "-11!x ,  -11!(n;x)  only, with no special forms for -1 or -2";
            "-11!(x;y;z)  only, taking exactly three arguments";
            "-11!x ,  -11!(-1;x) ,  -11!(-2;x)  only, with no form for replaying a specific chunk count"
        );

        `a
    );

    `question`answers`correct!(
        "Given {([]h)!-38!h:.z.H}[] produces a keyed table of socket info, which columns would you expect to see beyond p and f in a v4.1+ build, based on the paper?";

        `a`b`c`d!(
            "z (compression enabled flag), n (count of unsent messages), and m (total unsent bytes)";
            "t (protocol version) and s (SSL enabled flag) only";
            "c (connection time) and l (last message latency) only";
            "No additional columns — p and f are the only columns in any version"
        );

        `a
    )
 );
//====================================================================