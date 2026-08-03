//====================================================================
//
// q-Quiz
//
// Topic      : qSQL
// Difficulty : Easy
//
//====================================================================
.quiz.qsql.easy:`selectKeyword`updateKeyword`deleteKeyword`execKeyword`fromClause`whereClause`byClause`countRows`distinctValues`columnSelection`allColumns`ascendingSort`descendingSort`maxValue`minValue`sumColumn`avgColumn`lastValue`firstValue`tableName!
    (
    `question`answers`correct!(
        "Which keyword is used to retrieve data from a table?";

        `a`b`c`d!(
            "select";
            "update";
            "delete";
            "exec"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword modifies existing rows in a table?";

        `a`b`c`d!(
            "update";
            "select";
            "exec";
            "meta"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword removes rows from a table?";

        `a`b`c`d!(
            "delete";
            "drop";
            "remove";
            "erase"
        );

        `a
    );

    `question`answers`correct!(
        "Which qSQL keyword returns a list rather than a table?";

        `a`b`c`d!(
            "exec";
            "select";
            "update";
            "delete"
        );

        `a
    );

    `question`answers`correct!(
        "Which clause specifies the table being queried?";

        `a`b`c`d!(
            "from";
            "where";
            "by";
            "into"
        );

        `a
    );

    `question`answers`correct!(
        "Which clause filters rows?";

        `a`b`c`d!(
            "where";
            "by";
            "from";
            "order"
        );

        `a
    );

    `question`answers`correct!(
        "Which clause groups rows for aggregation?";

        `a`b`c`d!(
            "by";
            "where";
            "from";
            "exec"
        );

        `a
    );

    `question`answers`correct!(
        "Which function counts the number of rows?";

        `a`b`c`d!(
            "count";
            "sum";
            "avg";
            "max"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns the unique values of a column?";

        `a`b`c`d!(
            "distinct";
            "unique";
            "group";
            "value"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement selects only the sym column?";

        `a`b`c`d!(
            "select sym from trade";
            "exec from trade sym";
            "select from trade sym";
            "select trade.sym"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement returns every column?";

        `a`b`c`d!(
            "select from trade";
            "select * from trade";
            "exec * from trade";
            "select all trade"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword sorts data in ascending order?";

        `a`b`c`d!(
            "asc";
            "desc";
            "sort";
            "order"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword sorts data in descending order?";

        `a`b`c`d!(
            "desc";
            "asc";
            "sort";
            "reverse"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns the largest value?";

        `a`b`c`d!(
            "max";
            "sum";
            "avg";
            "last"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns the smallest value?";

        `a`b`c`d!(
            "min";
            "max";
            "avg";
            "count"
        );

        `a
    );

    `question`answers`correct!(
        "Which function calculates the total of a numeric column?";

        `a`b`c`d!(
            "sum";
            "count";
            "avg";
            "first"
        );

        `a
    );

    `question`answers`correct!(
        "Which function calculates the arithmetic mean?";

        `a`b`c`d!(
            "avg";
            "sum";
            "count";
            "med"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns the final value in a column?";

        `a`b`c`d!(
            "last";
            "tail";
            "max";
            "end"
        );

        `a
    );

    `question`answers`correct!(
        "Which function returns the first value in a column?";

        `a`b`c`d!(
            "first";
            "head";
            "min";
            "begin"
        );

        `a
    );

    `question`answers`correct!(
        "In the query 'select price from trade', what is 'trade'?";

        `a`b`c`d!(
            "The table name";
            "A column";
            "A namespace";
            "A function"
        );

        `a
    )
 );
//====================================================================