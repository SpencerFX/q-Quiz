//====================================================================
// adventOfCode — solutions
//
// Expected output per problem, verified by running each problem's
// own dayNN function (adventOfCode/questions/dayNN.q) against its
// registered input in adventOfCode/inputs/inputs.q - same convention
// as euler/solutions/euler.q.
//====================================================================

.solutions.adventOfCode.easy: (!) . flip raze 2 cut
    (
        (`day01; 1 2);         / dial: end-of-move hits, then every-step hits at position 50
        (`day02; 495 5490);    / repeat-code sums: exact-double, then any-repeat
        (`day03; 253 24904);   / best K-digit subsequence sums: K=2, then K=4
        (`day04; 6 11);        / loose pebbles: single pass, then total removed to a stable grid
        (`day05; 3 27);        / range coverage: points covered, then total union size
        (`day06; 48 158);      / column ledger totals: as given, then with swapped operators
        (`day07; 3 4);         / splitter chute: total splits, then flow reaching the bottom
        (`day08; 9 128)        / point clusters: product of 2 largest sizes, then full-merge threshold
    );
