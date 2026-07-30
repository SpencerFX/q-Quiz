//====================================================================
//
// q-Quiz
//
// Topic      : qSQL
// Difficulty : Medium
//
//====================================================================
.quiz.qsql.medium:`execReturn`groupBy`computedColumn`whereOrder`withinKeyword`inKeyword`fbyKeyword`xbarKeyword`updateComputed`deleteWhere`aliasColumn`aggregation`multiGroup`selectVsExec`keyedLookup`updateBy`virtualColumn`lastBy`countBy`columnOrder!
    (
    `question`answers`correct!(
        "What does exec typically return?";

        `a`b`c`d!(
            "A list or scalar";
            "A table";
            "A dictionary only";
            "A keyed table"
        );

        `a
    );

    `question`answers`correct!(
        "What does the by clause do?";

        `a`b`c`d!(
            "Groups rows before aggregation";
            "Sorts the table";
            "Filters rows";
            "Deletes duplicates"
        );

        `a
    );

    `question`answers`correct!(
        "Which query creates a computed column called value?";

        `a`b`c`d!(
            "select value:price*size from trade";
            "select price*size:value from trade";
            "update value=price*size from trade";
            "exec value:price*size"
        );

        `a
    );

    `question`answers`correct!(
        "In a select statement, when is the where clause applied?";

        `a`b`c`d!(
            "Before aggregation";
            "After aggregation";
            "After sorting";
            "Last"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword tests whether values lie between two endpoints?";

        `a`b`c`d!(
            "within";
            "between";
            "inside";
            "range"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword tests membership in a list?";

        `a`b`c`d!(
            "in";
            "within";
            "contains";
            "like"
        );

        `a
    );

    `question`answers`correct!(
        "Which keyword performs grouped filtering?";

        `a`b`c`d!(
            "fby";
            "by";
            "within";
            "over"
        );

        `a
    );

    `question`answers`correct!(
        "What is xbar commonly used for?";

        `a`b`c`d!(
            "Bucketing values";
            "Sorting tables";
            "Removing duplicates";
            "Creating keys"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement updates price by increasing it 5%?";

        `a`b`c`d!(
            "update price:price*1.05 from trade";
            "select price:price*1.05 from trade";
            "exec price*1.05 from trade";
            "price:update 1.05"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement deletes only IBM rows?";

        `a`b`c`d!(
            "delete from trade where sym=`IBM";
            "delete trade where sym=`IBM";
            "remove from trade where sym=`IBM";
            "drop trade where sym=`IBM"
        );

        `a
    );

    `question`answers`correct!(
        "What does price:last price create?";

        `a`b`c`d!(
            "A new column alias";
            "A table key";
            "A partition";
            "A foreign key"
        );

        `a
    );

    `question`answers`correct!(
        "Which query returns the average price by symbol?";

        `a`b`c`d!(
            "select avg price by sym from trade";
            "select avg(price) from trade";
            "exec avg price from trade";
            "select price avg by sym"
        );

        `a
    );

    `question`answers`correct!(
        "Which clause groups by both sym and date?";

        `a`b`c`d!(
            "by sym,date";
            "group sym,date";
            "where sym,date";
            "partition sym,date"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary difference between select and exec?";

        `a`b`c`d!(
            "select returns tables; exec returns lists/scalars";
            "exec is faster";
            "exec modifies data";
            "There is no difference"
        );

        `a
    );

    `question`answers`correct!(
        "How do you retrieve a row from a keyed table named trade using key `IBM?";

        `a`b`c`d!(
            "trade[`IBM]";
            "select from trade where key=`IBM";
            "trade where `IBM";
            "lookup trade `IBM"
        );

        `a
    );

    `question`answers`correct!(
        "What does 'update avgPrice:avg price by sym from trade' produce?";

        `a`b`c`d!(
            "A grouped update where every row receives its group's average";
            "One row per symbol";
            "A keyed table";
            "A scalar"
        );

        `a
    );

    `question`answers`correct!(
        "Columns created inside a select statement are:";

        `a`b`c`d!(
            "Virtual unless written back";
            "Always persisted";
            "Always keyed";
            "Always enumerated"
        );

        `a
    );

    `question`answers`correct!(
        "Which query returns the last trade price by symbol?";

        `a`b`c`d!(
            "select last price by sym from trade";
            "select price:last by sym";
            "exec last by sym";
            "select last from trade"
        );

        `a
    );

    `question`answers`correct!(
        "Which aggregation counts rows within each group?";

        `a`b`c`d!(
            "count i";
            "rows";
            "size";
            "length"
        );

        `a
    );

    `question`answers`correct!(
        "Which query evaluates computed columns from left to right?";

        `a`b`c`d!(
            "select";
            "exec";
            "update";
            "delete"
        );

        `a
    )
 );
//====================================================================