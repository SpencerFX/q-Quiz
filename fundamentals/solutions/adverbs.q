//====================================================================
// fundamentals — adverbs solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/adverbs.q for the style note on why every
// reduce/scan/converge use here is parenthesized "(f/)x" rather than
// bare "f/x", and why reducer functions use x/y, not y/z).
//====================================================================

.solutions.adverbs.easy:
    `eachLengths`eachLeft`overSum`scanRunningSum!(
        (count each ("cat";"dog";"elephant";"ox"));
        (1 2 3,\:10);
        ((+/)1 2 3 4);
        ((+\)1 2 3 4)
    );

.solutions.adverbs.medium:
    `eachRight`eachBothPairwise`overWithSeed`scanRunningMax!(
        (10,/:1 2 3);
        ((1 2 3;4 5 6 7;10 20) inter' (2 3 4;5 6 8;20 30));
        (({x+y}/)[100;1 2 3 4]);
        (({x|y}\)1 3 2 5 4 6 2)
    );

.solutions.adverbs.hard:
    `convergeHalve`whileDouble`nestedEachBothDot!(
        (({x div 2}\)100);
        (({x*2}/)[{x<100};1]);
        ({sum x*y}'[(1 2 3;4 5 6);(1 1 1;2 2 2)])
    );
