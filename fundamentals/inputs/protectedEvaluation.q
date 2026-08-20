//====================================================================
// fundamentals — protected evaluation inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds
// - though there's no shared fixture TABLE here the way joins/qsql
// have; each problem's args list carries whatever functions/values
// it needs directly, since @/. themselves are the subject matter.
//
// Two style notes, both found by testing every expression here
// against a live q process before writing it down:
//
//   - Conditional signalling: `if[cond;'"literal text"]` does not
//     parse reliably on this q build, even when cond is false (so
//     it's a parse-time issue, not a runtime one). The ternary form
//     `$[cond;'"literal text";elseExpr]` works fine, and so does
//     `if[cond;'aVariableHoldingTheText]` - every conditional signal
//     below uses the ternary form.
//
//   - A lambda passed to each/each-both cannot see an ENCLOSING
//     function's parameters, only its own (same restriction already
//     hit for body-locals in fundamentals/questions/qsql.q's
//     .web.renderInfoValue helper) - protectAcrossEach below uses a
//     projection of @ itself (`@[f;;errFn]`) instead of a nested
//     lambda for exactly this reason.
//====================================================================

.inputs.protectedEvaluation.easy:
    `protectAtBasic`protectAtCatches`protectAtConstantFallback`protectDotBasic!(
        ({x+1}; 5; {`ERRORED});
        ({`a+1}; 0; {`ERRORED});
        ({`a+1}; 0; `FALLBACK);
        ({x+y}; (3;4); {x})
    );

.inputs.protectedEvaluation.medium:
    `protectDotCatches`signalCustomError`conditionalSignal`protectAcrossEach!(
        ({x+y}; (3;`a); {x});
        ({'"invalid input"}; 0; {x});
        ({[x] $[x<0;'"negative not allowed";x*2]}; -5; {x});
        ({[x] $[x=0;'"cannot divide by zero";10 div x]}; 2 0 5; -1)
    );

.inputs.protectedEvaluation.hard:
    `rethrowFromHandler`conditionalRecoveryValue`safeDivideReport!(
        (enlist 0);
        (enlist (0;-5;7));
        (3 10 6; 1 0 3)
    );
