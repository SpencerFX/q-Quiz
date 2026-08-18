/ Keyed by the problem's info-namespace segment (eg
/ .quiz.hackerRank.quant.probability.noWomenAtTableA.info), matching
/ .inputs.quant.probability.* - not by the reference solution
/ function's own name (probNoWomen, drawerProbability, ...), which is
/ what these keys used to be. The two dicts only lined up positionally
/ before (fragile - a reorder would have silently mismatched input
/ against the wrong expected value); renaming to a shared key removes
/ that risk and matches every other section's convention.
.solutions.quant.probability.easy: (!) . flip raze 2 cut
    (
        (`noWomenAtTableA; .3991228);
        (`twoDrawers; .6666667);
        (`twoChildren; .3333333)
    );

/ Single entry, so written as a plain dict literal - see
/ quantRank/inputs/inputs.q for why.
.solutions.quant.probability.medium:
    enlist[`game7]!enlist .3125;

.solutions.quant.probability.hard:
    enlist[`amoebaExtinction]!enlist 1f;