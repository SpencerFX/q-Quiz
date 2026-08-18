//====================================================================
// euler/inputs/inputs.q
//
// One registered test input per problem, in the exact "args list"
// shape .web.judgeEuler hands straight to .[func;input;errFn] - each
// problem's solve function takes a single xs argument, so every entry
// here is `enlist <xs>` (a 1-element list holding that one argument),
// same convention as diChallenges/inputs/inputs.q. The xs values
// themselves are the example calls already left in each problem's own
// file header comment (eg problem0001.q's "system\"ts solve 500
// 1000\""), reused as-is rather than inventing new ones.
//====================================================================

.inputs.euler.easy: (!) . flip raze 2 cut
    (
        (`problem0001; enlist 500 1000);
        (`problem0002; enlist 4000000);
        (`problem0003; enlist 600851475143);
        (`problem0004; enlist 101110 800000);
        (`problem0005; enlist 3 10);
        (`problem0006; enlist 3 10);
        (`problem0007; enlist 2 3 6);
        (`problem0008; enlist ((10;5;string`3675356291);(10;5;string`2709360626)))
    );
