//====================================================================
//
// q-Quiz
//
// Topic      : Syntax Joins
// Difficulty : Medium
//
// Syntax-based multiple choice questions.
// Every answer is valid-looking q syntax,
// but only one is correct.
//
//====================================================================
.quiz.syntaxJoins.medium:`multiColumnAJ`multiColumnAJ0`multiColumnAJF`multiColumnEJ`windowJoinMax`windowJoinSum`leftJoinKeyed`innerJoinKeyed`unionJoinKeyed`plusJoinKeyed`keyAfterJoin`joinInsideUpdate`joinInsideSelect`crossJoinNested`foreignKeyJoin!
    (
    `question`answers`correct!(
        "Which syntax correctly performs an as-of join using sym and time?";

        `a`b`c`d!(
            "aj[`sym`time;trade;quote]";
            "aj[trade;quote;`sym`time]";
            "aj[`time`sym;trade;quote]";
            "aj[trade,quote,`sym`time]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an aj0 using two join columns?";

        `a`b`c`d!(
            "aj0[`sym`time;trade;quote]";
            "aj0[trade;quote;`sym`time]";
            "aj0[`time`sym;trade;quote]";
            "aj0[trade,quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an ajf?";

        `a`b`c`d!(
            "ajf[`sym`time;trade;quote]";
            "ajf[trade;quote;`sym`time]";
            "ajf[`time`sym;trade;quote]";
            "ajf[trade,quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an equi join on sym?";

        `a`b`c`d!(
            "ej[`sym;trade;quote]";
            "ej[trade;quote;`sym]";
            "ej[`sym`time;trade;quote]";
            "ej[trade,quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a window join using max price?";

        `a`b`c`d!(
            "wj[w;`sym`time;trade;quote;(max;`price)]";
            "wj[`sym`time;w;trade;quote]";
            "wj[trade;quote;w;(max;`price)]";
            "wj[w;trade;quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a window join using sum size?";

        `a`b`c`d!(
            "wj[w;`sym`time;trade;quote;(sum;`size)]";
            "wj[`sym`time;w;trade;quote]";
            "wj[trade;quote;w;(sum;`size)]";
            "wj1[w;trade;quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly left joins two keyed tables?";

        `a`b`c`d!(
            "lj[t1;t2]";
            "lj[xkey t1;t2]";
            "t1 lj t2";
            "lj[t1,t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an inner join on keyed tables?";

        `a`b`c`d!(
            "ij[t1;t2]";
            "ij[t1,t2]";
            "t1 ij t2";
            "ij[xkey t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a union join?";

        `a`b`c`d!(
            "uj[t1;t2]";
            "uj[t1,t2]";
            "t1 uj t2";
            "uj[xkey t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a plus join?";

        `a`b`c`d!(
            "pj[t1;t2]";
            "pj[t1,t2]";
            "t1 pj t2";
            "pj[xkey t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly keys the result of a join?";

        `a`b`c`d!(
            "`sym xkey lj[t1;t2]";
            "lj[`sym xkey t1;t2]";
            "xkey[`sym;lj[t1;t2]]";
            "key lj[t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly updates trade using a left join?";

        `a`b`c`d!(
            "update px:lj[trade;quote]`px from trade";
            "update px from lj[trade;quote]";
            "update lj[trade;quote] from trade";
            "select from lj[trade;quote]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly selects from the result of an as-of join?";

        `a`b`c`d!(
            "select from aj[`sym`time;trade;quote]";
            "select aj[`sym`time;trade;quote]";
            "aj select[`sym`time;trade;quote]";
            "from aj[`sym`time;trade;quote] select"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a cross join inside a select?";

        `a`b`c`d!(
            "select from cross[t1;t2]";
            "select cross[t1;t2]";
            "cross select[t1;t2]";
            "from cross t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a foreign-key left join?";

        `a`b`c`d!(
            "ljf[t1;t2]";
            "ljf[t1,t2]";
            "t1 ljf t2";
            "ljf[xkey t1;t2]"
        );

        `a
    )
 );
//====================================================================