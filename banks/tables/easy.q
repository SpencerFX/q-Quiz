//====================================================================
//
// q-Quiz
//
// Topic      : Tables
// Difficulty : Easy
//
//====================================================================
.quiz.tables.easy:`tableDefinition`flip`columnNames`rowCount`columnCount`keyedTable`unkeyedTable`insert`upsert`meta`cols`key`value`select`exec`update`delete`distinct`xkey`tableDictionary!
    (
    `question`answers`correct!(
        "What is a table in q?";
        `a`b`c`d!(
            "A collection of columns of equal length";
            "A list of dictionaries";
            "A collection of rows";
            "A symbol list"
        );
        `a
    );

    `question`answers`correct!(
        "Which function converts a dictionary into a table?";
        `a`b`c`d!(
            "flip";
            "meta";
            "cols";
            "key"
        );
        `a
    );

    `question`answers`correct!(
        "What does cols return?";
        `a`b`c`d!(
            "The column names";
            "The number of columns";
            "The column types";
            "The key columns"
        );
        `a
    );

    `question`answers`correct!(
        "How can you determine the number of rows in a table?";
        `a`b`c`d!(
            "count table";
            "rows table";
            "meta table";
            "cols table"
        );
        `a
    );

    `question`answers`correct!(
        "How can you determine the number of columns?";
        `a`b`c`d!(
            "count cols table";
            "count table";
            "meta table";
            "key table"
        );
        `a
    );

    `question`answers`correct!(
        "What is a keyed table?";
        `a`b`c`d!(
            "A table with one or more key columns";
            "A sorted table";
            "A partitioned table";
            "A compressed table"
        );
        `a
    );

    `question`answers`correct!(
        "An ordinary table without keys is called:";
        `a`b`c`d!(
            "An unkeyed table";
            "A general table";
            "A flip";
            "A dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "Which function adds rows to a table?";
        `a`b`c`d!(
            "insert";
            "meta";
            "flip";
            "exec"
        );
        `a
    );

    `question`answers`correct!(
        "What does upsert do?";
        `a`b`c`d!(
            "Inserts or updates rows";
            "Deletes rows";
            "Sorts a table";
            "Creates keys"
        );
        `a
    );

    `question`answers`correct!(
        "What does meta return?";
        `a`b`c`d!(
            "Table metadata";
            "The rows";
            "The keys";
            "The values"
        );
        `a
    );

    `question`answers`correct!(
        "What does key return when applied to a keyed table?";
        `a`b`c`d!(
            "The key table";
            "The column names";
            "The row count";
            "The values"
        );
        `a
    );

    `question`answers`correct!(
        "What does value return when applied to a keyed table?";
        `a`b`c`d!(
            "The value table";
            "The key columns";
            "The schema";
            "The attributes"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement returns a table?";
        `a`b`c`d!(
            "select";
            "exec";
            "count";
            "sum"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement typically returns a list or atom?";
        `a`b`c`d!(
            "exec";
            "select";
            "update";
            "delete"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement modifies column values?";
        `a`b`c`d!(
            "update";
            "select";
            "exec";
            "meta"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement removes rows from a table?";
        `a`b`c`d!(
            "delete";
            "update";
            "select";
            "exec"
        );
        `a
    );

    `question`answers`correct!(
        "What does distinct primarily do?";
        `a`b`c`d!(
            "Removes duplicate values";
            "Sorts a table";
            "Keys a table";
            "Updates rows"
        );
        `a
    );

    `question`answers`correct!(
        "What does xkey do?";
        `a`b`c`d!(
            "Creates a keyed table";
            "Sorts a table";
            "Flips a table";
            "Deletes duplicate rows"
        );
        `a
    );

    `question`answers`correct!(
        "Internally, an unkeyed table is:";
        `a`b`c`d!(
            "A flipped dictionary";
            "A keyed table";
            "A symbol list";
            "A nested list"
        );
        `a
    );

    `question`answers`correct!(
        "Why are all columns in a table required to have equal length?";
        `a`b`c`d!(
            "Each row must have one value for every column";
            "Compression requires it";
            "Keys require it";
            "IPC requires it"
        );
        `a
    )
 );
//====================================================================