//====================================================================
//
// q-Quiz
//
// Topic      : qSQL
// Difficulty : Hard
//
//====================================================================
.quiz.qsql.hard:`functionalSelect`functionalUpdate`executionOrder`whereBeforeBy`groupedUpdate`virtualColumns`keyedLookup`parseTree`ijVsLj`ajPurpose`ungroupBehavior`execScalar`iColumn`xColumn`fbyEvaluation`updatePersistence`metaInformation`attributePerformance`computedDependencies`selectPersistence!
    (
    `question`answers`correct!(
        "Which functional form executes a qSQL select?";

        `a`b`c`d!(
            "?";
            "!";
            "@";
            ".Q.qp"
        );

        `a
    );

    `question`answers`correct!(
        "Which functional form executes qSQL update/delete operations?";

        `a`b`c`d!(
            "!";
            "?";
            "@";
            ".Q.dpft"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation occurs before aggregation in qSQL?";

        `a`b`c`d!(
            "where";
            "by";
            "select";
            "order"
        );

        `a
    );

    `question`answers`correct!(
        "Why is the where clause evaluated before the by clause?";

        `a`b`c`d!(
            "Only qualifying rows should participate in aggregation";
            "To improve sorting";
            "To build keyed tables";
            "To enumerate symbols"
        );

        `a
    );

    `question`answers`correct!(
        "What is special about 'update avgPrice:avg price by sym from trade'?";

        `a`b`c`d!(
            "Each row receives its group's aggregate";
            "One row per group is returned";
            "The table becomes keyed";
            "Rows are reordered"
        );

        `a
    );

    `question`answers`correct!(
        "Columns created inside a select statement exist:";

        `a`b`c`d!(
            "Only in the query result";
            "Until the session exits";
            "Until garbage collection";
            "Permanently in the source table"
        );

        `a
    );

    `question`answers`correct!(
        "How is a single record retrieved from a keyed table?";

        `a`b`c`d!(
            "table[key]";
            "select where key";
            "lookup table";
            "exec key from table"
        );

        `a
    );

    `question`answers`correct!(
        "The functional qSQL forms primarily operate on:";

        `a`b`c`d!(
            "Parse trees";
            "Strings";
            "Regular expressions";
            "Namespaces"
        );

        `a
    );

    `question`answers`correct!(
        "Which join preserves all rows from the left table?";

        `a`b`c`d!(
            "lj";
            "ij";
            "uj";
            "pj"
        );

        `a
    );

    `question`answers`correct!(
        "Which join is specifically designed for time-series lookups?";

        `a`b`c`d!(
            "aj";
            "ij";
            "lj";
            "uj"
        );

        `a
    );

    `question`answers`correct!(
        "What does ungroup do?";

        `a`b`c`d!(
            "Expands nested lists into rows";
            "Removes duplicate rows";
            "Drops grouped columns";
            "Sorts grouped data"
        );

        `a
    );

    `question`answers`correct!(
        "Which qSQL statement is most appropriate when a scalar result is expected?";

        `a`b`c`d!(
            "exec";
            "select";
            "update";
            "delete"
        );

        `a
    );

    `question`answers`correct!(
        "Within qSQL, what does the virtual column i represent?";

        `a`b`c`d!(
            "The row index";
            "The table key";
            "The partition";
            "The timestamp"
        );

        `a
    );

    `question`answers`correct!(
        "Within grouped queries, what does x commonly represent?";

        `a`b`c`d!(
            "The current group";
            "The previous row";
            "The partition";
            "The key column"
        );

        `a
    );

    `question`answers`correct!(
        "When is an fby expression evaluated?";

        `a`b`c`d!(
            "Per group";
            "Per table";
            "Per partition";
            "Once per query"
        );

        `a
    );

    `question`answers`correct!(
        "Which qSQL statement permanently modifies a table?";

        `a`b`c`d!(
            "update";
            "select";
            "exec";
            "meta"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns metadata describing a table's columns?";

        `a`b`c`d!(
            "meta";
            "cols";
            "tables";
            "value"
        );

        `a
    );

    `question`answers`correct!(
        "Why are column attributes important to qSQL performance?";

        `a`b`c`d!(
            "They allow faster searching and grouping";
            "They automatically compress data";
            "They remove duplicates";
            "They key tables automatically"
        );

        `a
    );

    `question`answers`correct!(
        "Computed columns within a select statement are evaluated:";

        `a`b`c`d!(
            "From left to right";
            "Alphabetically";
            "Randomly";
            "After the result is returned"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement is true about a select query?";

        `a`b`c`d!(
            "It never modifies the original table";
            "It always updates the source table";
            "It removes rows from memory";
            "It converts the table into a keyed table"
        );

        `a
    )
 );
//====================================================================