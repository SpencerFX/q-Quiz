//====================================================================
//
// q-Quiz
//
// Topic      : Debug It - General
// Difficulty : Easy
//
// "Debug It" multiple choice questions - each shows real, broken (or
// surprising) q code and asks what actually happens when it runs.
// Every example here was verified against a live q process before
// being written down, same as every other section this session -
// including two cases (question 1's y/z, question 2's missing
// backtick) where the FIRST assumption about what the bug even was
// turned out to be subtly wrong once actually tested.
//
//====================================================================
.quiz.debugGeneral.easy:`yzProjection`bareEnumDomain`distinctOrder`missingDictKey!
    (
    `question`answers`correct!(
        "This is meant to add two numbers:\n\nf:{y+z}\nf[3;4]\n\nWhat does f[3;4] actually return?";

        `a`b`c`d!(
            "7";
            "4, since only the second argument is used";
            "A projection still waiting for a third argument - q infers 3 parameters since z is referenced, so x and y get bound but z doesn't";
            "An error, since z is never defined"
        );

        `c
    );

    `question`answers`correct!(
        "ref:`AAPL`GOOG`MSFT\nref$`AAPL`GOOG\n\nThis is meant to enumerate symbols against the ref domain. What actually happens?";

        `a`b`c`d!(
            "It throws an error - ref (with no backtick) evaluates to its current VALUE first, not a domain-name reference";
            "It works, returning an enumerated list";
            "It silently extends the domain with any new values";
            "It returns the symbol `ref unchanged"
        );

        `a
    );

    `question`answers`correct!(
        "distinct 3 1 2 1 3\n\nWhat does this return?";

        `a`b`c`d!(
            "1 2 3 - distinct always sorts";
            "3 1 2 1 3 - distinct does nothing here since nothing repeats consecutively";
            "An error, since there are duplicate values";
            "3 1 2 - the first occurrence of each value, in the order it first appeared"
        );

        `d
    );

    `question`answers`correct!(
        "(`a`b!1 2)`z\n\nWhat happens when you index a dictionary with a key that isn't in it?";

        `a`b`c`d!(
            "It throws a 'key error";
            "It returns a typed null (eg 0N for a long-valued dict) - no error at all";
            "It returns the first value in the dictionary";
            "It silently adds the missing key with a null value"
        );

        `b
    )
    )
