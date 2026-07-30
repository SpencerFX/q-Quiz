//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.symFilesSyntax.hard:`singleThreadCore`domainCountGuard`unenumReenumLines`multithreadSymFiles`allsymsMemIntensive`gcPlacement`countRatioPurpose`pointOfNoReturn`peachRewriteLine`compoundAnymapFilter`symtFileEach`copyBetweenDbGuid`encodeMaxLenArg!
    (
    `question`answers`correct!(
        "Which line from the single-threaded rewrite correctly creates a fresh, empty sym file before re-enumeration begins?";

        `a`b`c`d!(
            "hsym[`:sym] set `symbol$()";
            "hsym[`:sym] set ()";
            "hsym[`:sym] set `symbol$0";
            "hsym[`:zym] set `symbol$()"
        );

        `a
    );

    `question`answers`correct!(
        "What does the guard checking count distinct{key get x}each enumeratedFiles equals 1 verify, and what happens if it fails?";

        `a`b`c`d!(
            "It checks that all enumerated files share exactly one common enum domain; if more than one domain is found, it signals a 'too difficult error and stops";
            "It checks that each file has at least one row; if any is empty, it signals an error";
            "It checks that no file is compressed; if one is, it deletes it";
            "It checks the sym file loaded correctly; if not, it retries"
        );

        `a
    );

    `question`answers`correct!(
        "In the single-threaded per-date function, which sequence correctly unenumerates a file's data using the OLD sym file, then re-enumerates it against the NEW sym file?";

        `a`b`c`d!(
            "sym set get zym; s:get x; a:attr s; s:value s; sym set get sym-on-disk; s:a#.Q.en[`:.;([]s:s)]`s; x set s";
            "sym set get sym-on-disk; s:get x; s:a#.Q.en[`:.;([]s:s)]`s; sym set get zym; x set s";
            "s:get x; sym set get zym; x set .Q.en[`:.;s]; sym set get sym-on-disk";
            "a:attr get x; sym set get sym-on-disk; x set a#.Q.en[`:.;get x]`s"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the single-threaded function set the in-memory sym variable to the OLD sym file's contents immediately before reading an enumerated file, rather than leaving the NEW sym file loaded?";

        `a`b`c`d!(
            "Because the enumerated file's integer values only make sense relative to the sym domain that produced them, so the old string pool must be in memory to correctly unenumerate it";
            "Because the old sym file loads faster than the new one";
            "Because reading a file requires the sym variable to be empty";
            "Because .Q.en always reads from the old sym file by convention"
        );

        `a
    );

    `question`answers`correct!(
        "In the multithreaded version, which construction correctly gathers sym-typed column file paths from all PARTITIONED tables using .Q.qp?";

        `a`b`c`d!(
            "symFiles built via allpaths joined with each table's sym columns, restricted to tables where .Q.qp value x matches 1b, run with peach";
            "symFiles built via allpaths joined with each table's sym columns, restricted to tables where .Q.qp value x matches 0b, run with peach";
            "symFiles built via allpaths alone, restricted to tables where .Q.qp x matches 1b, run with each";
            "symFiles built via hsym joined with each table's sym columns where t is \"s\", with no partitioned/splayed distinction"
        );

        `a
    );

    `question`answers`correct!(
        "Which construction correctly gathers sym-typed column file paths from SPLAYED (non-partitioned) tables, distinguishing it from the partitioned-table version?";

        `a`b`c`d!(
            "symFiles extended via hsym joined with each table's sym columns, restricted to tables where .Q.qp value x matches 0b, run with each";
            "symFiles extended via allpaths joined with each table's sym columns, restricted to tables where .Q.qp value x matches 1b, run with peach";
            "symFiles extended via hsym alone, restricted to tables where .Q.qp value x matches 1b";
            "symFiles extended via hsym joined with each table's sym columns, restricted to tables where .Q.qp value x matches 1b, run with each"
        );

        `a
    );

    `question`answers`correct!(
        "What does the allsyms computation (a peach over symFiles taking the distinct raze of each file's unenumerated values) compute, and why is it described as memory-intensive?";

        `a`b`c`d!(
            "It reads and un-enumerates every symbol column file, then takes the distinct union across all of them — memory-intensive because every symbol value from every file is held in memory at once";
            "It counts the number of files in symFiles — memory-intensive because peach forks one process per file";
            "It computes the attribute of each symFiles entry — memory-intensive because attr must scan the whole file";
            "It compresses each file in symFiles — memory-intensive because compression buffers the whole file"
        );

        `a
    );

    `question`answers`correct!(
        "Where in the multithreaded workflow does the call to .Q.gc[] belong, and why?";

        `a`b`c`d!(
            "Immediately after computing allsyms, to free fragmented memory from the memory-intensive distinct/raze operation before continuing";
            "Immediately before opening the q session, to clear memory from the previous session";
            "Inside the peach block that rewrites each symFiles entry, to free memory after every file";
            "After backing up the old sym file, to garbage-collect the old sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of computing count[allsyms]%count sym before proceeding with the multithreaded rewrite?";

        `a`b`c`d!(
            "To gauge what proportion of the existing sym file is actually still in use, helping decide whether compacting is worthwhile before making irreversible changes";
            "To determine how many threads peach should use";
            "To validate that allsyms and sym have identical values";
            "To calculate the compression ratio expected after rewriting"
        );

        `a
    );

    `question`answers`correct!(
        "Which block is described as the 'point of no return' in the multithreaded rewrite, and what do its first two steps do?";

        `a`b`c`d!(
            "The final rewrite block; it backs up the old sym file to disk, then resets the live sym file to an empty symbol list before re-enumeration begins";
            "The allpaths definition; it deletes par.txt and rebuilds it";
            "The symFiles collection step; it removes files without checking their type first";
            "The allsyms computation; it deletes files as it scans them"
        );

        `a
    );

    `question`answers`correct!(
        "In the final peach rewrite block, which sequence correctly unenumerates a file's values against the OLD sym file before re-enumerating and writing back to disk?";

        `a`b`c`d!(
            "Cast the file's int values back using the old sym list, then write the attribute-preserved result back enumerated against the new live sym symbol type";
            "Cast the file's int values using the new sym list, then write back enumerated against the old sym list";
            "Look up the old sym list's values by position, then write back without re-enumerating";
            "Cast the old sym list using the file's int values, then overwrite the old sym file directly"
        );

        `a
    );

    `question`answers`correct!(
        "In the single-threaded rewrite's file-filtering step, which expression correctly excludes both compound (trailing #) and anymap (trailing ##) files?";

        `a`b`c`d!(
            "files:files where not any files like/:(\"*#\";\"*##\")";
            "files:files where files like/:(\"*#\";\"*##\")";
            "files:files where not files like \"*#\"";
            "files:files except files where files like \"*##\""
        );

        `a
    );

    `question`answers`correct!(
        "Which expression correctly enumerates and splays a table x against its own dedicated sym file named symt (where t is the table name), as used with .Q.ens across multiple tables?";

        `a`b`c`d!(
            "Splays x to today's date/table path using .Q.ens[`:.;value x;`$\"sym\",string x]";
            "Splays x to today's date/table path using .Q.en[`:.;value x] alone";
            "Uses .Q.dpft[`:.;.z.D;`p#;x] with no explicit sym domain";
            "Sets the table directly using .Q.ens[`:.;x;`sym]"
        );

        `a
    );

    `question`answers`correct!(
        "What does the max-length numeric suffix in functions like .Q.j12 / .Q.x12 versus .Q.j10 / .Q.x10 indicate, and what happens on decode if a string is shorter than that length?";

        `a`b`c`d!(
            "It indicates the max string length the function supports; on decode, shorter strings are padded with leading zeros to reach that length";
            "It indicates the compression level applied; shorter strings are left unpadded";
            "It indicates the enum domain size; shorter strings raise a 'length error";
            "It indicates the number of threads used to encode; it has no effect on decode"
        );

        `a
    )
 );
//====================================================================