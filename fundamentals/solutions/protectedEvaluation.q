//====================================================================
// fundamentals — protected evaluation solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q /
// attributes.q for the same reasoning). See
// fundamentals/inputs/protectedEvaluation.q for the style notes on
// conditional signalling and the each/closure restriction these rely
// on.
//====================================================================

.solutions.protectedEvaluation.easy:
    `protectAtBasic`protectAtCatches`protectAtConstantFallback`protectDotBasic!(
        (@[{x+1};5;{`ERRORED}]);
        (@[{`a+1};0;{`ERRORED}]);
        (@[{`a+1};0;`FALLBACK]);
        (.[{x+y};(3;4);{x}])
    );

.solutions.protectedEvaluation.medium:
    `protectDotCatches`signalCustomError`conditionalSignal`protectAcrossEach!(
        (.[{x+y};(3;`a);{x}]);
        (@[{'"invalid input"};0;{x}]);
        (@[{[x] $[x<0;'"negative not allowed";x*2]};-5;{x}]);
        ((@[{[x] $[x=0;'"cannot divide by zero";10 div x]};;-1]) each 2 0 5)
    );

/ rethrowFromHandler: the OUTER errFn just returns whatever text it's
/ given - the interesting part is the INNER errFn, which doesn't
/ recover, it re-signals a NEW message built from the original error
/ text, so the outer @ is the one that actually catches something.
/ Both levels re-declare [x] explicitly rather than closing over an
/ outer x, sidestepping the each/closure restriction noted above even
/ though this isn't inside an each.
.solutions.protectedEvaluation.hard:
    `rethrowFromHandler`conditionalRecoveryValue`safeDivideReport!(
        ({[x] @[{[x] @[{x+`a};x;{'"wrapped: ",x}]};x;{x}]}[0]);
        ({@[{[x] $[x=0;'"zero";x<0;'"negative";x*2]};x;{$[x~"zero";-1;x~"negative";-2;-3]}]} each (0;-5;7));
        ({[n;d] .[{[n;d] $[d=0;'"division by zero";`status`value!(`ok;n div d)]};(n;d);{[e] `status`value!(`error;e)}]}'[3 10 6;1 0 3])
    );
