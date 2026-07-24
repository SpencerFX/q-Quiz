//====================================================================
.quiz.syntax.easy:`assignment`globalAssignment`functionDefinition`functionArguments`comments`symbolLiteral`charVector`typedList`cast`lambda`brackets`semicolon`ifStatement`condStatement`returnValue`anonymousFunction`projectionSyntax`amend`update`delete!
    (
    `question`answers`correct!(
        "Which operator is used for assignment in q?";
        `a`b`c`d!(
            "=";
            ":";
            "::";
            "<-"
        );
        `b
    );

    `question`answers`correct!(
        "What does the :: operator do?";
        `a`b`c`d!(
            "Creates a namespace";
            "Performs global assignment";
            "Deletes a variable";
            "Creates a projection"
        );
        `b
    );

    `question`answers`correct!(
        "How is a function defined in q?";
        `a`b`c`d!(
            "function(x){...}";
            "{[x] ... }";
            "def(x)=...";
            "fn(x)=>..."
        );
        `b
    );

    `question`answers`correct!(
        "Where are function arguments declared?";
        `a`b`c`d!(
            "After the function body";
            "Inside square brackets";
            "Inside parentheses";
            "Using the args keyword"
        );
        `b
    );

    `question`answers`correct!(
        "How do you write a single-line comment?";
        `a`b`c`d!(
            "#";
            "//";
            "--";
            "/*"
        );
        `b
    );

    `question`answers`correct!(
        "How is the symbol IBM written?";
        `a`b`c`d!(
            "\"IBM\"";
            "`IBM";
            "'IBM'";
            ":IBM"
        );
        `b
    );

    `question`answers`correct!(
        "What is \"hello\" in q?";
        `a`b`c`d!(
            "A symbol";
            "A char vector";
            "A dictionary";
            "A general list"
        );
        `b
    );

    `question`answers`correct!(
        "What does 3#1 produce?";
        `a`b`c`d!(
            "111";
            "1 1 1";
            "3";
            "0 1 2"
        );
        `b
    );

    `question`answers`correct!(
        "Which operator is commonly used for casting?";
        `a`b`c`d!(
            "$";
            "#";
            "_";
            "?"
        );
        `a
    );

    `question`answers`correct!(
        "What is another name for an anonymous function?";
        `a`b`c`d!(
            "Lambda";
            "Iterator";
            "Dictionary";
            "Projection"
        );
        `a
    );

    `question`answers`correct!(
        "Which brackets surround function arguments?";
        `a`b`c`d!(
            "()";
            "[]";
            "{}";
            "<>"
        );
        `b
    );

    `question`answers`correct!(
        "What separates arguments inside function calls?";
        `a`b`c`d!(
            ",";
            ";";
            ":";
            "/"
        );
        `b
    );

    `question`answers`correct!(
        "Which function provides simple conditional execution?";
        `a`b`c`d!(
            "while";
            "if";
            "switch";
            "case"
        );
        `b
    );

    `question`answers`correct!(
        "Which construct is used for multiple conditional branches?";
        `a`b`c`d!(
            "cond";
            "loop";
            "switch";
            "exec"
        );
        `a
    );

    `question`answers`correct!(
        "By default, what does a q function return?";
        `a`b`c`d!(
            "Nothing";
            "The first expression";
            "The last evaluated expression";
            "The arguments"
        );
        `c
    );

    `question`answers`correct!(
        "Which of the following is an anonymous function?";
        `a`b`c`d!(
            "{x+y}";
            "sum";
            "select";
            "update"
        );
        `a
    );

    `question`answers`correct!(
        "What is {x+y}[2;] an example of?";
        `a`b`c`d!(
            "A projection";
            "An iterator";
            "A dictionary";
            "An adverb"
        );
        `a
    );

    `question`answers`correct!(
        "Which function modifies selected values in place?";
        `a`b`c`d!(
            "amend";
            "parse";
            "exec";
            "flip"
        );
        `a
    );

    `question`answers`correct!(
        "Which SQL keyword modifies existing rows?";
        `a`b`c`d!(
            "insert";
            "update";
            "select";
            "exec"
        );
        `b
    );

    `question`answers`correct!(
        "Which SQL keyword removes rows from a table?";
        `a`b`c`d!(
            "drop";
            "remove";
            "delete";
            "erase"
        );
        `c
    )
 );
//====================================================================