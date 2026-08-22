//====================================================================
// fundamentals — lisp99 solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/lisp99.q for background on this section).
//
// packConsecutive's length-1 runs ("b", "d") use "enlist" rather than
// a bare "b"/"d" literal - a bare double-quoted single character in q
// source parses as a char ATOM (-10h), but indexing a char list by a
// single-element index list (as the reference solution's x[idxGroup]
// does) produces a 1-char LIST (10h), not an atom. runLengthEncode's
// pairs go the other way on purpose: each-both join (,') unwraps to
// scalars, so a bare "a" (atom) is the right literal there - verified
// live rather than assumed, since the two look identical printed but
// aren't ~-equal.
//====================================================================

.solutions.lisp99.easy:
    `lastElement`lastButOne`elementAt`reverseList!(
        50;
        9;
        `gamma;
        6 5 4 3 2 1
    );

.solutions.lisp99.medium:
    `isPalindrome`compressConsecutive`splitAt`sliceRange!(
        1b;
        "abcade";
        (`a`b`c;`d`e`f`g`h`i`k);
        `c`d`e`f`g
    );

.solutions.lisp99.hard:
    `flattenNested`packConsecutive`runLengthEncode!(
        `a`b`c`d`e;
        ("aaaa";enlist "b";"cc";"aa";enlist "d";"eeee");
        ((4;"a");(1;"b");(2;"c");(2;"a");(1;"d");(4;"e"))
    );
