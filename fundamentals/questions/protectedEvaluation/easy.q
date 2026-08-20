//====================================================================
//
// fundamentals - Protected Evaluation - Question Functions
//
// Auto-generated from .inputs.protectedEvaluation.easy/medium/hard
// config. Each function prints the exercise header/description and
// the input for that question, pulled from the corresponding input
// and solution banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.protectedEvaluation.protectAtBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - @ On The Success Path";
    -1 "======================================";
    -1 "";
    -1 "Use @[f;x;errFn] to apply f to x - when f succeeds, errFn is never touched, using input: .inputs.protectedEvaluation.easy.protectAtBasic";
    -1 "Input: ", -3!.inputs.protectedEvaluation.easy`protectAtBasic;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.easy`protectAtBasic
 };

.fundamental.protectedEvaluation.protectAtCatches:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - @ Catches An Error";
    -1 "======================================";
    -1 "";
    -1 "Use @[f;x;errFn] where f fails on x - errFn is called instead of the error propagating, using input: .inputs.protectedEvaluation.easy.protectAtCatches";
    -1 "Input: ", -3!.inputs.protectedEvaluation.easy`protectAtCatches;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.easy`protectAtCatches
 };

.fundamental.protectedEvaluation.protectAtConstantFallback:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - A Plain Value As The Fallback";
    -1 "======================================";
    -1 "";
    -1 "Use @[f;x;fb] where fb is a plain value, not a function - on error it's returned as-is rather than being called, using input: .inputs.protectedEvaluation.easy.protectAtConstantFallback";
    -1 "Input: ", -3!.inputs.protectedEvaluation.easy`protectAtConstantFallback;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.easy`protectAtConstantFallback
 };

.fundamental.protectedEvaluation.protectDotBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - . On The Success Path";
    -1 "======================================";
    -1 "";
    -1 "Use .[f;args;errFn] to apply a multi-argument function to a list of positional arguments, using input: .inputs.protectedEvaluation.easy.protectDotBasic";
    -1 "Input: ", -3!.inputs.protectedEvaluation.easy`protectDotBasic;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.easy`protectDotBasic
 };
