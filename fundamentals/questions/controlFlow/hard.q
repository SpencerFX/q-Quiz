//====================================================================
// HARD
//====================================================================

.fundamental.controlFlow.nestedVectorConditional:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - Nesting ? For A Third Branch";
    -1 "======================================";
    -1 "";
    -1 "? only picks between two outcomes - nest a second ? inside the false branch to classify a whole list into zero/positive/negative at once, using input: .inputs.controlFlow.hard.nestedVectorConditional";
    -1 "Input: ", -3!.inputs.controlFlow.hard`nestedVectorConditional;
    -1 "Expected Output: ", -3!.solutions.controlFlow.hard`nestedVectorConditional
 };

.fundamental.controlFlow.nestedIfWhileSearch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - if Inside while";
    -1 "======================================";
    -1 "";
    -1 "Combine while and if to linearly search a list for a target value, stopping as soon as it's found and returning its index (or -1), using input: .inputs.controlFlow.hard.nestedIfWhileSearch";
    -1 "Input: ", -3!.inputs.controlFlow.hard`nestedIfWhileSearch;
    -1 "Expected Output: ", -3!.solutions.controlFlow.hard`nestedIfWhileSearch
 };

.fundamental.controlFlow.doVsWhileEquivalence:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - do And while Agree";
    -1 "======================================";
    -1 "";
    -1 "Confirm directly that a do[n;...] loop and an equivalent while loop counting to the same n produce the same result, using input: .inputs.controlFlow.hard.doVsWhileEquivalence";
    -1 "Input: ", -3!.inputs.controlFlow.hard`doVsWhileEquivalence;
    -1 "Expected Output: ", -3!.solutions.controlFlow.hard`doVsWhileEquivalence
 };
