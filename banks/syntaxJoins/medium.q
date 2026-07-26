//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Medium
//
//====================================================================

.quiz.syntaxJoins.medium:`leftJoinSyntax`asOfJoinSyntax`innerJoinSyntax`windowJoinSyntax`unionJoinSyntax`ajSorting`ajColumnOrder`ajZeroBehavior`ljfBehavior`keyedJoin`foreignKeyJoin`joinProjection`tableKeying`joinPerformance`tradeQuoteJoin`functionalJoin!
    (
    `question`answers`correct!(
        "Which syntax performs a left join between tables t1 and t2?";

        `a`b`c`d!(
            "t1 lj t2";
            "lj[t1;t2]";
            "t1 aj t2";
            "t1 uj t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax performs an as-of join between trade and quote tables?";

        `a`b`c`d!(
            "trade aj quote";
            "trade lj quote";
            "trade ij quote";
            "trade uj quote"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax performs an inner join in q?";

        `a`b`c`d!(
            "t1 ij t2";
            "t1 lj t2";
            "t1 aj t2";
            "t1 uj t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax performs a window join?";

        `a`b`c`d!(
            "wj[w;t;c;b]";
            "wj[t;c;w;b]";
            "wj[t;b;c;w]";
            "windowJoin[t]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax combines two tables by stacking rows?";

        `a`b`c`d!(
            "uj";
            "lj";
            "aj";
            "ij"
        );

        `a
    );

    `question`answers`correct!(
        "Before using aj, the right table must generally be sorted by:";

        `a`b`c`d!(
            "Time column within each key";
            "Column names alphabetically";
            "Number of rows";
            "Memory size"
        );

        `a
    );

    `question`answers`correct!(
        "In an as-of join, which table provides the matching historical values?";

        `a`b`c`d!(
            "Right table";
            "Left table";
            "Both tables equally";
            "Neither table"
        );

        `a
    );

    `question`answers`correct!(
        "What is the difference between aj and aj0?";

        `a`b`c`d!(
            "aj0 returns the actual time from the quote table";
            "aj0 performs a left join";
            "aj0 removes all nulls";
            "aj0 sorts the table"
        );

        `a
    );

    `question`answers`correct!(
        "What does ljf provide compared with lj?";

        `a`b`c`d!(
            "A functional foreign key based join";
            "A faster as-of join";
            "A window aggregation";
            "A union operation"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement creates a keyed table?";

        `a`b`c`d!(
            "xkey `sym`time x";
            "key x";
            "xcol x";
            "keyed[x]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax joins using a key column relationship?";

        `a`b`c`d!(
            "select from t1 lj t2";
            "select from t1 where t2";
            "select from t1 aj t2";
            "select from t1 uj t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which join is most appropriate for enriching trades with latest quotes?";

        `a`b`c`d!(
            "aj";
            "uj";
            "ij";
            "lj"
        );

        `a
    );

    `question`answers`correct!(
        "When performing aj, the column order is important because:";

        `a`b`c`d!(
            "The time column must be the last key column";
            "Columns must always be alphabetical";
            "Only the first column is used";
            "Column order is ignored"
        );

        `a
    );

    `question`answers`correct!(
        "Which join is usually fastest for exact key lookups?";

        `a`b`c`d!(
            "Keyed table joins";
            "Window joins";
            "CSV joins";
            "Unsorted joins"
        );

        `a
    );

    `question`answers`correct!(
        "A typical market data enrichment workflow uses:";

        `a`b`c`d!(
            "Trades aj Quotes";
            "Trades uj Quotes";
            "Trades ij Quotes";
            "Trades lj Quotes"
        );

        `a
    );

    `question`answers`correct!(
        "Functional q joins are useful because they allow:";

        `a`b`c`d!(
            "Dynamic construction of joins";
            "Replacing all tables with lists";
            "Avoiding keys completely";
            "Removing timestamps"
        );

        `a
    )

 );

//====================================================================