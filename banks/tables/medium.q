//====================================================================
//
// q-Quiz
//
// Topic      : Tables
// Difficulty : Medium
//
//====================================================================
.quiz.tables.medium:`execVsSelect`updateVsSelect`deleteRows`xcol`xcols`xasc`xdesc`group`ungroup`keyValue`foreignKey`enumeration`schema`meta`distinct`byClause`fby`columnSelection`whereClause`virtualColumn!
    (
    `question`answers`correct!(
        "What is the primary difference between exec and select?";
        `a`b`c`d!(
            "exec returns lists or atoms, select returns tables";
            "exec is always faster";
            "select only works on keyed tables";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary difference between update and select?";
        `a`b`c`d!(
            "update modifies values, select returns a new table";
            "update only works on HDBs";
            "select modifies data";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "What does delete from remove?";
        `a`b`c`d!(
            "Rows";
            "Columns only";
            "Keys";
            "Attributes"
        );
        `a
    );

    `question`answers`correct!(
        "What does xcol primarily do?";
        `a`b`c`d!(
            "Rename one column";
            "Rename multiple columns";
            "Sort columns";
            "Delete columns"
        );
        `a
    );

    `question`answers`correct!(
        "What does xcols primarily do?";
        `a`b`c`d!(
            "Reorder or rename multiple columns";
            "Delete columns";
            "Key a table";
            "Group rows"
        );
        `a
    );

    `question`answers`correct!(
        "What does xasc do?";
        `a`b`c`d!(
            "Sort ascending";
            "Sort descending";
            "Create a key";
            "Flip a table"
        );
        `a
    );

    `question`answers`correct!(
        "What does xdesc do?";
        `a`b`c`d!(
            "Sort descending";
            "Delete duplicates";
            "Reverse columns";
            "Enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What does group return?";
        `a`b`c`d!(
            "A dictionary mapping values to row indices";
            "A table";
            "A keyed table";
            "A list of unique values"
        );
        `a
    );

    `question`answers`correct!(
        "What does ungroup primarily do?";
        `a`b`c`d!(
            "Expand grouped data back into rows";
            "Remove keys";
            "Flatten dictionaries";
            "Delete duplicates"
        );
        `a
    );

    `question`answers`correct!(
        "Applied to a keyed table, key and value return:";
        `a`b`c`d!(
            "The key table and value table";
            "Column names";
            "Metadata";
            "Attributes"
        );
        `a
    );

    `question`answers`correct!(
        "A foreign key column typically contains:";
        `a`b`c`d!(
            "References into another table";
            "Strings";
            "Floating point values";
            "Nested tables"
        );
        `a
    );

    `question`answers`correct!(
        "Why are foreign keys often enumerated?";
        `a`b`c`d!(
            "To reduce storage and improve lookup performance";
            "To sort tables";
            "To create partitions";
            "To remove duplicates"
        );
        `a
    );

    `question`answers`correct!(
        "What is meant by a table's schema?";
        `a`b`c`d!(
            "Its column names, types and attributes";
            "Its row count";
            "Its partition";
            "Its values"
        );
        `a
    );

    `question`answers`correct!(
        "Which function is commonly used to inspect a table's schema?";
        `a`b`c`d!(
            "meta";
            "count";
            "flip";
            "group"
        );
        `a
    );

    `question`answers`correct!(
        "What does distinct return?";
        `a`b`c`d!(
            "Unique values or rows";
            "Sorted rows";
            "Grouped rows";
            "Key columns"
        );
        `a
    );

    `question`answers`correct!(
        "What is the purpose of the by clause?";
        `a`b`c`d!(
            "Group rows before aggregation";
            "Sort rows";
            "Join tables";
            "Filter rows"
        );
        `a
    );

    `question`answers`correct!(
        "What does fby perform?";
        `a`b`c`d!(
            "A grouped calculation returning results aligned to the original rows";
            "A join";
            "A fold";
            "A window join"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement returns only selected columns while keeping a table?";
        `a`b`c`d!(
            "select";
            "exec";
            "count";
            "sum"
        );
        `a
    );

    `question`answers`correct!(
        "The where clause is primarily used to:";
        `a`b`c`d!(
            "Filter rows";
            "Rename columns";
            "Sort tables";
            "Create keys"
        );
        `a
    );

    `question`answers`correct!(
        "A virtual column is:";
        `a`b`c`d!(
            "A calculated column that is not physically stored";
            "A key column";
            "A symbol column";
            "A partition column"
        );
        `a
    )
 );
//====================================================================