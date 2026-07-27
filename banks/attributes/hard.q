//====================================================================
//
// q-Quiz
//
// Topic      : Attributes
// Difficulty : Hard
//
//====================================================================
.quiz.attributes.hard:`attributeIntegrity`sortedBinarySearch`groupedHashing`partedContiguous`uniqueAssumption`attributeCorruption`attributeReapply`attributePersistence`metaVerification`attributePerformance`attributeChoice`enumerationDifference`attributePropagation`attributeMutation`attributeValidity`joinOptimization`searchOptimization`attributeMaintenance`falseAttribute`productionUsage!
    (
    `question`answers`correct!(
        "What is the greatest risk of applying an incorrect attribute to data?";

        `a`b`c`d!(
            "Queries may return incorrect results because q trusts the attribute";
            "The table is automatically re-sorted";
            "The attribute is silently removed";
            "The data is compressed"
        );

        `a
    );

    `question`answers`correct!(
        "Why can the sorted (`s#) attribute significantly improve lookups?";

        `a`b`c`d!(
            "q may perform binary searches instead of linear scans";
            "The data is compressed";
            "Rows become keyed automatically";
            "Symbols are enumerated"
        );

        `a
    );

    `question`answers`correct!(
        "The grouped (`g#) attribute is internally optimized for:";

        `a`b`c`d!(
            "Repeated equality searches";
            "Arithmetic operations";
            "IPC serialization";
            "Sorting"
        );

        `a
    );

    `question`answers`correct!(
        "The parted (`p#) attribute assumes that:";

        `a`b`c`d!(
            "Equal values occur in contiguous blocks";
            "Values are unique";
            "Values are globally sorted";
            "The table is keyed"
        );

        `a
    );

    `question`answers`correct!(
        "The unique (`u#) attribute guarantees that:";

        `a`b`c`d!(
            "No duplicate values exist";
            "The data is sorted";
            "The data is grouped";
            "The column is keyed"
        );

        `a
    );

    `question`answers`correct!(
        "After updating values in an attributed column, the developer should:";

        `a`b`c`d!(
            "Verify that the attribute assumptions are still true";
            "Assume q automatically fixes the attribute";
            "Restart the process";
            "Re-enumerate every symbol"
        );

        `a
    );

    `question`answers`correct!(
        "Attributes are generally preserved only while:";

        `a`b`c`d!(
            "Their assumptions remain valid";
            "The process is idle";
            "The table is keyed";
            "The database is partitioned"
        );

        `a
    );

    `question`answers`correct!(
        "Which function is commonly used to inspect table metadata, including attributes?";

        `a`b`c`d!(
            "meta";
            "attr";
            "type";
            "value"
        );

        `a
    );

    `question`answers`correct!(
        "Which situation most likely invalidates a sorted attribute?";

        `a`b`c`d!(
            "Appending out-of-order values";
            "Selecting columns";
            "Saving to disk";
            "Enumerating symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Applying attributes correctly primarily improves:";

        `a`b`c`d!(
            "Execution efficiency";
            "Disk capacity";
            "IPC compatibility";
            "Function compilation"
        );

        `a
    );

    `question`answers`correct!(
        "When choosing an attribute, the most important consideration is:";

        `a`b`c`d!(
            "How the data will be queried";
            "The table name";
            "The number of columns";
            "The process ID"
        );

        `a
    );

    `question`answers`correct!(
        "Enumeration differs from attributes because enumeration:";

        `a`b`c`d!(
            "Reduces storage rather than describing data properties";
            "Automatically sorts values";
            "Creates grouped columns";
            "Builds keyed tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation is least likely to preserve an existing attribute?";

        `a`b`c`d!(
            "Updating values so the attribute assumptions no longer hold";
            "Reading the column";
            "Selecting rows";
            "Viewing metadata"
        );

        `a
    );

    `question`answers`correct!(
        "Why should developers avoid blindly reapplying attributes after every update?";

        `a`b`c`d!(
            "The data may no longer satisfy the attribute assumptions";
            "Attributes increase memory usage";
            "Attributes prevent serialization";
            "Attributes disable joins"
        );

        `a
    );

    `question`answers`correct!(
        "An incorrect attribute is dangerous because q generally:";

        `a`b`c`d!(
            "Trusts the attribute instead of validating it";
            "Automatically validates every query";
            "Removes invalid attributes";
            "Creates a warning for every lookup"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is most beneficial when repeatedly searching an ordered timestamp column?";

        `a`b`c`d!(
            "`s#";
            "`g#";
            "`u#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is typically most useful for long runs of identical values?";

        `a`b`c`d!(
            "`p#";
            "`u#";
            "`s#";
            "`i#"
        );

        `a
    );

    `question`answers`correct!(
        "In production kdb+ systems, attributes should generally be:";

        `a`b`c`d!(
            "Applied only when their assumptions are guaranteed";
            "Applied to every column";
            "Removed before querying";
            "Replaced with enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Which practice best ensures attribute correctness over time?";

        `a`b`c`d!(
            "Validate data whenever attributed columns are modified";
            "Restart the process daily";
            "Reload the HDB";
            "Recompile all functions"
        );

        `a
    );

    `question`answers`correct!(
        "The primary reason attributes exist in q is to:";

        `a`b`c`d!(
            "Allow the runtime to choose faster algorithms based on data properties";
            "Reduce source code size";
            "Improve IPC bandwidth";
            "Automatically partition databases"
        );

        `a
    )
 );
//====================================================================