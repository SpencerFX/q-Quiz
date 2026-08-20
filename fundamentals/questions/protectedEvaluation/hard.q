//====================================================================
// HARD
//====================================================================

.fundamental.protectedEvaluation.rethrowFromHandler:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - A Handler That Re-Signals";
    -1 "======================================";
    -1 "";
    -1 "Nest two levels of @ - the INNER errFn doesn't recover, it signals a NEW message built from the caught text, which the OUTER @ then catches, using input: .inputs.protectedEvaluation.hard.rethrowFromHandler";
    -1 "Input: ", -3!.inputs.protectedEvaluation.hard`rethrowFromHandler;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.hard`rethrowFromHandler
 };

.fundamental.protectedEvaluation.conditionalRecoveryValue:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - Different Fallback Per Error";
    -1 "======================================";
    -1 "";
    -1 "For each value in a list, catch a per-value error and have errFn inspect the caught text to decide which of several different fallback values to return, using input: .inputs.protectedEvaluation.hard.conditionalRecoveryValue";
    -1 "Input: ", -3!.inputs.protectedEvaluation.hard`conditionalRecoveryValue;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.hard`conditionalRecoveryValue
 };

.fundamental.protectedEvaluation.safeDivideReport:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Protected Evaluation - A Safe-Wrapper Report";
    -1 "======================================";
    -1 "";
    -1 "Divide two parallel lists of numerators and denominators pairwise, catching division by zero per pair, and return a `status`value dict for every pair (`ok or `error) instead of letting one bad pair kill the whole batch, using input: .inputs.protectedEvaluation.hard.safeDivideReport";
    -1 "Input: ", -3!.inputs.protectedEvaluation.hard`safeDivideReport;
    -1 "Expected Output: ", -3!.solutions.protectedEvaluation.hard`safeDivideReport
 };
