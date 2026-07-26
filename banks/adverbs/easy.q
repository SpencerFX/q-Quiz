//====================================================================
//
// q-Quiz
//
// Topic      : Adverbs
// Difficulty : Easy
//
//====================================================================
.quiz.adverbs.easy:`adverbDefinition`each`over`scan`prior`eachRight`eachLeft`eachPair`fold`scanResult`functionModifier`derivedFunction`iteratorName`runningTotal`vectorProgramming`commonUsage`projection`nestedEach`binaryEach`functionalStyle!
    (

    `question`answers`correct!(
        "What is an adverb in q?";
        `a`b`c`d!(
            "A data type";
            "A function modifier";
            "A namespace";
            "A table"
        );
        `b
    );

    `question`answers`correct!(
        "Which adverb applies a function to every item of a list?";
        `a`b`c`d!(
            "each";
            "scan";
            "over";
            "prior"
        );
        `a
    );

    `question`answers`correct!(
        "Which adverb performs a reduction?";
        `a`b`c`d!(
            "scan";
            "each";
            "over";
            "prior"
        );
        `c
    );

    `question`answers`correct!(
        "Which adverb returns every intermediate reduction?";
        `a`b`c`d!(
            "scan";
            "over";
            "each";
            "prior"
        );
        `a
    );

    `question`answers`correct!(
        "What does prior compare each item with?";
        `a`b`c`d!(
            "The next item";
            "The previous item";
            "The first item";
            "The last item"
        );
        `b
    );

    `question`answers`correct!(
        "Which adverb fixes the left argument and iterates over the right?";
        `a`b`c`d!(
            "each-left";
            "each-right";
            "scan";
            "prior"
        );
        `b
    );

    `question`answers`correct!(
        "Which adverb fixes the right argument and iterates over the left?";
        `a`b`c`d!(
            "each-left";
            "each-right";
            "scan";
            "over"
        );
        `a
    );

    `question`answers`correct!(
        "Which adverb operates on neighbouring pairs of items?";
        `a`b`c`d!(
            "scan";
            "each";
            "each-pair";
            "prior"
        );
        `c
    );

    `question`answers`correct!(
        "Another name for over (/) is:";
        `a`b`c`d!(
            "Projection";
            "Fold";
            "Join";
            "Iterator"
        );
        `b
    );

    `question`answers`correct!(
        "What does scan return?";
        `a`b`c`d!(
            "Only the final value";
            "Intermediate values";
            "A table";
            "A dictionary"
        );
        `b
    );

    `question`answers`correct!(
        "Adverbs modify:";
        `a`b`c`d!(
            "Variables";
            "Functions";
            "Tables";
            "Namespaces"
        );
        `b
    );

    `question`answers`correct!(
        "Applying an adverb creates a:";
        `a`b`c`d!(
            "Derived function";
            "Dictionary";
            "Namespace";
            "Table"
        );
        `a
    );

    `question`answers`correct!(
        "Adverbs are also commonly referred to as:";
        `a`b`c`d!(
            "Iterators";
            "Attributes";
            "Modifiers";
            "Predicates"
        );
        `a
    );

    `question`answers`correct!(
        "Which adverb is commonly used for running totals?";
        `a`b`c`d!(
            "scan";
            "prior";
            "each";
            "over"
        );
        `a
    );

    `question`answers`correct!(
        "Adverbs encourage which programming style?";
        `a`b`c`d!(
            "Object-oriented";
            "Imperative";
            "Vector programming";
            "Procedural"
        );
        `c
    );

    `question`answers`correct!(
        "Which adverb is used most frequently in everyday q code?";
        `a`b`c`d!(
            "each";
            "prior";
            "scan";
            "each-pair"
        );
        `a
    );

    `question`answers`correct!(
        "A projection can be combined with:";
        `a`b`c`d!(
            "Adverbs";
            "Attributes only";
            "Tables only";
            "IPC handles only"
        );
        `a
    );

    `question`answers`correct!(
        "Nested each operations are commonly used with:";
        `a`b`c`d!(
            "Nested lists";
            "IPC";
            "HDB partitions";
            "Namespaces"
        );
        `a
    );

    `question`answers`correct!(
        "Can each be applied to binary functions?";
        `a`b`c`d!(
            "No";
            "Only on tables";
            "Yes";
            "Only with projections"
        );
        `c
    );

    `question`answers`correct!(
        "Why are adverbs fundamental in q?";
        `a`b`c`d!(
            "They replace SQL";
            "They express iteration without explicit loops";
            "They create namespaces";
            "They serialize data"
        );
        `b
    )

 );
//====================================================================