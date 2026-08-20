//====================================================================
// MEDIUM
//====================================================================

.fundamental.protectedEvaluation.protectDotCatches:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - . Catches An Error";
    -1 "======================================";
    -1 "";
    -1 "Use .[f;args;errFn] where the underlying call fails (a type mismatch) - errFn receives the caught error TEXT, using input: .inputs.protectedEvaluation.medium.protectDotCatches";
    -1 "Input: ", -3!.inputs.protectedEvaluation.medium`protectDotCatches;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.medium`protectDotCatches
 };

.fundamental.protectedEvaluation.signalCustomError:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - Signalling Your Own Error";
    -1 "======================================";
    -1 "";
    -1 "Use ' to signal a custom error message, then catch it with @ and confirm errFn receives that exact text, using input: .inputs.protectedEvaluation.medium.signalCustomError";
    -1 "Input: ", -3!.inputs.protectedEvaluation.medium`signalCustomError;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.medium`signalCustomError
 };

.fundamental.protectedEvaluation.conditionalSignal:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - Signalling Conditionally";
    -1 "======================================";
    -1 "";
    -1 "Use @ to catch a custom error that's only signalled for certain inputs (negative numbers here) using input: .inputs.protectedEvaluation.medium.conditionalSignal";
    -1 "Input: ", -3!.inputs.protectedEvaluation.medium`conditionalSignal;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.medium`conditionalSignal
 };

.fundamental.protectedEvaluation.protectAcrossEach:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - Protecting Each Item In A List";
    -1 "======================================";
    -1 "";
    -1 "Apply @[f;x;fb] to every item of a list via each (some items succeed, one fails) so one bad item doesn't stop the whole list, using input: .inputs.protectedEvaluation.medium.protectAcrossEach";
    -1 "Input: ", -3!.inputs.protectedEvaluation.medium`protectAcrossEach;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.medium`protectAcrossEach
 };
