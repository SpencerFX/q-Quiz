//====================================================================
//
// q-Quiz
//
// Topic      : Syntax
// Difficulty : Hard
//
//====================================================================
.quiz.syntax.hard:`projectionEvaluation`parseTree`parseValue`functionalSQL`applyOperator`iteratorComposition`copyOnWrite`passByReference`namespaceResolution`contextSwitch`valueExecution`parseManipulation`amendVsUpdate`overScan`uniformFunctions`derivedFunctions`evaluationOrder`symbolResolution`functionValues`dynamicExecution!
    (
    `question`answers`correct!(
        "What is a projection in q?";
        `a`b`c`d!(
            "A function with one or more arguments already supplied";
            "A partially evaluated expression";
            "A parsed function";
            "A namespace"
        );
        `a
    );

    `question`answers`correct!(
        "What does parse return?";
        `a`b`c`d!(
            "A parse tree representing the expression";
            "Compiled bytecode";
            "The evaluated result";
            "A function"
        );
        `a
    );

    `question`answers`correct!(
        "Why are parse and value commonly used together?";
        `a`b`c`d!(
            "To inspect and dynamically evaluate expressions";
            "To speed up joins";
            "To serialize data";
            "To enumerate symbols"
        );
        `a
    );

    `question`answers`correct!(
        "Why is functional SQL useful?";
        `a`b`c`d!(
            "Queries can be generated programmatically";
            "It is always faster";
            "It avoids parsing";
            "It only works on HDBs"
        );
        `a
    );

    `question`answers`correct!(
        "What does the apply operator (.) do?";
        `a`b`c`d!(
            "Calls a function using a list of arguments";
            "Creates a projection";
            "Evaluates a parse tree";
            "Performs a join"
        );
        `a
    );

    `question`answers`correct!(
        "Why are iterators such as each, over and scan powerful?";
        `a`b`c`d!(
            "They derive new functions from existing ones";
            "They compile q code";
            "They create namespaces";
            "They optimize joins"
        );
        `a
    );

    `question`answers`correct!(
        "Why is assigning one variable to another usually inexpensive?";
        `a`b`c`d!(
            "q uses reference counting with copy-on-write";
            "Objects are immediately compressed";
            "Everything is stored on disk";
            "Variables always contain pointers to files"
        );
        `a
    );

    `question`answers`correct!(
        "When is data actually copied in q?";
        `a`b`c`d!(
            "When a shared object is modified";
            "Every assignment";
            "Every function call";
            "Every select statement"
        );
        `a
    );

    `question`answers`correct!(
        "How does q resolve an unqualified variable name?";
        `a`b`c`d!(
            "It searches the current namespace before parent contexts";
            "Alphabetically";
            "Globally only";
            "Using parse"
        );
        `a
    );

    `question`answers`correct!(
        "What does \\d primarily change?";
        `a`b`c`d!(
            "The current namespace";
            "The working directory";
            "The HDB partition";
            "The current process"
        );
        `a
    );

    `question`answers`correct!(
        "What does value do when given a string?";
        `a`b`c`d!(
            "Evaluates it as q code";
            "Parses it only";
            "Converts it to a symbol";
            "Creates a projection"
        );
        `a
    );

    `question`answers`correct!(
        "Why manipulate parse trees instead of strings?";
        `a`b`c`d!(
            "Parse trees are structured representations of code";
            "They execute faster";
            "They consume less memory";
            "They avoid namespaces"
        );
        `a
    );

    `question`answers`correct!(
        "When is amend preferable to rebuilding an entire object?";
        `a`b`c`d!(
            "When updating specific locations";
            "When sorting";
            "When joining";
            "When parsing"
        );
        `a
    );

    `question`answers`correct!(
        "What is the primary difference between over and scan?";
        `a`b`c`d!(
            "Over returns the final result, scan returns intermediate results";
            "Scan is parallel";
            "Over only works on numbers";
            "There is no difference"
        );
        `a
    );

    `question`answers`correct!(
        "Why are many q functions described as uniform?";
        `a`b`c`d!(
            "They automatically operate on atoms and lists";
            "They require equal-length lists";
            "They only work on vectors";
            "They are multithreaded"
        );
        `a
    );

    `question`answers`correct!(
        "What is produced when an iterator is applied to a function?";
        `a`b`c`d!(
            "A derived function";
            "A namespace";
            "A dictionary";
            "A parse tree"
        );
        `a
    );

    `question`answers`correct!(
        "Why should code avoid depending on evaluation order unless documented?";
        `a`b`c`d!(
            "It can make programs difficult to reason about";
            "It prevents joins";
            "It disables IPC";
            "It removes attributes"
        );
        `a
    );

    `question`answers`correct!(
        "What happens when value evaluates a symbol?";
        `a`b`c`d!(
            "The symbol is resolved to the object it names";
            "It becomes a string";
            "It becomes a dictionary";
            "It is parsed"
        );
        `a
    );

    `question`answers`correct!(
        "Functions in q are:";
        `a`b`c`d!(
            "First-class values";
            "Compile-time only";
            "Always anonymous";
            "Stored as strings"
        );
        `a
    );

    `question`answers`correct!(
        "Which feature makes it possible to build dynamic query generators in q?";
        `a`b`c`d!(
            "Combining parse, value and functional SQL";
            "Symbol enumeration";
            "Attributes";
            "IPC serialization"
        );
        `a
    )
 );
//====================================================================