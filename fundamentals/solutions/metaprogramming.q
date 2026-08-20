//====================================================================
// fundamentals — metaprogramming solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q /
// attributes.q / protectedEvaluation.q for the same reasoning). See
// fundamentals/inputs/metaprogramming.q for the eval-vs-value note
// this relies on.
//====================================================================

.solutions.metaprogramming.easy:
    `parseBasic`evalParseTree`parseThenEval`valueOnString!(
        (parse "1+2");
        (eval (+;1;2));
        (eval parse "3*4");
        (value "5-2")
    );

.solutions.metaprogramming.medium:
    `buildTreeManually`swapOperatorInTree`evalPartialTreeGivesProjection`parseLambdaString!(
        ({[a;b] eval (+;a;b)}[3;4]);
        ({[pt] eval @[pt;0;:;*]}[(+;3;4)]);
        ({[pt;y] (eval pt) y}[(+;3);4]);
        ({[s;a;b] (eval parse s)[a;b]}["{x+y}";3;4])
    );

.solutions.metaprogramming.hard:
    `dynamicOperatorDispatch`composeTreeFragments`dynamicFunctionalSelectTree!(
        ({[opMap;opName;a;b] eval (opMap opName;a;b)}[`plus`minus`times`divide!(+;-;*;%);`times;6;3]);
        ({[p1;p2] eval (+;p1;p2)}[(+;1;2);(*;3;4)]);
        ({[t;whichSym] value (?;t;enlist(=;`sym;enlist whichSym);0b;())}[.meta.trades;`AAPL])
    );
