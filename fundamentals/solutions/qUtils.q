//====================================================================
// fundamentals — .Q utils solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q /
// attributes.q / protectedEvaluation.q / metaprogramming.q /
// enumerations.q / dictionaries.q for the same reasoning). See
// fundamentals/inputs/qUtils.q for what each .Q.* function actually
// does and the two that were dropped after live testing.
//====================================================================

.solutions.qUtils.easy:
    `qType`isTable`sanitizeIdentifier`checkAgainstMaxLong!(
        (.Q.ty `hello);
        (.Q.qt `a`b!1 2);
        (.Q.id `$"my column");
        (0Wj=.Q.M)
    );

.solutions.qUtils.medium:
    `formatFixedDecimals`formatFixedWidth`buildFilePath`checkPartitioned!(
        (.Q.f[3;2.718281828]);
        (.Q.fmt[12;3;2.718281828]);
        (.Q.dd[.Q.dd[`:/data/trades;`2024.01.01];`AAPL]);
        (.Q.qp ([] sym:`AAPL`GOOG; price:100 200))
    );

.solutions.qUtils.hard:
    `checkReservedWords`sanitizeIdentifierBatch`protectedTrpWithBacktrace!(
        (`select`from`myColumn`update`price in .Q.res);
        (.Q.id each (`$"my col";`$"another.col";`cleanCol));
        (.Q.trp[{`a+1};0;{[e;bt] e}])
    );
