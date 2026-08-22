//====================================================================
// fundamentals — lisp99 inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Based on the "Working with lists" section of L-99: Ninety-Nine Lisp
// Problems (originally a Prolog list by werner.hett@hti.bfh.ch) - the
// classic list-processing exercises translated into idiomatic q. A
// few problems (P01/P03/P17/P18) reuse the original problem's own
// example data so the two are directly comparable.
//
// Note on style: every multi-argument problem here uses an explicit
// [x;...] header rather than relying on implicit x/y/z arity
// inference, same reasoning as fundamentals/inputs/adverbs.q.
//====================================================================

.inputs.lisp99.easy:
    `lastElement`lastButOne`elementAt`reverseList!(
        (enlist 10 20 30 40 50);
        (enlist 3 6 9 12);
        (`alpha`beta`gamma`delta`epsilon;3);
        (enlist 1 2 3 4 5 6)
    );

.inputs.lisp99.medium:
    `isPalindrome`compressConsecutive`splitAt`sliceRange!(
        (enlist "level");
        (enlist "aaaabccaadeeee");
        (`a`b`c`d`e`f`g`h`i`k;3);
        (`a`b`c`d`e`f`g`h`i`k;3;7)
    );

.inputs.lisp99.hard:
    `flattenNested`packConsecutive`runLengthEncode!(
        (enlist (`a;(`b;(`c;`d);`e)));
        (enlist "aaaabccaadeeee");
        (enlist "aaaabccaadeeee")
    );
