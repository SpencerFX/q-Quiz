//====================================================================
// fundamentals — listOperations inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Covers 25 core list-processing keywords: count, cross, cut, enlist,
// except, fills, first, flip, group, in, inter, last, mcount, next,
// prev, raze, reverse, rotate, sublist, sv, til, union, vs, where,
// xprev. Two pairs (first/last, next/prev) are combined into a single
// question each since they're natural mirror images of one another;
// every other keyword gets its own question.
//
// Note on style: every multi-argument problem here uses an explicit
// [x;...] header rather than relying on implicit x/y/z arity
// inference - membershipIn (using both x and y as parameter names)
// is exactly the case that inference gets wrong for a *test* wrapper
// with no header at all, same reasoning as fundamentals/inputs/
// adverbs.q's note on this.
//====================================================================

.inputs.listOperations.easy:
    `listCount`firstAndLast`tilRange`reverseList`enlistWrap`membershipIn`unionLists!(
        (enlist 10 20 30 40 50);
        (enlist 3 7 2 9 5);
        (enlist 6);
        (enlist 1 2 3 4 5);
        (enlist 42);
        (2 5 9 3;1 2 3 4 5);
        (1 2 3;3 4 5)
    );

.inputs.listOperations.medium:
    `interLists`exceptLists`flipMatrix`whereTrue`groupValues`razeNested`rotateList`crossProduct!(
        (1 2 3 4;3 4 5 6);
        (1 2 3 4;3 4);
        (enlist (1 2 3;4 5 6));
        (enlist 010011b);
        (enlist `a`b`a`c`b`a);
        (enlist (1 2;3 4 5;enlist 6));
        (2;1 2 3 4 5);
        (1 2;`x`y)
    );

.inputs.listOperations.hard:
    `cutChunks`sublistRange`nextAndPrev`xprevShift`movingCount`fillsForward`svJoin`vsSplit!(
        (3;1 2 3 4 5 6 7);
        (1 2 3 4 5 6;2;3);
        (enlist 10 20 30 40);
        (2;10 20 30 40 50);
        (3;1 0N 3 4 0N);
        (enlist 1 0N 0N 4 0N);
        (", ";("apple";"banana";"cherry"));
        (",";"apple,banana,cherry")
    );
