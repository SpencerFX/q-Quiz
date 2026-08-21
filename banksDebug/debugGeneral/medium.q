//====================================================================
//
// q-Quiz
//
// Topic      : Debug It - General
// Difficulty : Medium
//
// "Debug It" multiple choice questions - see easy.q for the format.
//
//====================================================================
.quiz.debugGeneral.medium:`eachClosure`stringEqualityVector`attributeJoinVsAmend`applyVsDotApply!
    (
    `question`answers`correct!(
        "g:{x*2}\nf:{[xs] {g[x]} each xs}\nf[1 2 3]\n\nWhat happens when this runs?";

        `a`b`c`d!(
            "It works, but only doubles the first item";
            "It doubles each item: 2 4 6";
            "It throws an error - the lambda passed to each can't see g from the enclosing function, only its own parameters and globals";
            "It returns g itself, applied to the whole list at once"
        );

        `c
    );

    `question`answers`correct!(
        "x:\"target\"\n$[x=\"target\"; 1; 0]\n\nx is a string (char vector) compared to a string literal with =. What's the risk?";

        `a`b`c`d!(
            "None - = always gives a single true/false for two strings";
            "= is not defined for character data at all";
            "= only compares the first character of each string";
            "= compares element-by-element and returns a boolean VECTOR, not a single boolean - $[...]'s condition then misbehaves unless you use ~ for whole-string equality"
        );

        `d
    );

    `question`answers`correct!(
        "a:`s#1 2 3\nb:a,4\n\nDoes b still have the `s# (sorted) attribute?";

        `a`b`c`d!(
            "No - a plain join (,) always drops the attribute, even when the result would still satisfy it; only an in-place amend (a,:4) preserves it";
            "Yes, since the result is still sorted";
            "Yes, attributes are always preserved through any operation";
            "No, appending anything always throws an error"
        );

        `a
    );

    `question`answers`correct!(
        "f:{[a;b] a+b}\nf@(3;4)\n\nThis is meant to compute 3+4. What does f@(3;4) actually return?";

        `a`b`c`d!(
            "7";
            "An error, since f needs two arguments";
            "3, since only the first element of the tuple is used";
            "A projection - @ applies exactly one argument, so the whole tuple (3;4) is bound to a and b is left unbound; use . (dot-apply) for multiple positional arguments"
        );

        `d
    )
    )
