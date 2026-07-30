//====================================================================
//
// q-Quiz
//
// Topic      : Syntax Joins
// Difficulty : Easy
//
// Syntax-based multiple choice questions.
// Every answer is valid-looking q syntax,
// but only one is correct.
//
//====================================================================
.quiz.syntaxJoins.easy:`leftJoin`innerJoin`unionJoin`asOfJoin`asOfJoinZero`leftJoinForeign`asOfJoinForeign`windowJoin`windowJoin1`plusJoin`equiJoin`keyTable`unkeyTable`upsert`crossJoin!
    (
    `question`answers`correct!(
        "Which syntax correctly performs a left join between t1 and t2?";

        `a`b`c`d!(
            "lj[t1;t2]";
            "lj[t1,t2]";
            "t1 lj t2";
            "lj t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an inner join?";

        `a`b`c`d!(
            "ij[t1;t2]";
            "ij[t1,t2]";
            "t1 ij t2";
            "ij t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a union join?";

        `a`b`c`d!(
            "uj[t1;t2]";
            "uj[t1,t2]";
            "t1 uj t2";
            "uj t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an as-of join?";

        `a`b`c`d!(
            "aj[`sym`time;t1;t2]";
            "aj[t1;t2;`sym`time]";
            "aj[`time`sym;t1;t2]";
            "aj[t1,`sym`time,t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an aj0?";

        `a`b`c`d!(
            "aj0[`sym`time;t1;t2]";
            "aj0[t1;t2;`sym`time]";
            "aj0[t1,`sym`time,t2]";
            "aj0[`time`sym;t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a left join using ljf?";

        `a`b`c`d!(
            "ljf[t1;t2]";
            "ljf[t1,t2]";
            "t1 ljf t2";
            "ljf t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an ajf?";

        `a`b`c`d!(
            "ajf[`sym`time;t1;t2]";
            "ajf[t1;t2;`sym`time]";
            "ajf[t1,`sym`time,t2]";
            "ajf[`time`sym;t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a window join?";

        `a`b`c`d!(
            "wj[w;`sym`time;t1;t2;(max;`price)]";
            "wj[`sym`time;w;t1;t2]";
            "wj[t1;t2;w]";
            "wj[w;t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a wj1?";

        `a`b`c`d!(
            "wj1[w;`sym`time;t1;t2;(sum;`size)]";
            "wj1[`sym`time;w;t1;t2]";
            "wj1[t1;t2;w]";
            "wj1[w;t1;t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a plus join?";

        `a`b`c`d!(
            "pj[t1;t2]";
            "pj[t1,t2]";
            "t1 pj t2";
            "pj t1 t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs an equi join?";

        `a`b`c`d!(
            "ej[`sym;t1;t2]";
            "ej[t1;t2;`sym]";
            "ej[t1,`sym,t2]";
            "ej[`sym`t1`t2]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly keys a table by sym?";

        `a`b`c`d!(
            "`sym xkey t";
            "xkey[`sym;t]";
            "t xkey `sym";
            "key[`sym;t]"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly removes the key from a keyed table?";

        `a`b`c`d!(
            "0!t";
            "!0 t";
            "unkey t";
            "key t"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly upserts rows into a table?";

        `a`b`c`d!(
            "upsert[t;rows]";
            "upsert[t,rows]";
            "t upsert rows";
            "rows upsert t"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax correctly performs a cross join?";

        `a`b`c`d!(
            "cross[t1;t2]";
            "cross[t1,t2]";
            "t1 cross t2";
            "cross t1 t2"
        );

        `a
    )
 );
//====================================================================