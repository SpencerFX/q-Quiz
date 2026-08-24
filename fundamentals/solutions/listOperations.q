//====================================================================
// fundamentals — listOperations solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/listOperations.q for background).
//
// Two gotchas surfaced verifying these live, both worth knowing:
//   - svJoin's join-list is written with different-length words
//     ("apple";"banana";"cherry") on purpose - same-length strings
//     (eg ("a";"b";"c")) auto-collapse into one flat char vector at
//     parse time instead of staying a list of separate strings, which
//     silently breaks sv (it needs an actual list of strings on the
//     right). Ragged lengths force q to keep it as a real list.
//   - cutChunks: "n cut x" splits x into groups *of size* n (here,
//     three 3-2-2-long groups from a 7-long list), not *into* n
//     groups - an easy assumption to get backwards.
//====================================================================

.solutions.listOperations.easy:
    `listCount`firstAndLast`tilRange`reverseList`enlistWrap`membershipIn`unionLists!(
        5;
        3 5;
        0 1 2 3 4 5;
        5 4 3 2 1;
        enlist 42;
        1101b;
        1 2 3 4 5
    );

.solutions.listOperations.medium:
    `interLists`exceptLists`flipMatrix`whereTrue`groupValues`razeNested`rotateList`crossProduct!(
        3 4;
        1 2;
        (1 4;2 5;3 6);
        1 4 5;
        `a`b`c!(0 2 5;1 4;enlist 3);
        1 2 3 4 5 6;
        3 4 5 1 2;
        ((1;`x);(1;`y);(2;`x);(2;`y))
    );

.solutions.listOperations.hard:
    `cutChunks`sublistRange`nextAndPrev`xprevShift`movingCount`fillsForward`svJoin`vsSplit!(
        (1 2 3;4 5 6;enlist 7);
        3 4 5;
        (20 30 40 0N;0N 10 20 30);
        0N 0N 10 20 30;
        1 1 2 2 2i;
        1 1 1 4 4;
        "apple, banana, cherry";
        ("apple";"banana";"cherry")
    );
