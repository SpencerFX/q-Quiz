//====================================================================
//
// q-Quiz
//
// Topic      : Syntax Joins
// Difficulty : Hard
//
// Syntax-based multiple choice questions.
// Every answer is valid-looking q syntax,
// but only one is correct.
//
//====================================================================
.quiz.syntaxJoins.hard:`nestedAJSelect`nestedAJUpdate`nestedLJUpdate`nestedWindowJoin`nestedPlusJoin`nestedEquiJoin`keyedAJResult`functionalLJ`functionalAJ`nestedCrossJoin`chainedJoins`keyedJoinChain`updateFromJoin`selectFromJoin`joinWithXKey`windowJoinAggregation`foreignJoinChain`ajInsideExec`nestedJoinExpression`productionJoin!
    (
    `question`answers`correct!(
        "Which syntax correctly selects from an as-of join?";
        `a`b`c`d!(
            "select from aj[`sym`time;trade;quote]";
            "select aj[`sym`time;trade;quote]";
            "from aj[`sym`time;trade;quote] select";
            "select trade from aj[`sym`time;quote]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly updates trade using the result of an as-of join?";
        `a`b`c`d!(
            "update bid:aj[`sym`time;trade;quote]`bid from trade";
            "update bid from aj[`sym`time;trade;quote]";
            "update aj[`sym`time;trade;quote] from trade";
            "update bid:quote`bid from trade"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly updates a table using a left join?";
        `a`b`c`d!(
            "update sector:lj[pos;ref]`sector from pos";
            "update sector from lj[pos;ref]";
            "update lj[pos;ref] from pos";
            "select sector from lj[pos;ref]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a window join with an average aggregation?";
        `a`b`c`d!(
            "wj[w;`sym`time;trade;quote;(avg;`price)]";
            "wj[`sym`time;w;trade;quote;(avg;`price)]";
            "wj[trade;quote;w;(avg;`price)]";
            "wj[w;trade;quote]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a plus join?";
        `a`b`c`d!(
            "pj[pos;ref]";
            "pj[pos,ref]";
            "pos pj ref";
            "pj[pos]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an equi join on sym and exch?";
        `a`b`c`d!(
            "ej[`sym`exch;t1;t2]";
            "ej[t1;t2;`sym`exch]";
            "ej[`exch`sym;t1;t2]";
            "ej[t1,t2]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly keys the result of an as-of join?";
        `a`b`c`d!(
            "`sym xkey aj[`sym`time;trade;quote]";
            "aj[`sym`time;`sym xkey trade;quote]";
            "xkey[`sym;aj[`sym`time;trade;quote]]";
            "key aj[`sym`time;trade;quote]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a functional left join?";
        `a`b`c`d!(
            "lj[t1;t2]";
            ".[lj;(t1;t2)]";
            "@[lj;(t1;t2)]";
            "lj[t1,t2]"
        );
        `b
    );

    `question`answers`correct!(
        "Which syntax correctly performs a functional as-of join?";
        `a`b`c`d!(
            ".[aj;(`sym`time;t1;t2)]";
            "@[aj;(`sym`time;t1;t2)]";
            "aj[`sym`time;t1;t2]";
            "aj[t1;t2;`sym`time]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a cross join inside a select?";
        `a`b`c`d!(
            "select from cross[t1;t2]";
            "select cross[t1;t2]";
            "cross select[t1;t2]";
            "select from cross t1 t2"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly chains a left join after an as-of join?";
        `a`b`c`d!(
            "lj[aj[`sym`time;trade;quote];ref]";
            "aj[lj[trade;quote];ref]";
            "lj[trade;aj[`sym`time;quote;ref]]";
            "aj[trade;lj[quote;ref]]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly keys the result of a chained join?";
        `a`b`c`d!(
            "`sym xkey lj[aj[`sym`time;trade;quote];ref]";
            "lj[`sym xkey aj[`sym`time;trade;quote];ref]";
            "xkey[`sym;lj[aj[`sym`time;trade;quote];ref]]";
            "key lj[aj[`sym`time;trade;quote];ref]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly updates from a chained join?";
        `a`b`c`d!(
            "update sector:lj[pos;ref]`sector from pos";
            "update sector from lj[pos;ref]";
            "update lj[pos;ref] from pos";
            "update from lj[pos;ref]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly selects only price from an as-of join?";
        `a`b`c`d!(
            "select price from aj[`sym`time;trade;quote]";
            "select aj[`sym`time;trade;quote] price";
            "select price aj[`sym`time;trade;quote]";
            "price select from aj[`sym`time;trade;quote]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly joins after keying the left table?";
        `a`b`c`d!(
            "lj[`sym xkey trade;quote]";
            "lj[trade xkey `sym;quote]";
            "`sym lj trade quote";
            "lj[xkey trade;quote]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a window join using multiple aggregations?";
        `a`b`c`d!(
            "wj[w;`sym`time;trade;quote;((max;`price);(sum;`size))]";
            "wj[w;`sym`time;trade;quote;(max;`price;(sum;`size))]";
            "wj[w;trade;quote;max;sum]";
            "wj[w;`sym`time;trade;quote;(max,sum)]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly chains a foreign-key join after a left join?";
        `a`b`c`d!(
            "ljf[lj[pos;ref];sector]";
            "lj[ljf[pos;ref];sector]";
            "ljf[pos;lj[ref;sector]]";
            "ljf[pos;ref;sector]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly executes an expression over an as-of join?";
        `a`b`c`d!(
            "exec price from aj[`sym`time;trade;quote]";
            "exec aj[`sym`time;trade;quote] price";
            "exec from price aj[`sym`time;trade;quote]";
            "exec aj price"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax correctly nests an inner join inside a left join?";
        `a`b`c`d!(
            "lj[ij[t1;t2];t3]";
            "ij[lj[t1;t2];t3]";
            "lj[t1;ij[t2;t3]]";
            "ij[t1;lj[t2;t3]]"
        );
        `a
    );

    `question`answers`correct!(
        "Which syntax is the idiomatic production pattern for enriching trades with quotes and reference data?";
        `a`b`c`d!(
            "lj[aj[`sym`time;trade;quote];ref]";
            "aj[lj[trade;ref];quote]";
            "lj[trade;aj[`sym`time;quote;ref]]";
            "uj[trade;quote;ref]"
        );
        `a
    )
 );
//====================================================================