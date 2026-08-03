//====================================================================
//
// q-Quiz
//
// Topic      : Foreign Keys and Linked Columns — Syntax Focus
// Source     : "Foreign keys" whitepaper (code.kx.com/q/wp/foreign-keys)
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxForeignKeys.easy:`keyedTableDef`dollarEnumUpdate`insertSyntax`enumDisplayFormat`deleteRefEffect`castErrorInsert`dotNotationSingle`valueRemovesFK`bangLinkOperator`findOperatorUsage`xkeyUsage`ljBasic!
    (
    `question`answers`correct!(
        "In financials:([sym:`A`B`C] earningsPerShare:1.2 2.3 1.5; bookValPerShare:2.1 2.5 3.2), what does putting sym inside the square brackets achieve?";

        `a`b`c`d!(
            "Defines sym as the key column of the table, making financials a keyed table";
            "Restricts sym to only three possible values forever";
            "Applies the parted attribute to sym";
            "Marks sym as a foreign key referencing another table"
        );

        `a
    );

    `question`answers`correct!(
        "What does update sym:`financials$sym from `trade do?";

        `a`b`c`d!(
            "Enumerates the sym column of trade against the keyed table financials, turning it into a foreign key";
            "Deletes the sym column from trade and replaces it with financials";
            "Joins trade and financials on sym and keeps only matching rows";
            "Renames the sym column in trade to financials"
        );

        `a
    );

    `question`answers`correct!(
        "What does `trade insert (.z.T;`A;20.3) do?";

        `a`b`c`d!(
            "Inserts a new row into trade with the current time, sym A, and price 20.3";
            "Updates every existing row in trade to have sym A";
            "Creates a new table called trade with those three columns";
            "Deletes all rows in trade where sym is A"
        );

        `a
    );

    `question`answers`correct!(
        "What does the displayed result `financials$,`A mean when running exec sym from trade?";

        `a`b`c`d!(
            "The sym column is an enumerated (foreign-key) list against the financials domain, currently holding one value, A";
            "It is a literal string showing the query that was run";
            "It indicates an error occurred while enumerating sym";
            "It shows that financials has exactly one column named A"
        );

        `a
    );

    `question`answers`correct!(
        "After delete from `financials where sym=`A, why does the trade table's sym column, previously pointing to that row, now show B instead of A?";

        `a`b`c`d!(
            "Because trade's sym column stores a pointer/index into financials rather than the value itself, so deleting a row shifts what that index refers to";
            "Because deleting from financials automatically renames matching symbols in trade to B";
            "Because trade and financials share no real connection, so the change is coincidental";
            "Because delete triggers an automatic re-sort of trade by sym"
        );

        `a
    );

    `question`answers`correct!(
        "What error is signaled by `trade insert (.z.T;`D;12.1) when `D does not yet exist as a key in financials?";

        `a`b`c`d!(
            "'cast";
            "'type";
            "'length";
            "'index"
        );

        `a
    );

    `question`answers`correct!(
        "In select ... last price%sym.earningsPerShare ... from trade, what does the dot in sym.earningsPerShare do?";

        `a`b`c`d!(
            "Follows the foreign-key link from trade's sym column to look up the earningsPerShare value in the referenced financials table";
            "Concatenates the strings sym and earningsPerShare";
            "Casts sym to type earningsPerShare";
            "Accesses the sym column of a namespace called earningsPerShare"
        );

        `a
    );

    `question`answers`correct!(
        "What does update sym:value sym from `trade do to a foreign-key column?";

        `a`b`c`d!(
            "Removes the foreign-key mapping, replacing the enumerated column with its plain underlying values";
            "Deletes the sym column entirely from trade";
            "Converts sym into a compound (multi-column) foreign key";
            "Re-applies the foreign key using the current values as new keys"
        );

        `a
    );

    `question`answers`correct!(
        "In update finLink:`financials!financials.sym?sym from `equityPositions, what role does the ! (Enumeration) operator play here?";

        `a`b`c`d!(
            "It associates the domain name financials with the integer index values that follow, creating a linked column rather than a true enumerated foreign key";
            "It deletes the financials table and replaces it with the index values";
            "It performs a left join between equityPositions and financials";
            "It converts the index values into symbols"
        );

        `a
    );

    `question`answers`correct!(
        "In financials.sym?sym, what does the ? (Find) operator return?";

        `a`b`c`d!(
            "For each value in equityPositions' sym column, the row index of the first matching value in financials' sym column";
            "A boolean indicating whether every sym in equityPositions exists in financials";
            "The count of matching sym values between the two tables";
            "A new table containing only rows where sym matches in both tables"
        );

        `a
    );

    `question`answers`correct!(
        "What does exInfo:`sym`exID xkey 0!exInfo do?";

        `a`b`c`d!(
            "Re-keys exInfo so that both sym and exID together form its key column(s)";
            "Removes all keys from exInfo, making it a flat table";
            "Sorts exInfo by sym and exID";
            "Deletes the exID column from exInfo"
        );

        `a
    );

    `question`answers`correct!(
        "What does select time,sym,exSym from trade lj exInfo do?";

        `a`b`c`d!(
            "Performs a left join of trade with exInfo (matching on exInfo's key column) and selects the listed columns from the joined result";
            "Performs an inner join, dropping any trade rows without a match in exInfo";
            "Performs an as-of join between trade and exInfo on time";
            "Renames the sym column in trade to exSym"
        );

        `a
    )
 );