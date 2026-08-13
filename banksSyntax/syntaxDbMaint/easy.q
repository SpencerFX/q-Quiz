//====================================================================
//
// q-Quiz
//
// Topic      : dbmaint — Database Maintenance
// Difficulty : Easy
//
//
//====================================================================
.quiz.syntaxDbMaint.easy:`mainPurpose`checkTabExistence`getTableTypeFlat`getTableTypeMissing`getFSym`listCols`addTab`addTabTypes`delTab`renameTab`copyTab`reorderCols`addCol`addColExisting`delCol`renameCol`copyCol`fnCol`castCol`castColTypes`setAttr`setAttrTypes`rmAttr`addMissingCols`addMissingColsType!
    (
    `question`answers`correct!(
        "What is the main purpose of the dbmaint module?";

        `a`b`c`d!(
            "To make changes in a persisted kdb+ database";
            "To provide a real-time feed handler for trade and quote data";
            "To replace the kdb+ query language with SQL";
            "To compress all database files automatically"
        );

        `a
    );

    `question`answers`correct!(
        "What does checkTabExistence check?";

        `a`b`c`d!(
            "Whether a table exists in all relevant partitions of a database";
            "Whether every column contains only unique values";
            "Whether a table is sorted by time";
            "Whether a table is compressed"
        );

        `a
    );

    `question`answers`correct!(
        "What does getTableType return for an in-memory table stored directly in the database root?";

        `a`b`c`d!(
            "`flat";
            "`splayed";
            "`partOrMissing";
            "`partitioned"
        );

        `a
    );

    `question`answers`correct!(
        "What does getTableType return when the table is not found directly in the database root?";

        `a`b`c`d!(
            "`partOrMissing";
            "`flat";
            "`splayed";
            "`missingTable"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of getFSym?";

        `a`b`c`d!(
            "Convert a string, symbol, or file symbol into a file symbol";
            "Convert a file symbol into a table";
            "Convert a table into a symbol list";
            "Convert a symbol column into an enumerated column"
        );

        `a
    );

    `question`answers`correct!(
        "For a partitioned or splayed table, what does listCols return?";

        `a`b`c`d!(
            "The column names of the persisted table";
            "The list of partitions in the database";
            "The compression parameters of every column";
            "The attributes currently applied to every column"
        );

        `a
    );

    `question`answers`correct!(
        "What does addTab do?";

        `a`b`c`d!(
            "Adds a new table to the database";
            "Adds a new column to every table";
            "Adds a new partition to the database";
            "Adds a new symbol to the sym file only"
        );

        `a
    );

    `question`answers`correct!(
        "Which table types can addTab create according to its tabletype parameter?";

        `a`b`c`d!(
            "`splayed`, `partOrMissing`, or `flat`";
            "`sorted` or `unique` only";
            "`flat` or `keyed` only";
            "`splayed` only"
        );

        `a
    );

    `question`answers`correct!(
        "What does delTab do?";

        `a`b`c`d!(
            "Deletes a table from the database";
            "Deletes one column from a table";
            "Deletes one partition but leaves the table";
            "Deletes the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What does renameTab require about the old and new table names?";

        `a`b`c`d!(
            "They must be different";
            "They must be identical";
            "The new name must already exist";
            "The old name must not exist"
        );

        `a
    );

    `question`answers`correct!(
        "What does copyTab do?";

        `a`b`c`d!(
            "Copies an existing table to a new table name";
            "Copies only the first column of a table";
            "Copies one partition into memory";
            "Copies the sym file to another directory"
        );

        `a
    );

    `question`answers`correct!(
        "What does reorderCols change?";

        `a`b`c`d!(
            "The order of columns in a table";
            "The order of rows in a table";
            "The order of partitions in a database";
            "The order of symbols in the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What does addCol require in addition to the database and table name?";

        `a`b`c`d!(
            "A column name and a default value";
            "A partition date and a sort attribute";
            "A sym file and a query string";
            "A table name and a partition number"
        );

        `a
    );

    `question`answers`correct!(
        "What happens if addCol is asked to add a column that already exists?";

        `a`b`c`d!(
            "It signals an error indicating that the column already exists";
            "It silently overwrites the existing column";
            "It deletes the existing column first";
            "It changes the column's attribute"
        );

        `a
    );

    `question`answers`correct!(
        "What does delCol do?";

        `a`b`c`d!(
            "Deletes a column from a database table";
            "Deletes all rows containing nulls";
            "Deletes the column from only the first partition";
            "Removes the column's attribute but keeps its data"
        );

        `a
    );

    `question`answers`correct!(
        "What does renameCol change?";

        `a`b`c`d!(
            "The name of a column across the persisted table";
            "The datatype of a column";
            "The attribute of a column";
            "The name of the table containing the column"
        );

        `a
    );

    `question`answers`correct!(
        "What does copyCol do?";

        `a`b`c`d!(
            "Copies an existing column into a new column";
            "Copies the entire table into another database";
            "Copies one partition to another";
            "Copies the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What does fnCol allow you to do?";

        `a`b`c`d!(
            "Apply a unary function to a column across the persisted table";
            "Apply a binary join between two tables";
            "Rename a column using a function";
            "Apply an attribute without reading the column"
        );

        `a
    );

    `question`answers`correct!(
        "What is castCol used for?";

        `a`b`c`d!(
            "Casting a column to a specified type";
            "Sorting a column";
            "Compressing a column";
            "Enumerating a column against the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Which types can castCol accept according to its documentation?";

        `a`b`c`d!(
            "short, char, symbol, and string";
            "int, long, float, and timestamp only";
            "boolean and byte only";
            "date and time only"
        );

        `a
    );

    `question`answers`correct!(
        "What does setAttr do?";

        `a`b`c`d!(
            "Sets an attribute on a column";
            "Sets the datatype of a column";
            "Sets a table's partition date";
            "Sets the database path"
        );

        `a
    );

    `question`answers`correct!(
        "Which attributes does setAttr accept according to dbmaint.q?";

        `a`b`c`d!(
            "`s`, `u`, `p`, and `g";
            "`a`, `b`, `c`, and `d";
            "`p` and `s` only";
            "`u` and `g` only"
        );

        `a
    );

    `question`answers`correct!(
        "What does rmAttr do?";

        `a`b`c`d!(
            "Removes an attribute from a column";
            "Removes a column from a table";
            "Removes a partition from a database";
            "Removes compression from every database file"
        );

        `a
    );

    `question`answers`correct!(
        "What is addMissingCols designed to do?";

        `a`b`c`d!(
            "Add columns missing from some partitions using a complete table directory as the reference";
            "Add missing rows to a table";
            "Add missing partitions to a database";
            "Add missing symbols to the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Which table type is addMissingCols specifically restricted to?";

        `a`b`c`d!(
            "Partitioned tables";
            "Flat tables";
            "Splayed tables only";
            "Keyed tables"
        );

        `a
    )
    );