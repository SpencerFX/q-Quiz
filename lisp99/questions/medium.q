//====================================================================
//
// q-Quiz
//
// Topic      : Lisp-99
// Difficulty : Medium
//
// Auto-generated from .inputs.lisp99.easy/medium/hard config. Each
// function prints the exercise header/description and the input for
// that question, pulled from the corresponding input and solution
// banks. Based on the "Working with lists" section of L-99: Ninety-
// Nine Lisp Problems - translated into idiomatic q.
//
//====================================================================


//====================================================================
// MEDIUM
//====================================================================

.lisp99.isPalindrome:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 - Palindrome (P06)";
    -1 "======================================";
    -1 "";
    -1 "Determine whether a list reads the same forward and backward using input: .inputs.lisp99.medium.isPalindrome";
    -1 "Input: ", -3!.inputs.lisp99.medium`isPalindrome;
    -1 "Expected Output: ", -3!.solutions.lisp99.medium`isPalindrome
 };

.lisp99.compressConsecutive:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 -Compress (P08)";
    -1 "======================================";
    -1 "";
    -1 "Eliminate consecutive duplicates of list elements - each run of repeated elements collapses to a single copy, order preserved. Hint: q's differ verb marks where each new run begins. Using input: .inputs.lisp99.medium.compressConsecutive";
    -1 "Input: ", -3!.inputs.lisp99.medium`compressConsecutive;
    -1 "Expected Output: ", -3!.solutions.lisp99.medium`compressConsecutive
 };

.lisp99.splitAt:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 -Split At (P17)";
    -1 "======================================";
    -1 "";
    -1 "Split a list into two parts, given the length of the first part, using input: .inputs.lisp99.medium.splitAt";
    -1 "Input: ", -3!.inputs.lisp99.medium`splitAt;
    -1 "Expected Output: ", -3!.solutions.lisp99.medium`splitAt
 };

.lisp99.sliceRange:{[]
    -1 "";
    -1 "======================================";
    -1 " Lisp-99 -Slice (P18)";
    -1 "======================================";
    -1 "";
    -1 "Extract the slice between the I'th and K'th element of a list (both 1-indexed, inclusive) using input: .inputs.lisp99.medium.sliceRange";
    -1 "Input: ", -3!.inputs.lisp99.medium`sliceRange;
    -1 "Expected Output: ", -3!.solutions.lisp99.medium`sliceRange
 };
