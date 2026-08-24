//====================================================================
//
// q-Quiz
//
// Topic      : Lisp-99
// Difficulty : Hard
//
// Auto-generated from .inputs.lisp99.easy/medium/hard config. Each
// function prints the exercise header/description and the input for
// that question, pulled from the corresponding input and solution
// banks. Based on the "Working with lists" section of L-99: Ninety-
// Nine Lisp Problems - translated into idiomatic q.
//
//====================================================================


//====================================================================
// HARD
//====================================================================

.lisp99.flattenNested:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 - Flatten (P07)";
    -1 "======================================";
    -1 "";
    -1 "Flatten an arbitrarily nested list structure into one flat list. Gotchas: .z.s does not correctly self-reference a lambda passed to each (it recurses forever) - write a named function instead. A same-type nested list (e.g. (`c;`d)) collapses to a typed vector, not general (0h), so test type x within 0 (any list) rather than type x=0h. And since this needs a named helper, submit it as an assignment followed by a reference to that name, e.g. \"f:{...f...}; f\" - a bare assignment statement like \"f:{...}\" alone evaluates to q's generic null, not the function. Using input: .inputs.lisp99.hard.flattenNested";
    -1 "Input: ", -3!.inputs.lisp99.hard`flattenNested;
    -1 "Expected Output: ", -3!.solutions.lisp99.hard`flattenNested
 };

.lisp99.packConsecutive:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 - Pack (P09)";
    -1 "======================================";
    -1 "";
    -1 "Pack consecutive duplicate elements into their own sub-lists (rather than collapsing them like the Compress problem). Hint: turn each run into a shared run-id (via differ and sums), then group by that id. Using input: .inputs.lisp99.hard.packConsecutive";
    -1 "Input: ", -3!.inputs.lisp99.hard`packConsecutive;
    -1 "Expected Output: ", -3!.solutions.lisp99.hard`packConsecutive
 };

.lisp99.runLengthEncode:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 - Run-Length Encode (P10)";
    -1 "======================================";
    -1 "";
    -1 "Run-length encode a list: each run of consecutive duplicates becomes a (count;value) pair, in order. Using input: .inputs.lisp99.hard.runLengthEncode";
    -1 "Input: ", -3!.inputs.lisp99.hard`runLengthEncode;
    -1 "Expected Output: ", -3!.solutions.lisp99.hard`runLengthEncode
 };
