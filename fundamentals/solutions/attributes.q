//====================================================================
// fundamentals — attributes solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q for
// the same reasoning). See fundamentals/inputs/attributes.q for the
// live-verified behaviour these rely on.
//====================================================================

.solutions.attributes.easy:
    `setSortedAttr`checkAttr`setUniqueAttr`setGroupedAttr!(
        (`s#1 2 3 4 5);
        (attr `s#10 20 30);
        (`u#10 20 30);
        (`g#3 1 2 1 3)
    );

.solutions.attributes.medium:
    `sortThenSetAttr`distinctThenSetAttr`setPartedAttr`tableColumnAttr!(
        (`s#asc 5 3 1 4 2);
        (`u#distinct 1 2 2 3 1);
        (`p#1 1 2 2 2 3);
        (update sym:`p#sym from ([] sym:`AAPL`AAPL`GOOG`GOOG`GOOG; price:100 101 200 201 202))
    );

/ inPlaceAppendPreservesAttr vs joinDropsAttr use the SAME input (a
/ `s# list plus a value that keeps it sorted) to isolate one thing:
/ amending a variable in place (,:) keeps `s# if the result is still
/ sorted, but building a NEW list via a plain join (,) drops the
/ attribute even though that result is equally sorted - the attribute
/ is a property of the variable being incrementally maintained, not
/ something q re-derives from a fresh value's actual contents.
.solutions.attributes.hard:
    `inPlaceAppendPreservesAttr`joinDropsAttr`stripAttrExplicitly!(
        ({[xs;y] xs,:y; attr xs} . (`s#1 2 3;4));
        ({[xs;y] attr xs,y} . (`s#1 2 3;4));
        (attr `#`u#10 20 30)
    );
