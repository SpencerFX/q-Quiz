//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Medium
//
//====================================================================
.quiz.joins.medium:`ljKeyed`ajSorted`ajVsLj`pjBehaviour`ujBehaviour`ijBehaviour`ejBehaviour`keyedLookup`foreignKeys`joinPerformance`ajUseCase`wjPurpose`wj1Purpose`joinColumns`duplicateColumns`nullMatches`crossJoinSize`joinSelection`tradeQuote`lookupTable!
    (
    `question`answers`correct!(
        "Which type of table is typically required on the right side of an lj?";
        `a`b`c`d!(
            "A keyed table";
            "An unkeyed table";
            "A dictionary";
            "A general list"
        );
        `a
    );

    `question`answers`correct!(
        "Why should the right table of an aj be sorted by time?";
        `a`b`c`d!(
            "To allow efficient as-of searching";
            "To compress the table";
            "To reduce symbol memory";
            "Because aj requires grouped attributes"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary semantic difference between lj and aj?";
        `a`b`c`d!(
            "lj uses exact matches, aj uses the latest prior match";
            "aj is always faster";
            "lj only works on symbols";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "What is the purpose of a plus join (pj)?";
        `a`b`c`d!(
            "Update matching numeric columns by addition";
            "Append rows";
            "Join on timestamps";
            "Perform a cross product"
        );
        `a
    );

    `question`answers`correct!(
        "What does a union join (uj) primarily do?";
        `a`b`c`d!(
            "Combines rows from both tables";
            "Performs an exact lookup";
            "Returns only matching rows";
            "Finds previous timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "What does an inner join return?";
        `a`b`c`d!(
            "Only rows that match in both tables";
            "All rows from the left table";
            "All rows from both tables";
            "The latest prior timestamp"
        );
        `a
    );

    `question`answers`correct!(
        "What does ej perform?";
        `a`b`c`d!(
            "An equi-join using specified columns";
            "An enumeration join";
            "An external join";
            "An exact timestamp join"
        );
        `a
    );

    `question`answers`correct!(
        "Why are keyed tables useful for joins?";
        `a`b`c`d!(
            "They provide efficient key lookups";
            "They automatically sort data";
            "They compress symbols";
            "They eliminate nulls"
        );
        `a
    );

    `question`answers`correct!(
        "Foreign keys in kdb+ are primarily used to:";
        `a`b`c`d!(
            "Reference rows in another table";
            "Partition HDBs";
            "Sort timestamps";
            "Compress strings"
        );
        `a
    );

    `question`answers`correct!(
        "Join performance is generally improved by:";
        `a`b`c`d!(
            "Using keyed tables where appropriate";
            "Converting symbols to strings";
            "Removing timestamps";
            "Making every table keyed"
        );
        `a
    );

    `question`answers`correct!(
        "Which join is most commonly used to enrich trades with market quotes?";
        `a`b`c`d!(
            "aj";
            "uj";
            "pj";
            "ij"
        );
        `a
    );

    `question`answers`correct!(
        "What is the purpose of wj?";
        `a`b`c`d!(
            "Window joins over time intervals";
            "Write joins";
            "Weighted sorting";
            "Wildcard joins"
        );
        `a
    );

    `question`answers`correct!(
        "How does wj1 differ from wj?";
        `a`b`c`d!(
            "It excludes the prevailing value before the window";
            "It requires keyed tables";
            "It performs exact joins only";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "Join columns should generally:";
        `a`b`c`d!(
            "Represent the same logical data";
            "Always have different names";
            "Always be integers";
            "Always be timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "If both tables contain a column with the same name that is not a join key:";
        `a`b`c`d!(
            "The right-hand value replaces the left-hand value";
            "The join fails";
            "Both columns are kept automatically";
            "The column is discarded"
        );
        `a
    );

    `question`answers`correct!(
        "If no matching row exists during an aj:";
        `a`b`c`d!(
            "The joined columns contain null values";
            "The row is removed";
            "The previous day's data is used";
            "The join fails"
        );
        `a
    );

    `question`answers`correct!(
        "What is the size of a cross join between tables of n and m rows?";
        `a`b`c`d!(
            "n × m rows";
            "n + m rows";
            "max(n;m)";
            "min(n;m)"
        );
        `a
    );

    `question`answers`correct!(
        "Which join is appropriate when matching on exact keys only?";
        `a`b`c`d!(
            "lj";
            "aj";
            "wj";
            "pj"
        );
        `a
    );

    `question`answers`correct!(
        "Which join is most appropriate for matching trades to the latest available quote?";
        `a`b`c`d!(
            "aj";
            "ij";
            "uj";
            "cj"
        );
        `a
    );

    `question`answers`correct!(
        "A small keyed table containing reference data is commonly called:";
        `a`b`c`d!(
            "A lookup table";
            "A partition";
            "A transaction log";
            "A gateway"
        );
        `a
    )
 );
//====================================================================