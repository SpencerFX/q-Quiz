//====================================================================
//
// q-Quiz — extra test-case expected outputs
//
// Paired with hackerRank/Inputs/extraCases.q — same problems, same
// order, keyed by the *solution* category symbol (mirrors how
// Solutions/algorithms.q etc. are keyed).
//
// Shape: category ! (problemName ! list of expected values)
//
// NB: built with plain dict literals rather than the "(!) . flip raze
// 2 cut" idiom used elsewhere in this repo — see Inputs/extraCases.q
// for why.
//
//====================================================================

.solutions.extraCases:enlist[`.solutions.algorithms.easy]!enlist (
    `billDivision`simpleArraySum`solveMeFirst!(
        enlist "Bon Appetit";
        enlist 15;
        enlist 12
    )
 );
//====================================================================
