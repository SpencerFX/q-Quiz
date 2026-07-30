//====================================================================
//
// q-Quiz
//
// Topic      : RDB Intraday Writedown Solutions — Syntax Focus
// Source     : "RDB Intraday writedown solutions" by Colm McCarthy
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxIntraday.easy:`insertSyntax`countCompare`qEnPurpose`clearBuffer`hsymUsage`sublistSyntax`groupBySym`distinctSyms`countEach`amendSyntax`sSharpAttr`pSharpAttr!
    (
    `question`answers`correct!(
        "In the line t insert data;, what does this line do?";

        `a`b`c`d!(
            "Inserts the rows in data into table t";
            "Deletes rows from t matching data";
            "Sorts t by the columns in data";
            "Creates a new table named data"
        );

        `a
    );

    `question`answers`correct!(
        "What does MAXROWS<count value t evaluate to?";

        `a`b`c`d!(
            "A boolean: true if the row count of table t exceeds MAXROWS";
            "The number of rows remaining after a writedown";
            "The difference between MAXROWS and the row count of t";
            "A list of row indices greater than MAXROWS"
        );

        `a
    );

    `question`answers`correct!(
        "In the expression .Q.en[`:.]`. t, what is the purpose of .Q.en?";

        `a`b`c`d!(
            "It enumerates sym columns in the table against the on-disk sym file before the data is written to disk";
            "It encrypts the table before writing to disk";
            "It exports the table to CSV";
            "It applies the `p# attribute to the table"
        );

        `a
    );

    `question`answers`correct!(
        "What does @[`.;t;0#] do in the append function?";

        `a`b`c`d!(
            "Amends table t in the root namespace, replacing it with zero rows (clears the in-memory buffer)";
            "Appends zero rows to table t on disk";
            "Applies a zero-row where clause to t";
            "Deletes table t entirely from the namespace"
        );

        `a
    );

    `question`answers`correct!(
        "What does wrapping hsym around a table name, as in t:hsym t, do?";

        `a`b`c`d!(
            "Converts a table name/symbol into a file handle/symbol usable for on-disk access";
            "Sorts the table by symbol";
            "Applies the parted attribute to the table";
            "Converts the table into a keyed table"
        );

        `a
    );

    `question`answers`correct!(
        "What does cnt sublist .mem[t;s] return?";

        `a`b`c`d!(
            "The first cnt rows of the table stored at .mem[t;s]";
            "The last cnt rows of the table stored at .mem[t;s]";
            "A count of distinct rows in .mem[t;s]";
            "cnt copies of the table .mem[t;s]"
        );

        `a
    );

    `question`answers`correct!(
        "What does x group x`sym do when x is a table of new update rows?";

        `a`b`c`d!(
            "Groups the rows of x into sub-tables keyed by distinct sym value";
            "Sorts x in place by sym";
            "Removes duplicate syms from x";
            "Counts the number of distinct syms in x"
        );

        `a
    );

    `question`answers`correct!(
        "In the expression s:distinct x`sym, what does this return?";

        `a`b`c`d!(
            "A list of the unique sym values present in table x";
            "The number of distinct syms in x";
            "The first sym value in x";
            "A boolean indicating whether x has duplicate syms"
        );

        `a
    );

    `question`answers`correct!(
        "What does count each .mem[t]s compute, where s is a list of syms?";

        `a`b`c`d!(
            "The row count of each of the per-sym tables named in s within .mem[t]";
            "The total number of syms in .mem[t]";
            "The number of columns in each table in .mem[t]";
            "A single combined row count across all syms"
        );

        `a
    );

    `question`answers`correct!(
        "What does .[`.mem;(t;s);cnt _] do?";

        `a`b`c`d!(
            "Amends .mem[t;s], dropping the first cnt rows from that table";
            "Amends .mem[t;s], keeping only the first cnt rows";
            "Deletes the entire .mem[t;s] table";
            "Appends cnt blank rows to .mem[t;s]"
        );

        `a
    );

    `question`answers`correct!(
        "What does @[dir;`time;`s#] do?";

        `a`b`c`d!(
            "Applies the sorted attribute to the time column at path dir";
            "Applies the parted attribute to the time column";
            "Deletes the time column at path dir";
            "Renames the time column to `s#"
        );

        `a
    );

    `question`answers`correct!(
        "What does @[` sv dir,t,`;`sym;`p#] do?";

        `a`b`c`d!(
            "Applies the parted attribute to the sym column of the table at that path";
            "Applies the sorted attribute to the sym column";
            "Enumerates the sym column against the sym file";
            "Removes the sym column from the table"
        );

        `a
    )
 );
