//====================================================================
.quiz.general.easy:`atomsVsLists`generalList`mixedList`dictionary`keyedTable`keyedInternal`symbolInterning`stringsVsSymbols`projection`adverbs`each`over`scan`aj`lj`execSelect`flip`enumeration`vectorisation`peach!
   (
    `question`answers`correct!(
        "What is the difference between an atom and a list?";
        `a`b`c`d!(
            "Atoms are mutable";
            "Lists can only contain symbols";
            "Atoms are single values, lists are collections";
            "Atoms are tables"
        );
        `c
    );

    `question`answers`correct!(
        "What is a general list?";
        `a`b`c`d!(
            "A list of integers";
            "A list whose elements may have different types";
            "A keyed table";
            "A symbol list"
        );
        `b
    );

    `question`answers`correct!(
        "What is a mixed list?";
        `a`b`c`d!(
            "A dictionary";
            "Another name for a general list";
            "A sorted list";
            "A keyed table"
        );
        `b
    );

    `question`answers`correct!(
        "What is a dictionary?";
        `a`b`c`d!(
            "A mapping from keys to values";
            "A table";
            "A list";
            "A flip"
        );
        `a
    );

    `question`answers`correct!(
        "What is a keyed table?";
        `a`b`c`d!(
            "A list";
            "A table with one or more key columns";
            "A dictionary";
            "A symbol list"
        );
        `b
    );

    `question`answers`correct!(
        "Internally, a keyed table is represented as:";
        `a`b`c`d!(
            "A list";
            "A flip";
            "A dictionary whose keys and values are tables";
            "A symbol vector"
        );
        `c
    );

    `question`answers`correct!(
        "What is symbol interning?";
        `a`b`c`d!(
            "Compressing strings";
            "Storing each unique symbol once";
            "Sorting symbols";
            "Encrypting symbols"
        );
        `b
    );

    `question`answers`correct!(
        "When should strings be preferred over symbols?";
        `a`b`c`d!(
            "Ticker symbols";
            "Exchange codes";
            "Free-form text";
            "Country codes"
        );
        `c
    );

    `question`answers`correct!(
        "What is a projection?";
        `a`b`c`d!(
            "A partially applied function";
            "A join";
            "A table";
            "A dictionary"
        );
        `a
    );

    `question`answers`correct!(
        "What are adverbs in q?";
        `a`b`c`d!(
            "Data types";
            "Function modifiers";
            "Tables";
            "IPC messages"
        );
        `b
    );

    `question`answers`correct!(
        "What does each do?";
        `a`b`c`d!(
            "Runs a function on each item";
            "Joins tables";
            "Sorts data";
            "Compresses symbols"
        );
        `a
    );

    `question`answers`correct!(
        "What does over (/) perform?";
        `a`b`c`d!(
            "A fold/reduction";
            "Sorting";
            "An as-of join";
            "IPC"
        );
        `a
    );

    `question`answers`correct!(
        "What does scan (\\) return?";
        `a`b`c`d!(
            "The final reduction only";
            "Intermediate reductions";
            "A dictionary";
            "A keyed table"
        );
        `b
    );

    `question`answers`correct!(
        "What does aj perform?";
        `a`b`c`d!(
            "A left join";
            "A right join";
            "An as-of join";
            "An equi-join"
        );
        `c
    );

    `question`answers`correct!(
        "What does lj perform?";
        `a`b`c`d!(
            "Left join";
            "As-of join";
            "Union join";
            "Cross join"
        );
        `a
    );

    `question`answers`correct!(
        "Which statement returns a table?";
        `a`b`c`d!(
            "exec";
            "select";
            "value";
            "parse"
        );
        `b
    );

    `question`answers`correct!(
        "What does flip do?";
        `a`b`c`d!(
            "Converts a dictionary of equal-length lists into a table";
            "Converts symbols to strings";
            "Sorts a table";
            "Performs a transpose join"
        );
        `a
    );

    `question`answers`correct!(
        "Why enumerate symbols in an HDB?";
        `a`b`c`d!(
            "Reduce memory and disk usage";
            "Increase floating point precision";
            "Improve sorting only";
            "Avoid partitioning"
        );
        `a
    );

    `question`answers`correct!(
        "Why is q considered vectorised?";
        `a`b`c`d!(
            "Operations work on entire arrays";
            "Everything runs in parallel";
            "Everything is recursive";
            "Everything is compiled"
        );
        `a
    );

    `question`answers`correct!(
        "When is peach most useful?";
        `a`b`c`d!(
            "For independent work that can run in parallel";
            "For sorting";
            "For IPC";
            "For as-of joins"
        );
        `a
    )
 );
//====================================================================