//====================================================================
// leetcode — hard inputs
//
// One case per problem, taken from the worked example already given
// in each question file's "Solution Info" usage line.
//
// Keyed by the question filename's title slug (medianOfTwoSortedArrays),
// not the reference function's name inside the file
// (findMedianSortedArrays) - see leetcode/inputs/medium.q for why.
//====================================================================

.inputs.leetcode.hard: (!) . flip raze 2 cut
    (
        (`medianOfTwoSortedArrays; (1 3; 2));
        (`trappingRainWater; enlist 0 1 0 2 1 0 1 3 2 1 2 1)
    );
