//====================================================================
// fundamentals — adverbs inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Note on style: bare "f/x" or "f\x" (reduce/scan with no parens
// around the verb+adverb) does not parse reliably as a standalone
// top-level expression or lambda body on this q build - it needs to
// be written "(f/)x" / "(f\)x" instead. Every reduce/scan/converge
// expression below (and in fundamentals/solutions/adverbs.q) is
// parenthesized for that reason; each ('), each-left (\:) and
// each-right (/:) don't have this issue.
//
// Also note: an anonymous function with no explicit [x]/[x;y] header
// takes its arguments as x (monadic) or x,y (dyadic) - not y,z - so
// every reducer/predicate function below uses x (and y for the
// second dyadic argument).
//====================================================================

.inputs.adverbs.easy:
    `eachLengths`eachLeft`overSum`scanRunningSum!(
        (enlist ("cat";"dog";"elephant";"ox"));
        (enlist 1 2 3);
        (enlist 1 2 3 4);
        (enlist 1 2 3 4)
    );

.inputs.adverbs.medium:
    `eachRight`eachBothPairwise`overWithSeed`scanRunningMax!(
        (enlist 1 2 3);
        ((1 2 3;4 5 6 7;10 20); (2 3 4;5 6 8;20 30));
        (100; 1 2 3 4);
        (enlist 1 3 2 5 4 6 2)
    );

.inputs.adverbs.hard:
    `convergeHalve`whileDouble`nestedEachBothDot!(
        (enlist 100);
        (enlist 1);
        ((1 2 3;4 5 6); (1 1 1;2 2 2))
    );
