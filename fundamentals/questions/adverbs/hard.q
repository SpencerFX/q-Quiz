//====================================================================
// HARD
//====================================================================

.fundamental.adverbs.convergeHalve:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Converge";
    -1 "======================================";
    -1 "";
    -1 "Use scan with no explicit list (converge) to repeatedly integer-halve a number until the result stops changing, returning every intermediate value, using input: .inputs.adverbs.hard.convergeHalve";
    -1 "Input: ", -3!.inputs.adverbs.hard`convergeHalve;
    -1 "Expected Output: ", -3!.solutions.adverbs.hard`convergeHalve
 };

.fundamental.adverbs.whileDouble:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Conditional Iterate (While)";
    -1 "======================================";
    -1 "";
    -1 "Use the conditional form of over - a predicate function and a body function - to keep doubling a number while it stays under 100, using input: .inputs.adverbs.hard.whileDouble";
    -1 "Input: ", -3!.inputs.adverbs.hard`whileDouble;
    -1 "Expected Output: ", -3!.solutions.adverbs.hard`whileDouble
 };

.fundamental.adverbs.nestedEachBothDot:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Each-Both With Sum";
    -1 "======================================";
    -1 "";
    -1 "Use each-both with sum to compute the dot product of each corresponding pair of vectors from two lists of vectors using input: .inputs.adverbs.hard.nestedEachBothDot";
    -1 "Input: ", -3!.inputs.adverbs.hard`nestedEachBothDot;
    -1 "Expected Output: ", -3!.solutions.adverbs.hard`nestedEachBothDot
 };
