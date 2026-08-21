//====================================================================
//
// q-Quiz
//
// Topic      : Debug It - General
// Difficulty : Hard
//
// "Debug It" multiple choice questions - see easy.q for the format.
//
//====================================================================
.quiz.debugGeneral.hard:`insertVsUpsert`lengthMismatch`execVsSelect`iascIndices!
    (
    `question`answers`correct!(
        "t is a table keyed on sym, already holding a row for `AAPL.\n`t insert (`AAPL;200)\n\nWhat happens?";

        `a`b`c`d!(
            "It adds a second row for AAPL";
            "It silently does nothing";
            "It throws an error - insert requires unique keys; upsert is the one that updates on a key match";
            "It updates AAPL's existing row to the new value"
        );

        `c
    );

    `question`answers`correct!(
        "1 2 3+1 2\n\nWhat error does this throw?";

        `a`b`c`d!(
            "'length - the operands are lists of incompatible lengths (3 vs 2); elementwise ops need equal-length lists or one to be an atom";
            "'type";
            "'rank";
            "It doesn't error - the shorter list is padded with nulls"
        );

        `a
    );

    `question`answers`correct!(
        "t is a 2-row table.\nexec price from t\n\nWhat type of value does this return?";

        `a`b`c`d!(
            "A one-column table";
            "A dictionary mapping row number to price";
            "A plain list - exec (unlike select) narrows a single column down to a list, not a table";
            "A single atom (the last price)"
        );

        `c
    );

    `question`answers`correct!(
        "iasc 30 10 20\n\nWhat does this return?";

        `a`b`c`d!(
            "10 20 30 - the sorted list";
            "2 1 0 - the descending sort indices";
            "An error, since iasc needs already-sorted input";
            "1 2 0 - the indices that would sort the list ascending, not the sorted values themselves"
        );

        `d
    )
    )
