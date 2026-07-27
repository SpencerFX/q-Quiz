//====================================================================
//
// q-Quiz
//
// Topic      : Attributes
// Difficulty : Easy
//
//====================================================================
.quiz.attributes.easy:`sortedAttribute`uniqueAttribute`partedAttribute`groupedAttribute`attributePurpose`applyAttribute`removeAttribute`sortedList`uniqueValues`groupedData`attributeSyntax`attributePerformance`columnAttribute`tableAttribute`runtimeHints!
    (
    `question`answers`correct!(
        "Which attribute indicates that a list is sorted?";

        `a`b`c`d!(
            "`s#";
            "`u#";
            "`p#";
            "`g#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute indicates that values are unique?";

        `a`b`c`d!(
            "`u#";
            "`s#";
            "`p#";
            "`g#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is commonly used with grouped data?";

        `a`b`c`d!(
            "`g#";
            "`s#";
            "`u#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is used to indicate a parted list?";

        `a`b`c`d!(
            "`p#";
            "`u#";
            "`s#";
            "`g#"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of attributes in q?";

        `a`b`c`d!(
            "Provide metadata that improves operations";
            "Create new tables";
            "Start IPC connections";
            "Compile functions"
        );

        `a
    );

    `question`answers`correct!(
        "How is an attribute applied to a list?";

        `a`b`c`d!(
            "`s#x";
            "s#x";
            "#s x";
            "x#s"
        );

        `a
    );

    `question`answers`correct!(
        "How is an attribute removed from a list?";

        `a`b`c`d!(
            "`s#x";
            "`s#0 x";
            "`#s x";
            "remove[s;x]"
        );

        `a
    );

    `question`answers`correct!(
        "A sorted attribute tells q that data is:";

        `a`b`c`d!(
            "Already ordered";
            "Compressed";
            "Encrypted";
            "Grouped"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute helps q optimize searches on grouped data?";

        `a`b`c`d!(
            "`g#";
            "`s#";
            "`u#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Attributes are commonly applied to:";

        `a`b`c`d!(
            "Lists and table columns";
            "Processes";
            "Namespaces";
            "Ports"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute requires values to be unique?";

        `a`b`c`d!(
            "`u#";
            "`s#";
            "`g#";
            "`p#"
        );

        `a
    );

    `question`answers`correct!(
        "Which attribute is useful for columns partitioned by groups?";

        `a`b`c`d!(
            "`p#";
            "`g#";
            "`u#";
            "`s#"
        );

        `b
    );

    `question`answers`correct!(
        "A column with a sorted attribute can improve:";

        `a`b`c`d!(
            "Lookup performance";
            "Network speed";
            "Memory allocation";
            "IPC serialization"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax checks attributes on a list?";

        `a`b`c`d!(
            "attr x";
            "x attr";
            "`x#";
            "attributes[x]"
        );

        `a
    );

    `question`answers`correct!(
        "Attributes mainly provide hints to the:";

        `a`b`c`d!(
            "q runtime";
            "Operating system";
            "Database server";
            "Compiler"
        );

        `a
    )
 );
//====================================================================