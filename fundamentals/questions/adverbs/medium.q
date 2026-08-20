//====================================================================
// MEDIUM
//====================================================================

.fundamental.adverbs.eachRight:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Each-Right";
    -1 "======================================";
    -1 "";
    -1 "Use each-right (,/:) to pair a fixed value with every item in a list using input: .inputs.adverbs.medium.eachRight";
    -1 "Input: ", -3!.inputs.adverbs.medium`eachRight;
    -1 "Expected Output: ", -3!.solutions.adverbs.medium`eachRight
 };

.fundamental.adverbs.eachBothPairwise:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Each-Both";
    -1 "======================================";
    -1 "";
    -1 "Use each-both (') to intersect two lists of lists pairwise, position by position, using input: .inputs.adverbs.medium.eachBothPairwise";
    -1 "Input: ", -3!.inputs.adverbs.medium`eachBothPairwise;
    -1 "Expected Output: ", -3!.solutions.adverbs.medium`eachBothPairwise
 };

.fundamental.adverbs.overWithSeed:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Over With A Seed";
    -1 "======================================";
    -1 "";
    -1 "Use over with an explicit starting value (seed) to accumulate a list on top of it using input: .inputs.adverbs.medium.overWithSeed";
    -1 "Input: ", -3!.inputs.adverbs.medium`overWithSeed;
    -1 "Expected Output: ", -3!.solutions.adverbs.medium`overWithSeed
 };

.fundamental.adverbs.scanRunningMax:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Adverbs - Scan With A Custom Reducer";
    -1 "======================================";
    -1 "";
    -1 "Use scan with a custom two-argument function (max, via |) to get the running maximum of a list using input: .inputs.adverbs.medium.scanRunningMax";
    -1 "Input: ", -3!.inputs.adverbs.medium`scanRunningMax;
    -1 "Expected Output: ", -3!.solutions.adverbs.medium`scanRunningMax
 };
