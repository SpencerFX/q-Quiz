//====================================================================
// MEDIUM
//====================================================================

.fundamental.enumerations.extendDomainViaQuestion:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - Extend The Domain (?)";
    -1 "======================================";
    -1 "";
    -1 "Use `.enum.stocksB?xs instead of $ - it auto-extends the domain with any value not already present, rather than erroring, using input: .inputs.enumerations.medium.extendDomainViaQuestion";
    -1 "Input: ", -3!.inputs.enumerations.medium`extendDomainViaQuestion;
    -1 "Expected Output: ", -3!.solutions.enumerations.medium`extendDomainViaQuestion
 };

.fundamental.enumerations.domainAfterExtend:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - The Domain Itself Grows";
    -1 "======================================";
    -1 "";
    -1 "After extending .enum.stocksC with ?, return the domain global itself to confirm it was actually mutated, not just the enumerated result, using input: .inputs.enumerations.medium.domainAfterExtend";
    -1 "Input: ", -3!.inputs.enumerations.medium`domainAfterExtend;
    -1 "Expected Output: ", -3!.solutions.enumerations.medium`domainAfterExtend
 };

.fundamental.enumerations.protectedCast:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - Catching A Cast Error";
    -1 "======================================";
    -1 "";
    -1 "Use @ to catch the error that $ (unlike ?) signals when a value isn't already in the domain, using input: .inputs.enumerations.medium.protectedCast";
    -1 "Input: ", -3!.inputs.enumerations.medium`protectedCast;
    -1 "Expected Output: ", -3!.solutions.enumerations.medium`protectedCast
 };

.fundamental.enumerations.enumTableColumn:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Enumerations - Enumerating A Table Column";
    -1 "======================================";
    -1 "";
    -1 "Add an enumerated version of a table's sym column via update - the common real-world reason to enumerate at all, using input: .inputs.enumerations.medium.enumTableColumn";
    -1 "Input: ", -3!.inputs.enumerations.medium`enumTableColumn;
    -1 "Expected Output: ", -3!.solutions.enumerations.medium`enumTableColumn
 };
