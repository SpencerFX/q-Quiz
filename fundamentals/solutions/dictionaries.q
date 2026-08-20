//====================================================================
// fundamentals — dictionaries solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q /
// attributes.q / protectedEvaluation.q / metaprogramming.q /
// enumerations.q for the same reasoning). See
// fundamentals/inputs/dictionaries.q for the mechanics these rely on.
//====================================================================

.solutions.dictionaries.easy:
    `createDict`lookupByKey`getKeysAndValues`missingKeyLookup!(
        (`AAPL`GOOG`MSFT!100 200 300);
        (`AAPL`GOOG`MSFT!100 200 300)`GOOG;
        ((key `AAPL`GOOG!100 200);(value `AAPL`GOOG!100 200));
        (`AAPL`GOOG!100 200)`TSLA
    );

.solutions.dictionaries.medium:
    `addNewKeyViaJoin`updateExistingKeyViaAmend`eachOverDictValues`dictToTableViaFlip!(
        ((`AAPL`GOOG!100 200),(enlist`MSFT)!enlist 300);
        (@[`AAPL`GOOG`MSFT!100 200 300;`GOOG;:;250]);
        ({x*2} each `AAPL`GOOG`MSFT!10 20 30);
        (flip `sym`price!(`AAPL`GOOG`MSFT; 100 200 300))
    );

.solutions.dictionaries.hard:
    `mergeDictsUpsert`nestedDictAccess`tableRowAsDict!(
        ((`AAPL`GOOG!100 200),(`GOOG`MSFT!250 300));
        (`equities`bonds!(`AAPL`GOOG!100 200; `US10Y`US2Y!4.5 4.8))[`equities][`GOOG];
        (([] sym:`AAPL`GOOG`MSFT; price:100 200 300)) 1
    );
