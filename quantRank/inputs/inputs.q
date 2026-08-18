.inputs.quant.probability.easy: (!) . flip raze 2 cut
    (
        (`noWomenAtTableA; (20; 3; 5));
        (`twoDrawers; (1f; .5; .5));
        (`twoChildren; enlist .5)
    );

/ Single entry, so written as a plain dict literal - the
/ "(!) . flip raze 2 cut" idiom mis-groups when the outer list has
/ only one pair (confirmed broken here too; see
/ hackerRank/Inputs/extraCases.q for the same issue hit earlier).
.inputs.quant.probability.medium:
    enlist[`game7]!enlist enlist .5;

.inputs.quant.probability.hard:
    enlist[`amoebaExtinction]!enlist (1f%3; 1f%3; 1f%3);