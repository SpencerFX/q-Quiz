.inputs.quant.probability.easy: (!) . flip raze 2 cut
    (
        (`noWomenAtTableA; (20; 3; 5));
        (`twoDrawers; (1f; .5; .5));
        (`twoChildren; enlist .5)
    );

.inputs.quant.probability.medium: (!) . flip raze 2 cut
    (
        (`game7; enlist .5)
    );

.inputs.quant.probability.hard: (!) . flip raze 2 cut
    (
        (`amoebaExtinction; (1f%3; 1f%3; 1f%3))
    );