//====================================================================
//
// q-Quiz
//
// Topic      : Joins
// Difficulty : Hard
//
//====================================================================
.quiz.joins.hard:`ajBinarySearch`sortedAttribute`ajVariants`aj0Meaning`ajfMeaning`keyingCost`lookupPerformance`enumeratedSymbols`cacheLocality`columnStore`partitionedJoin`multiColumnJoin`keyColumns`joinOrder`copyOnWrite`memoryAllocation`ejPerformance`xkeyBenefit`attributeChoice`productionChoice!
    (
    `question`answers`correct!(
        "Why is an as-of join typically very efficient on sorted data?";
        `a`b`c`d!(
            "It can efficiently locate the latest qualifying row";
            "It compresses the table";
            "It removes duplicate timestamps";
            "It parallelises automatically"
        );
        `a
    );

    `question`answers`correct!(
        "Which attribute most benefits an as-of join on a timestamp column?";
        `a`b`c`d!(
            "`g";
            "`u";
            "`s";
            "`p"
        );
        `c
    );

    `question`answers`correct!(
        "Why do the aj family of joins have multiple variants (aj, aj0, ajf, ajf0)?";
        `a`b`c`d!(
            "To provide different matching semantics";
            "To support different file formats";
            "To optimise compression";
            "To replace left joins"
        );
        `a
    );

    `question`answers`correct!(
        "What distinguishes aj0 from aj?";
        `a`b`c`d!(
            "It returns the matched timestamp from the right table";
            "It performs an exact join";
            "It only works on keyed tables";
            "It performs a window join"
        );
        `a
    );

    `question`answers`correct!(
        "Why might ajf be preferred over aj in some workflows?";
        `a`b`c`d!(
            "It fills values from the left table when appropriate";
            "It is always faster";
            "It avoids serialization";
            "It only works on HDBs"
        );
        `a
    );

    `question`answers`correct!(
        "What is a trade-off of keying a large table?";
        `a`b`c`d!(
            "Creating the key has an upfront cost";
            "The table becomes read-only";
            "Symbols are converted to strings";
            "The table can no longer be joined"
        );
        `a
    );

    `question`answers`correct!(
        "Why are keyed tables generally faster for repeated lookups?";
        `a`b`c`d!(
            "They provide efficient key-based access";
            "They are automatically compressed";
            "They remove duplicate rows";
            "They sort every column"
        );
        `a
    );

    `question`answers`correct!(
        "Why are symbol columns commonly enumerated before large joins?";
        `a`b`c`d!(
            "Integer comparisons are cheaper than string comparisons";
            "Enumeration sorts the data";
            "Enumeration removes duplicates";
            "Enumeration reduces timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "Why do column-oriented databases perform joins efficiently?";
        `a`b`c`d!(
            "Only required columns need to be read";
            "Rows are stored contiguously";
            "Joins are precomputed";
            "Everything is keyed"
        );
        `a
    );

    `question`answers`correct!(
        "Columnar storage improves join performance primarily because:";
        `a`b`c`d!(
            "Relevant values are stored contiguously in memory";
            "Rows are compressed into one block";
            "Joins become parallel automatically";
            "Tables require fewer columns"
        );
        `a
    );

    `question`answers`correct!(
        "When joining partitioned HDB tables, performance is improved because:";
        `a`b`c`d!(
            "Only relevant partitions may need to be scanned";
            "Every partition is cached";
            "Partitions eliminate joins";
            "Serialization is skipped"
        );
        `a
    );

    `question`answers`correct!(
        "Why can multi-column joins be more selective?";
        `a`b`c`d!(
            "They match on multiple criteria";
            "They require fewer comparisons";
            "They eliminate sorting";
            "They avoid null values"
        );
        `a
    );

    `question`answers`correct!(
        "Choosing inappropriate join columns can:";
        `a`b`c`d!(
            "Produce incorrect or inefficient results";
            "Automatically key the table";
            "Improve cache locality";
            "Compress the database"
        );
        `a
    );

    `question`answers`correct!(
        "Why is the order of joins important in large analytical queries?";
        `a`b`c`d!(
            "Joining smaller intermediate results can reduce work";
            "q executes joins alphabetically";
            "The parser requires it";
            "It affects serialization only"
        );
        `a
    );

    `question`answers`correct!(
        "How does copy-on-write benefit joins?";
        `a`b`c`d!(
            "Data is only copied when modifications are required";
            "Every join shares one table";
            "Tables become immutable";
            "Joins never allocate memory"
        );
        `a
    );

    `question`answers`correct!(
        "Which operation is most likely to require additional memory during a join?";
        `a`b`c`d!(
            "Creating the resulting table";
            "Reading a symbol";
            "Comparing integers";
            "Parsing the query"
        );
        `a
    );

    `question`answers`correct!(
        "Why can ej outperform manually filtering before joining?";
        `a`b`c`d!(
            "It performs the equality matching directly";
            "It automatically compresses tables";
            "It removes duplicate keys";
            "It parallelises every query"
        );
        `a
    );

    `question`answers`correct!(
        "Why can xkey improve repeated joins?";
        `a`b`c`d!(
            "The keyed representation can be reused";
            "It sorts every column";
            "It removes duplicate rows";
            "It compresses timestamps"
        );
        `a
    );

    `question`answers`correct!(
        "Applying the wrong attribute before a join may:";
        `a`b`c`d!(
            "Produce incorrect query results";
            "Automatically remove the attribute";
            "Only reduce performance";
            "Be ignored by q"
        );
        `a
    );

    `question`answers`correct!(
        "In a production kdb+ system, why might a gateway perform joins instead of clients?";
        `a`b`c`d!(
            "To centralise business logic and reduce client complexity";
            "Because clients cannot execute joins";
            "To improve symbol enumeration";
            "To avoid partitioning"
        );
        `a
    )
 );
//====================================================================