//====================================================================
//
// q-Quiz
//
// Topic      : Attributes
// Difficulty : Medium
//
//====================================================================
.quiz.attributes.medium:`sortedBinarySearch`uniqueConstraint`partedOptimization`groupedOptimization`attributePersistence`attributeRemoval`attributeAfterUpdate`attributeVerification`metaAttributes`columnAttributes`sortedJoin`groupedLookup`partedColumn`attributeTradeoff`enumerationVsAttribute`applyAttributeTable`invalidSorted`performanceBenefit`attributeMaintenance`attributeSelection!
    (
    `question`answers`correct!(
        "Why does applying the sorted (`s#) attribute improve lookup performance?";

        `a`b`c`d!(
            "q can use binary search";
            "The data is compressed";
            "Rows become indexed automatically";
            "Symbols are enumerated"
        );

        `a
    );

    `question`answers`correct!(
        "What assumption does the unique (`u#) attribute make?";

        `a`b`c`d!(
            "No duplicate values exist";
            "Values are sorted";
            "Values are grouped";
            "Values are compressed"
        );

        `a
    );

    `question`answers`correct!(
        "The parted (`p#) attribute is most effective when:";

        `a`b`c`d!(
            "Equal values occur in contiguous blocks";
            "All values are unique";
            "The list is sorted numerically";
            "The table is keyed"
        );

        `a
    );

    `question`answers`correct!(
        "The grouped (`g#) attribute primarily accelerates:";

        `a`b`c`d!(
            "Grouping and equality lookups";
            "Arithmetic";
            "IPC serialization";
            "File compression"
        );

        `a
    );

    `question`answers`correct!(
        "After modifying a column with a sorted attribute, you should:";

        `a`b`c`d!(
            "Verify the attribute is still valid";
            "Always reapply the attribute";
            "Restart q";
            "Enumerate the column"
        );

        `a
    );

    `question`answers`correct!(
        "Which function is commonly used to inspect attributes?";

        `a`b`c`d!(
            "attr";
            "meta";
            "attrs";
            "type"
        );

        `a
    );

    `question`answers`correct!(
        "Which function displays attributes for table columns?";

        `a`b`c`d!(
            "meta";
            "attr";
            "cols";
            "key"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation benefits most from a sorted symbol column?";

        `a`b`c`d!(
            "Searching for specific symbols";
            "Summing integers";
            "Appending rows";
            "IPC messaging"
        );

        `a
    );

    `question`answers`correct!(
        "Applying an incorrect attribute can result in:";

        `a`b`c`d!(
            "Incorrect query results";
            "Automatic correction";
            "Table compression";
            "Enumeration"
        );

        `a
    );

    `question`answers`correct!(
        "Why are attributes considered metadata?";

        `a`b`c`d!(
            "They describe properties of the data";
            "They store additional rows";
            "They allocate memory";
            "They modify values"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute would typically benefit equality searches on repeated values?";

        `a`b`c`d!(
            "`g#";
            "`u#";
            "`s#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute generally provides the fastest exact lookup on ordered data?";

        `a`b`c`d!(
            "`s#";
            "`g#";
            "`u#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Attributes are most commonly applied to:";

        `a`b`c`d!(
            "Columns rather than entire tables";
            "Namespaces";
            "Functions";
            "Processes"
        );

        `a
    );

    `question`answers`correct!(
        "Enumeration and attributes are different because enumeration:";

        `a`b`c`d!(
            "Reduces storage, whereas attributes describe data properties";
            "Always sorts data";
            "Creates keyed tables";
            "Performs grouping"
        );

        `a
    );

    `question`answers`correct!(
        "Before applying the sorted attribute, you should ensure the data is:";

        `a`b`c`d!(
            "Actually sorted";
            "Compressed";
            "Enumerated";
            "Grouped"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes attributes in production kdb+ systems?";

        `a`b`c`d!(
            "They improve performance when their assumptions are valid";
            "They always improve every query";
            "They automatically repair bad data";
            "They eliminate the need for keys"
        );

        `a
    );

    `question`answers`correct!(
        "If a sorted column is updated out of order, the attribute becomes:";

        `a`b`c`d!(
            "Invalid";
            "Grouped";
            "Unique";
            "Enumerated"
        );

        `a
    );

    `question`answers`correct!(
        "What is the primary benefit of applying appropriate attributes?";

        `a`b`c`d!(
            "Improved query performance";
            "Smaller source code";
            "Faster IPC connections";
            "Reduced namespace usage"
        );

        `a
    );

    `question`answers`correct!(
        "Who is responsible for ensuring an attribute remains correct?";

        `a`b`c`d!(
            "The developer";
            "The q runtime";
            "The operating system";
            "The database automatically"
        );

        `a
    );

    `question`answers`correct!(
        "Choosing between `s#, `g#, `p#, and `u# depends primarily on:";

        `a`b`c`d!(
            "The structure and access pattern of the data";
            "The operating system";
            "The table name";
            "The IPC port"
        );

        `a
    )
 );
//====================================================================