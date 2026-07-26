//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Hard
//
//====================================================================
.quiz.syntaxJoins.hard:`ajTradeQuote`ajTimeOrdering`ajNullHandling`aj0Timestamp`ajfFunctional`wjVWAP`wjWindow`keyedPerformance`partitionJoin`hdbJoin`rdbJoin`functionalSQLJoin`joinMemory`joinColumns`joinOptimization`marketDataEnrichment!
    (
    `question`answers`correct!(
        "A tick database stores trades and quotes. Which join enriches each trade with the latest quote before the trade time?";

        `a`b`c`d!(
            "select from trade aj quote";
            "select from trade lj quote";
            "select from trade ij quote";
            "select from trade uj quote"
        );

        `a
    );

    `question`answers`correct!(
        "For aj, which requirement is critical for correct results?";

        `a`b`c`d!(
            "The right table is sorted by time within each key";
            "The left table must always be sorted alphabetically";
            "Both tables must have identical schemas";
            "The tables must be unkeyed"
        );

        `a
    );

    `question`answers`correct!(
        "What does aj0 provide that aj does not?";

        `a`b`c`d!(
            "The actual time from the matching right-side record";
            "Automatic sorting";
            "A full outer join";
            "Removal of null values"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes aj when no matching quote exists?";

        `a`b`c`d!(
            "The right-side columns contain null values";
            "The row is deleted";
            "The join fails";
            "The left table is replaced"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax represents a functional as-of join?";

        `a`b`c`d!(
            "aj[`sym`time;trade;quote]";
            "aj[trade;quote]";
            "ajf[quote;trade]";
            "trade aj quote"
        );

        `a
    );

    `question`answers`correct!(
        "A window join is commonly used for:";

        `a`b`c`d!(
            "Calculating aggregates over time windows";
            "Creating symbol files";
            "Loading scripts";
            "Compressing partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Which example best represents a window join use case?";

        `a`b`c`d!(
            "Calculate VWAP over the previous 5 minutes";
            "Rename a column";
            "Create a namespace";
            "Convert symbols to strings"
        );

        `a
    );

    `question`answers`correct!(
        "When joining large keyed tables, performance is improved because:";

        `a`b`c`d!(
            "Keys allow efficient lookup";
            "Keys remove all columns";
            "Keys compress timestamps";
            "Keys avoid serialization"
        );

        `a
    );

    `question`answers`correct!(
        "Why can joining directly across HDB partitions be expensive?";

        `a`b`c`d!(
            "Data may need to be loaded from disk";
            "q cannot join tables";
            "Partitions cannot contain keys";
            "Joins only work in RDB"
        );

        `a
    );

    `question`answers`correct!(
        "In a typical kdb+ architecture, where are real-time joins usually performed?";

        `a`b`c`d!(
            "RDB or gateway process";
            "Only the HDB";
            "CSV loader";
            "The sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Functional SQL joins are useful because:";

        `a`b`c`d!(
            "Join logic can be generated dynamically";
            "They eliminate tables";
            "They disable indexing";
            "They replace IPC"
        );

        `a
    );

    `question`answers`correct!(
        "When performing joins on very large tables, memory usage is affected by:";

        `a`b`c`d!(
            "Number of rows and columns being materialized";
            "Number of namespaces";
            "Console output size";
            "Number of q files"
        );

        `a
    );

    `question`answers`correct!(
        "Which approach reduces unnecessary data during joins?";

        `a`b`c`d!(
            "Select only required columns before joining";
            "Duplicate all columns";
            "Convert tables to lists";
            "Remove all keys"
        );

        `a
    );

    `question`answers`correct!(
        "Why is column selection important before a large join?";

        `a`b`c`d!(
            "It reduces memory and processing cost";
            "It changes timestamps";
            "It disables indexing";
            "It prevents sorting"
        );

        `a
    );

    `question`answers`correct!(
        "Which optimization is commonly used when enriching market data?";

        `a`b`c`d!(
            "Join only required symbols and time ranges";
            "Join every table in memory";
            "Convert all data to CSV";
            "Remove timestamps"
        );

        `a
    );

    `question`answers`correct!(
        "A trade/quote enrichment pipeline most commonly performs:";

        `a`b`c`d!(
            "As-of joins on symbol and timestamp";
            "Union joins on filenames";
            "Inner joins on row number";
            "Window joins on namespaces"
        );

        `a
    )

 );

//====================================================================