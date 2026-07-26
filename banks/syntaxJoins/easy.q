//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Easy
//
//====================================================================
.quiz.syntaxJoins.easy:`leftJoin`leftJoinF`asOfJoin`asOfJoinZero`asOfJoinF`innerJoin`windowJoin`unionJoin`upsertJoin`keyTable`joinColumns`joinKeys`joinPurpose`leftTable`rightTable`temporalJoin!
    (
    `question`answers`correct!(
        "Which q operator performs a left join?";

        `a`b`c`d!(
            "lj";
            "aj";
            "ij";
            "uj"
        );

        `a
    );

    `question`answers`correct!(
        "Which q operator performs a left join using a foreign key function?";

        `a`b`c`d!(
            "ljf";
            "ajf";
            "wj";
            "ij"
        );

        `a
    );

    `question`answers`correct!(
        "Which q join is commonly used for time-series data lookup?";

        `a`b`c`d!(
            "aj";
            "uj";
            "ij";
            "lj"
        );

        `a
    );

    `question`answers`correct!(
        "What does aj perform?";

        `a`b`c`d!(
            "As-of join using the latest time not after the timestamp";
            "A simple union";
            "A full outer join";
            "A table sort"
        );

        `a
    );

    `question`answers`correct!(
        "Which join returns only matching records from both tables?";

        `a`b`c`d!(
            "ij";
            "lj";
            "uj";
            "aj"
        );

        `a
    );

    `question`answers`correct!(
        "Which join combines rows from two tables without matching keys?";

        `a`b`c`d!(
            "uj";
            "aj";
            "lj";
            "ij"
        );

        `a
    );

    `question`answers`correct!(
        "Which join is designed for time-window based aggregation?";

        `a`b`c`d!(
            "wj";
            "lj";
            "ij";
            "uj"
        );

        `a
    );

    `question`answers`correct!(
        "What does lj preserve from the left table?";

        `a`b`c`d!(
            "All rows";
            "Only matching rows";
            "Only right rows";
            "Only keyed rows"
        );

        `a
    );

    `question`answers`correct!(
        "Before using aj, the quote and trade tables should usually be sorted by:";

        `a`b`c`d!(
            "Time column";
            "Symbol name only";
            "Row number";
            "Column count"
        );

        `a
    );

    `question`answers`correct!(
        "Which function converts a table into a keyed table?";

        `a`b`c`d!(
            "xkey";
            "xcol";
            "key";
            "keys"
        );

        `a
    );

    `question`answers`correct!(
        "A join requires matching:";

        `a`b`c`d!(
            "Key columns";
            "File names";
            "Namespaces";
            "Ports"
        );

        `a
    );

    `question`answers`correct!(
        "Which operator inserts or updates rows in a table?";

        `a`b`c`d!(
            "upsert";
            "select";
            "aj";
            "wj"
        );

        `a
    );

    `question`answers`correct!(
        "Which join is commonly used to attach quotes to trades?";

        `a`b`c`d!(
            "aj";
            "uj";
            "ij";
            "lj"
        );

        `a
    );

    `question`answers`correct!(
        "Which join keeps all columns from both matching tables?";

        `a`b`c`d!(
            "ij";
            "aj";
            "ljf";
            "aj0"
        );

        `a
    );

    `question`answers`correct!(
        "Which type of join is used when matching records based on time ordering?";

        `a`b`c`d!(
            "Temporal join";
            "Union join";
            "Inner join";
            "Left join"
        );

        `a
    );

    `question`answers`correct!(
        "The purpose of joins in kdb+ is mainly to:";

        `a`b`c`d!(
            "Combine related datasets";
            "Compress data";
            "Create processes";
            "Allocate memory"
        );

        `a
    )

 );

//====================================================================