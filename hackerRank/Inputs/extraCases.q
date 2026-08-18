//====================================================================
//
// q-Quiz — extra test-case inputs
//
// Additional cases layered on top of the single case each problem
// already has in Inputs/algorithms.q / Inputs/dataStructures.q, keyed
// by the same category symbol used there. A problem with no entry
// here just runs its one existing case, so this is purely additive.
//
// Shape: category ! (problemName ! list of arg-tuples)
// Each arg-tuple must be built the same way the base input already is
// for that problem (single-arg problems still wrap the arg in enlist).
//
// NB: built with plain dict literals rather than the "(!) . flip raze
// 2 cut" idiom used elsewhere in this repo — that idiom mis-groups
// when the outer list has only one pair, which is the case here with
// a single category.
//
//====================================================================

.inputs.extraCases:enlist[`.inputs.algorithms.easy]!enlist (
    `billDivision`simpleArraySum`solveMeFirst!(
        enlist (2 4 6; 0; 5);
        enlist enlist 5 5 5;
        enlist (5; 7)
    )
 );
//====================================================================
