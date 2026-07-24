//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Easy
//
//====================================================================
.quiz.joins.easy:`joinPurpose`leftJoin`asofJoin`innerJoin`unionJoin`crossJoin`plusJoin`exactMatch`ajTime`keyedTable`foreignKey`lookup`resultColumns`missingRows`duplicateKeys`joinKeys`ajPrevious`tableOrder`commonColumns`financialUse!
   (
    `question`answers`correct!(
        "What is the primary purpose of a join?";
        `a`b`c`d!(
            "Combine data from multiple tables";
            "Sort a table";
            "Compress data";
            "Enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What does lj perform?";
        `a`b`c`d!(
            "Left join";
            "Inner join";
            "Cross join";
            "Union join"
        );
        `a
    );

    `question`answers`correct!(
        "What does aj perform?";
        `a`b`c`d!(
            "As-of join";
            "Inner join";
            "Left join";
            "Cross join"
        );
        `a
    );

    `question`answers`correct!(
        "Which join returns only matching rows from both tables?";
        `a`b`c`d!(
            "Left join";
            "Inner join";
            "Cross join";
            "As-of join"
        );
        `b
    );

    `question`answers`correct!(
        "What does uj perform?";
        `a`b`c`d!(
            "Union join";
            "Unique join";
            "Update join";
            "Upper join"
        );
        `a
    );

    `question`answers`correct!(
        "What does cj perform?";
        `a`b`c`d!(
            "Cross join";
            "Column join";
            "Conditional join";
            "Compressed join"
        );
        `a
    );

    `question`answers`correct!(
        "What does pj perform?";
        `a`b`c`d!(
            "Plus join";
            "Partition join";
            "Previous join";
            "Primary join"
        );
        `a
    );

    `question`answers`correct!(
        "A left join matches rows using:";
        `a`b`c`d!(
            "Exact key values";
            "Nearest timestamps";
            "Random rows";
            "Column positions"
        );
        `a
    );

    `question`answers`correct!(
        "An as-of join is commonly used with:";
        `a`b`c`d!(
            "Time-series data";
            "CSV files";
            "Strings";
            "Namespaces"
        );
        `a
    );

    `question`answers`correct!(
        "Which type of table is commonly used with lj?";
        `a`b`c`d!(
            "Keyed table";
            "Dictionary";
            "General list";
            "String"
        );
        `a
    );

    `question`answers`correct!(
        "A foreign key is primarily used to:";
        `a`b`c`d!(
            "Reference another table";
            "Sort timestamps";
            "Compress symbols";
            "Enumerate columns"
        );
        `a
    );

    `question`answers`correct!(
        "Joins are commonly used to:";
        `a`b`c`d!(
            "Look up additional information";
            "Delete rows";
            "Sort columns";
            "Compress tables"
        );
        `a
    );

    `question`answers`correct!(
        "A successful join typically:";
        `a`b`c`d!(
            "Adds columns from another table";
            "Deletes columns";
            "Changes data types";
            "Compresses symbols"
        );
        `a
    );

    `question`answers`correct!(
        "If a left join finds no match, the new columns are typically:";
        `a`b`c`d!(
            "Null values";
            "Zero";
            "Removed";
            "Duplicated"
        );
        `a
    );

    `question`answers`correct!(
        "If the right table contains duplicate keys, a left join:";
        `a`b`c`d!(
            "Uses the first matching row";
            "Returns an error";
            "Uses the last matching row";
            "Deletes duplicates"
        );
        `c
    );

    `question`answers`correct!(
        "A join is performed using:";
        `a`b`c`d!(
            "Common key columns";
            "Row numbers";
            "Column order";
            "Memory addresses"
        );
        `a
    );

    `question`answers`correct!(
        "An as-of join returns:";
        `a`b`c`d!(
            "The most recent matching row at or before the timestamp";
            "The next timestamp";
            "Only exact timestamps";
            "Every matching timestamp"
        );
        `a
    );

    `question`answers`correct!(
        "In an lj[x;y], which table is enriched?";
        `a`b`c`d!(
            "The left table";
            "The right table";
            "Both equally";
            "Neither"
        );
        `a
    );

    `question`answers`correct!(
        "Join columns are typically:";
        `a`b`c`d!(
            "Present in both tables";
            "Always timestamps";
            "Always symbols";
            "Always integers"
        );
        `a
    );

    `question`answers`correct!(
        "Which join is most commonly used to align trades with quotes?";
        `a`b`c`d!(
            "As-of join";
            "Cross join";
            "Union join";
            "Inner join"
        );
        `a
    )
 );
//====================================================================