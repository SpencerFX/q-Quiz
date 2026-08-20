//====================================================================
// fundamentals — control flow solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / foreignKeys.q for the
// same reasoning). See fundamentals/inputs/controlFlow.q for how this
// kind differs from adverbs.
//====================================================================

.solutions.controlFlow.easy:
    `doLoop`whileLoop`ifStatement`ternaryCond!(
        ({[n] x:0; do[n;x+:1]; x}[5]);
        ({[n] x:0; i:0; while[i<n;x+:i;i+:1]; x}[5]);
        ({[x] r:0; if[x>0;r:1]; r}[5]);
        ({[x] $[x>0;`positive;`nonpositive]}[5])
    );

.solutions.controlFlow.medium:
    `caseMultiBranch`vectorConditional`doLoopBuildList`whileLoopBuildList!(
        ({[x] $[x=0;`zero;x<0;`negative;`positive]}[-3]);
        ({[xs] ?[xs>0;`pos;`neg]}[3 -2 5 -1]);
        ({[n] xs:(); do[n;xs,:count xs]; xs}[5]);
        ({[n] xs:(); i:0; while[i<n;xs,:i*i;i+:1]; xs}[5])
    );

.solutions.controlFlow.hard:
    `nestedVectorConditional`nestedIfWhileSearch`doVsWhileEquivalence!(
        ({[xs] ?[xs=0;`zero;?[xs>0;`pos;`neg]]}[0 3 -2 0 5]);
        ({[xs;target] i:0; found:-1; while[(i<count xs) and found=-1; if[xs[i]=target;found:i]; i+:1]; found}[10 20 30 40;30]);
        ({[n] ({[n] x:0; do[n;x+:1]; x}[n])=({[n] x:0; i:0; while[i<n;x+:1;i+:1]; x}[n])}[7])
    );
