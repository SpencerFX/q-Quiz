//====================================================================
// fundamentals — attributes inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q,
// adverbs.q and functionalForms.q. Covers the four attributes (`s#
// sorted, `u# unique, `p# parted/grouped-contiguous, `g# grouped) -
// setting them, reading them back via attr, and the sharper edges:
// setting `s#/`u#/`p# on data that doesn't actually satisfy the
// attribute's invariant is a hard error ('s-fail/'u-fail), not a
// silent no-op, and an attribute set on a variable does NOT survive
// every operation - see fundamentals/solutions/attributes.q for the
// in-place-amend-vs-plain-join contrast this ends on.
//
// Verified against a live q process before writing this file: attr
// on a plain list is the empty symbol; -3! (what grading compares)
// DOES include the `s#/`u#/`p#/`g# prefix in its text, including for
// an attributed table COLUMN inside the table's flip notation, so
// these are genuinely gradeable, not just cosmetic.
//====================================================================

.inputs.attributes.easy:
    `setSortedAttr`checkAttr`setUniqueAttr`setGroupedAttr!(
        (enlist 1 2 3 4 5);
        (enlist `s#10 20 30);
        (enlist 10 20 30);
        (enlist 3 1 2 1 3)
    );

.inputs.attributes.medium:
    `sortThenSetAttr`distinctThenSetAttr`setPartedAttr`tableColumnAttr!(
        (enlist 5 3 1 4 2);
        (enlist 1 2 2 3 1);
        (enlist 1 1 2 2 2 3);
        (enlist ([] sym:`AAPL`AAPL`GOOG`GOOG`GOOG; price:100 101 200 201 202))
    );

.inputs.attributes.hard:
    `inPlaceAppendPreservesAttr`joinDropsAttr`stripAttrExplicitly!(
        (`s#1 2 3; 4);
        (`s#1 2 3; 4);
        (enlist `u#10 20 30)
    );
