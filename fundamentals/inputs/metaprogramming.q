//====================================================================
// fundamentals — metaprogramming inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds.
// A parse tree in q is just a plain list: (function;arg1;arg2;...) -
// parse turns source text into that shape, eval runs it, and value
// does both at once (or runs an already-built tree directly). Since
// a tree is an ordinary list, functional-forms tools apply to it
// directly - swapOperatorInTree below reuses the exact @[d;k;f;y]
// amend pattern from fundamentals/solutions/functionalForms.q.
//
// One real gotcha found by testing every expression here against a
// live q process before writing it down: `eval` does not handle a
// tree whose head is ? (functional select) - `?[t;c;b;a]` called
// directly works fine, but `eval (?;t;c;b;a)` throws a type error.
// `value` on the exact same tree works. dynamicFunctionalSelectTree
// below uses value for this reason - eval is used everywhere else.
//====================================================================

.meta.trades:([]
    sym:`AAPL`GOOG`AAPL`MSFT;
    price:100 200 101 300;
    size:10 3 8 4
 );

.inputs.metaprogramming.easy:
    `parseBasic`evalParseTree`parseThenEval`valueOnString!(
        (enlist "1+2");
        (enlist (+;1;2));
        (enlist "3*4");
        (enlist "5-2")
    );

.inputs.metaprogramming.medium:
    `buildTreeManually`swapOperatorInTree`evalPartialTreeGivesProjection`parseLambdaString!(
        (3;4);
        (enlist (+;3;4));
        ((+;3); 4);
        ("{x+y}"; 3; 4)
    );

.inputs.metaprogramming.hard:
    `dynamicOperatorDispatch`composeTreeFragments`dynamicFunctionalSelectTree!(
        (`plus`minus`times`divide!(+;-;*;%); `times; 6; 3);
        ((+;1;2); (*;3;4));
        (.meta.trades; `AAPL)
    );
