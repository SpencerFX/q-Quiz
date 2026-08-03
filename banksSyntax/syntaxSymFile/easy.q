//====================================================================
//
// q-Quiz
//
// Topic      : Working with Sym Files — Syntax Focus
// Difficulty : Easy / Medium / Hard
//
//====================================================================

//--------------------------------------------------------------------
// EASY — reading individual syntax elements
//--------------------------------------------------------------------
.quiz.syntaxSymFile.easy:`enumOperator`enumExtendOperator`uAttrSyntax`castVsExtend`typeCheck20h`qEnArgs`getSymFile`dpftKeyArg`pSharpZippedError`jFuncEncode`xFuncDecode`gSharpLossThread`qpReturnVals!
    (
    `question`answers`correct!(
        "In the expression e:`x$p, what operator is being used and what does it do?";

        `a`b`c`d!(
            "The Enum operator ($); it converts the symbol list p into indices against the domain x";
            "The Enum Extend operator (?); it appends new values to domain x";
            "Cast; it converts p into a string list";
            "Cut; it splits p into sublists of length x"
        );

        `a
    );

    `question`answers`correct!(
        "In the expression e:`x?p, what operator is being used and what does it do differently from $?";

        `a`b`c`d!(
            "Enum Extend (?); it fills in any values missing from domain x rather than signaling a cast error";
            "Enum ($); it behaves identically to $";
            "Find; it returns the index of p in x without modifying x";
            "Match; it tests whether p and x are identical"
        );

        `a
    );

    `question`answers`correct!(
        "What does `u#distinct p do?";

        `a`b`c`d!(
            "Applies the unique attribute to the list of distinct values in p";
            "Applies the parted attribute to p";
            "Removes duplicate attributes from p";
            "Enumerates p against the u domain"
        );

        `a
    );

    `question`answers`correct!(
        "Given x does not contain all values in p, what happens when you run `x$p versus `x?p?";

        `a`b`c`d!(
            "`x$p signals a 'cast error; `x?p succeeds and extends x with the missing values";
            "Both signal a 'cast error";
            "Both succeed and extend x with the missing values";
            "`x$p succeeds; `x?p signals a 'cast error"
        );

        `a
    );

    `question`answers`correct!(
        "What does type e return for a 64-bit enumerated column in kdb+ V3.6+, regardless of domain?";

        `a`b`c`d!(
            "20h";
            "11h";
            "A value between 21h and 76h depending on the domain";
            "0h"
        );

        `a
    );

    `question`answers`correct!(
        "What are the two arguments to .Q.en, as used in the line hsym[`:db/t/] set .Q.en[`:db] t?";

        `a`b`c`d!(
            "The directory path where the sym file is stored, and the table itself";
            "The table name and the domain to enumerate against";
            "The column name and the default value";
            "The sym file path and the sym variable"
        );

        `a
    );

    `question`answers`correct!(
        "What does get `:db/sym return?";

        `a`b`c`d!(
            "The list of distinct symbol values stored in the sym file's string pool";
            "The integer-enumerated values of every symbol column on disk";
            "The row count of every table under db";
            "The attribute currently applied to the sym column"
        );

        `a
    );

    `question`answers`correct!(
        "In calls of the form .Q.dpft[directory;partition;`p#field;tablename], what does the p#field argument represent?";

        `a`b`c`d!(
            "The column to apply the parted attribute to when saving the partition";
            "The domain to enumerate the table against";
            "A flag indicating whether the sym file should be compressed";
            "The name of the sym file to create"
        );

        `a
    );

    `question`answers`correct!(
        "What error is signaled by hsym[`:db/] set .Q.en[`:db] t if the sym file at db/sym has been compressed?";

        `a`b`c`d!(
            "'no append to zipped enums";
            "'type";
            "'cast";
            "'splay"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.j12 do, as used in update gID:.Q.j12 each col4 from t?";

        `a`b`c`d!(
            "Encodes each string value in col4 to base64, returning a numeric identifier";
            "Decodes each value in col4 from base64 back to its original string";
            "Enumerates col4 against the sym domain";
            "Applies the parted attribute to col4"
        );

        `a
    );

    `question`answers`correct!(
        "What does .Q.x12 do, as used in update gxID:.Q.x12 each gID from t?";

        `a`b`c`d!(
            "Decodes each base64-encoded value in gID back into a padded string";
            "Encodes each value in gID to base64";
            "Removes the gID column from t";
            "Casts gID from long to symbol"
        );

        `a
    );

    `question`answers`correct!(
        "In the multithreaded sym rewrite, why is a:first `p`s inter attr s used instead of simply a:attr s?";

        `a`b`c`d!(
            "Because the grouped attribute (`g#) is not supported when setting values inside peach threads, so only `p# or `s# are kept";
            "Because attr s always returns a list that must be reduced with first";
            "Because inter is required to enumerate against multiple domains";
            "Because `p# and `s# cannot coexist on the same column"
        );

        `a
    );

    `question`answers`correct!(
        "What do the two possible return values of .Q.qp indicate when applied to a table name?";

        `a`b`c`d!(
            "1b for a partitioned table, 0b for a splayed table (and 0 for anything else)";
            "1b for a keyed table, 0b for an unkeyed table";
            "1b for a compressed table, 0b for an uncompressed table";
            "1b for an enumerated table, 0b for a non-enumerated table"
        );

        `a
    )
 );