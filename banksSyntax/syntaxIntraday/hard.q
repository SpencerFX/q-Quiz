//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxIntraday.hard:`writeToTmpFull`upsertVsInsert`functionalSelectSym`genQueryRaze`appendHDBKeys`endWTblsAttr`parDotAttr`disksortSig`writecountSig`updDollar`hopenReload`dpftUsage`clearTmpDirSyntax`enumerateSymfile`mixedTypeRaze!
    (
    `question`answers`correct!(
        "Which line correctly enumerates a sym s against the HDB sym file to get its integer partition value, as used in writeToTmp?";

        `a`b`c`d!(
            "i:sym?(HDBSYM?s)";
            "i:s?sym";
            "i:HDBSYM,s";
            "i:.Q.en[HDBSYM] s"
        );

        `a
    );

    `question`answers`correct!(
        "In writeToTmp, what does the expression (dir:` sv .Q.par[TMPSAVE;i;t],`)upsert .Q.en[HDBDIR]$[e;.mem[t;s];cnt sublist .mem[t;s]] do?";

        `a`b`c`d!(
            "Builds the on-disk partition path for sym i and table t, then upserts either the full in-memory table (if EOD) or the first cnt rows, enumerated against the HDB, into it";
            "Deletes the existing partition at path dir before writing new data";
            "Reads the partition at path dir back into memory as a new variable";
            "Sorts the in-memory table before writing it to the HDB directly"
        );

        `a
    );

    `question`answers`correct!(
        "Which functional-select expression correctly matches select from quote where int=sym?`eurusd?";

        `a`b`c`d!(
            "?[`quote;enlist(=;`int;enlist sym?`eurusd);0b;()]";
            "![`quote;enlist(=;`int;`eurusd);0b;()]";
            "?[`quote;();0b;enlist[`int]!enlist sym?`eurusd]";
            "?[`quote;(=;`sym;`eurusd);0b;()]"
        );

        `a
    );

    `question`answers`correct!(
        "In genQuery, what does the final raze tabs accomplish?";

        `a`b`c`d!(
            "Combines the list of per-sym result tables (from memory and/or disk) into a single result table";
            "Removes duplicate rows across all result tables";
            "Sorts the combined result by time";
            "Converts the list of tables into a dictionary keyed by sym"
        );

        `a
    );

    `question`answers`correct!(
        "In appendHDB, what does parts:key[TMPSAVE]except`sym return?";

        `a`b`c`d!(
            "The list of int-partition directory names present under TMPSAVE, excluding the sym symlink entry";
            "The list of tables present under TMPSAVE";
            "The list of syms that have been enumerated";
            "The list of columns shared across all partitions"
        );

        `a
    );

    `question`answers`correct!(
        "In .u.endWTbls, which line both sorts and applies the correct attribute to a temp table on disk in one call?";

        `a`b`c`d!(
            "{disksort[` sv TMPSAVE,x,`;`sym;`p#]}each t";
            "{xasc[` sv TMPSAVE,x,`;`sym]}each t";
            "{@[` sv TMPSAVE,x,`;`sym;`s#]}each t";
            "{.Q.dpft[TMPSAVE;x;`sym]}each t"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.par[`:.;x;`] return, as used to build the destination path in .u.end for w.q?";

        `a`b`c`d!(
            "The on-disk partition path for date x within the current HDB directory (with an empty table argument)";
            "The list of all partitions currently in the HDB";
            "The enumerated integer value of date x";
            "A handle to the tickerplant log for date x"
        );

        `a
    );

    `question`answers`correct!(
        "What are the three arguments to disksort, in order, as defined by disksort:{[t;c;a]...}?";

        `a`b`c`d!(
            "The handle to the on-disk table, the column name to part by, and a function to apply an attribute";
            "The table name, the number of rows, and a sort direction";
            "The table name, a Where clause, and an output path";
            "The column name, a comparison function, and a partition count"
        );

        `a
    );

    `question`answers`correct!(
        "What are the two arguments to writecount, and what does writecount:{[t;s]maxrows[t;s]-minrows[t;s]} return?";

        `a`b`c`d!(
            "Table t and sym s; it returns the number of rows to flush, i.e. the gap between the max and min thresholds for that table/sym";
            "Table t and column c; it returns the number of columns to write";
            "Sym s and a count n; it returns whether s has more than n rows";
            "Table t and a time t2; it returns the number of rows before t2"
        );

        `a
    );

    `question`answers`correct!(
        "In the partitioned solution's upd, which construct correctly expresses the conditional 'if t is in WRITETBLS do X, else do Y', as used for t in WRITETBLS?";

        `a`b`c`d!(
            "$[t in WRITETBLS;X;Y]";
            "?[t in WRITETBLS;X;Y]";
            "@[t in WRITETBLS;X;Y]";
            "![t in WRITETBLS;X;Y]"
        );

        `a
    );

    `question`answers`correct!(
        "What does if[h:@[hopen;`$\":\",.u.x 1;0];h\"\\\\l .\";hclose h] do at the end of .u.end?";

        `a`b`c`d!(
            "Attempts to open a handle to the HDB process and, if successful, sends it a reload command before closing the handle";
            "Opens a handle to the tickerplant and replays its log";
            "Reloads the RDB's own in-memory tables";
            "Opens a handle to the temporary directory and deletes it"
        );

        `a
    );

    `question`answers`correct!(
        "Which call correctly writes down a non-writedown table straight to the HDB using .Q.dpft, as used for tables not in WRITETBLS?";

        `a`b`c`d!(
            ".Q.dpft[`:.;x;`sym;t]";
            ".Q.dpft[t;x;`sym]";
            ".Q.dpft[`:.;`sym;x;t]";
            ".Q.en[`:.;x;t]"
        );

        `a
    );

    `question`answers`correct!(
        "What does system\"rm -rf \",(1_string TMPSAVE),\"/0/*\" do inside clearTmpDir?";

        `a`b`c`d!(
            "Removes all contents of the empty '0' placeholder partition, using the file-path string of TMPSAVE with its leading colon stripped off";
            "Deletes the entire TMPSAVE directory including the sym symlink";
            "Removes only files older than partition 0";
            "Deletes the HDB's own 0 partition"
        );

        `a
    );

    `question`answers`correct!(
        "In sym:@[get;HDBSYM;`symbol$()], what does the third argument `symbol$() provide?";

        `a`b`c`d!(
            "A default empty symbol list to use if get fails to read HDBSYM";
            "The type to cast the retrieved sym list to after reading";
            "The initial size to allocate for the sym list";
            "A filter applied to the sym list once read"
        );

        `a
    );

    `question`answers`correct!(
        "Why must unEnum be applied before razing on-disk (enumerated) results together with in-memory (symbol) results in genQuery?";

        `a`b`c`d!(
            "Because raze requires matching column types, and mixing enumerated (type 20) and plain symbol (type 11) sym columns would otherwise produce inconsistent types";
            "Because raze automatically enumerates all inputs";
            "Because in-memory tables cannot contain sym columns";
            "Because .Q.chk requires un-enumerated data"
        );

        `a
    )
 );
//====================================================================