//====================================================================
// fundamentals — enumerations solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q / functionalForms.q /
// attributes.q / protectedEvaluation.q / metaprogramming.q for the
// same reasoning). See fundamentals/inputs/enumerations.q for the
// backtick-before-domain-name note this relies on throughout.
//====================================================================

.solutions.enumerations.easy:
    `enumerateBasic`checkEnumType`enumCompareToSymbol`dequenumerateValue!(
        (`.enum.stocksA$`AAPL`GOOG`AAPL);
        (type `.enum.stocksA$`AAPL`GOOG);
        (`.enum.stocksA$`AAPL`GOOG) = `AAPL`GOOG;
        (value `.enum.stocksA$`AAPL`GOOG`AAPL)
    );

.solutions.enumerations.medium:
    `extendDomainViaQuestion`domainAfterExtend`protectedCast`enumTableColumn!(
        (`.enum.stocksB?`AAPL`TSLA);
        ({[xs] `.enum.stocksC?xs; .enum.stocksC}[`AAPL`NFLX]);
        (@[{`.enum.stocksD$x};`ORCL;{x}]);
        (update esym:`.enum.stocksE$sym from ([] sym:`AAPL`GOOG`AAPL; price:1 2 3))
    );

.solutions.enumerations.hard:
    `enumerateViaQEnUtility`rawIndexBehindEnum`safeEnumBatch!(
        (.Q.en[`.enumQEn;([] sym:`AAPL`GOOG`AAPL; price:1 2 3)]);
        (`long$`.enum.stocksG$`GOOG`AAPL`MSFT);
        ({[xs] {@[{`.enum.stocksH$x};x;{`UNKNOWN}]} each xs}[`AAPL`ORCL`GOOG])
    );
