//====================================================================
// HARD
//====================================================================

.fundamental.enumerations.enumerateViaQEnUtility:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - .Q.en";
    -1 "======================================";
    -1 "";
    -1 "Use the standard .Q.en utility to enumerate a whole table's sym column against a domain it manages for you in a given namespace, using input: .inputs.enumerations.hard.enumerateViaQEnUtility";
    -1 "Input: ", -3!.inputs.enumerations.hard`enumerateViaQEnUtility;
    -1 "Expected Output: ", -3!.solutions.enumerations.hard`enumerateViaQEnUtility
 };

.fundamental.enumerations.rawIndexBehindEnum:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - The Raw Index Underneath";
    -1 "======================================";
    -1 "";
    -1 "An enum is really just an index into its domain - cast an enumerated list to `long to expose those raw positions, using input: .inputs.enumerations.hard.rawIndexBehindEnum";
    -1 "Input: ", -3!.inputs.enumerations.hard`rawIndexBehindEnum;
    -1 "Expected Output: ", -3!.solutions.enumerations.hard`rawIndexBehindEnum
 };

.fundamental.enumerations.safeEnumBatch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - A Safe Enumeration Batch";
    -1 "======================================";
    -1 "";
    -1 "Enumerate every item of a list against a strict domain via each, catching per-item cast errors with @ and falling back to `UNKNOWN rather than letting one bad value fail the whole batch, using input: .inputs.enumerations.hard.safeEnumBatch";
    -1 "Input: ", -3!.inputs.enumerations.hard`safeEnumBatch;
    -1 "Expected Output: ", -3!.solutions.enumerations.hard`safeEnumBatch
 };
