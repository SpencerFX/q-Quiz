//====================================================================
// fundamentals — dictionaries inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds.
// Everything below was verified against a live q process before being
// written down - unlike several earlier kinds this one turned up no
// surprises, but the mechanics are worth stating plainly since a few
// of them aren't obvious from just looking at a dict:
//
//   - Indexing a dict with a key that isn't there does NOT error -
//     `d[k]` gives a typed null (0N for a long-valued dict), unlike
//     enumeration's `` `domain$x `` which signals 'cast on an unknown
//     value (fundamentals/inputs/enumerations.q).
//   - `,` (join) on two dicts is an upsert: existing keys get
//     overwritten by the right-hand side, new keys get appended.
//     Same join also works to add/update a SINGLE key by joining a
//     one-entry dict; `@[d;k;:;v]` (the amend form from
//     fundamentals/solutions/functionalForms.q) does the same for one
//     key, whether or not that key already exists.
//   - each applied to a dict runs over its VALUES and returns another
//     dict with the same keys - it doesn't flatten to a plain list.
//   - flip on a dict of same-length lists gives a genuine table - this
//     is the standard "a table is a flipped dict of columns" idiom.
//   - indexing a table by row number gives that row back as a dict
//     (column names as keys) - the mirror image of flip, and the
//     reason "a table is a list of dicts" is the other half of that
//     idiom.
//====================================================================

.inputs.dictionaries.easy:
    `createDict`lookupByKey`getKeysAndValues`missingKeyLookup!(
        (`AAPL`GOOG`MSFT; 100 200 300);
        (`AAPL`GOOG`MSFT!100 200 300; `GOOG);
        (enlist `AAPL`GOOG!100 200);
        (`AAPL`GOOG!100 200; `TSLA)
    );

.inputs.dictionaries.medium:
    `addNewKeyViaJoin`updateExistingKeyViaAmend`eachOverDictValues`dictToTableViaFlip!(
        (`AAPL`GOOG!100 200; `MSFT; 300);
        (`AAPL`GOOG`MSFT!100 200 300; `GOOG; 250);
        (enlist `AAPL`GOOG`MSFT!10 20 30);
        (enlist `sym`price!(`AAPL`GOOG`MSFT; 100 200 300))
    );

.inputs.dictionaries.hard:
    `mergeDictsUpsert`nestedDictAccess`tableRowAsDict!(
        (`AAPL`GOOG!100 200; `GOOG`MSFT!250 300);
        (`equities`bonds!(`AAPL`GOOG!100 200; `US10Y`US2Y!4.5 4.8); `equities; `GOOG);
        (([] sym:`AAPL`GOOG`MSFT; price:100 200 300); 1)
    );
