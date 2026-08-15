//====================================================================
// fundamentals — qsql solutions
//
// Expected output per problem, computed directly from the shared
// .qsql.trades/.qsql.quotes/.qsql.symRef/.qsql.hardTrades/
// .qsql.hardQuotes tables (defined in fundamentals/inputs/qsql.q)
// rather than hand-transcribed, so there's no risk of a typo'd
// expected table silently diverging from what the reference query
// actually produces.
//====================================================================

.solutions.qsql.easy:
    `selectColumn`selectMultipleColumns`filterRows`filterBySymbol`multipleConditions`calculatedColumn`booleanColumn`renameColumn`average`sum`count`maximum`minMax!(
        (select sym from .qsql.trades);
        (select sym,price from .qsql.trades);
        (select from .qsql.trades where size>5);
        (select from .qsql.trades where sym=`AAPL);
        (select from .qsql.trades where sym=`AAPL, side=`B);
        (update notional:price*size from .qsql.trades);
        (update isBuy:side=`B from .qsql.trades);
        (select qty:size from .qsql.trades);
        (exec avg price from .qsql.trades);
        (exec sum size from .qsql.trades);
        (count .qsql.trades);
        (exec max price from .qsql.trades);
        (`min`max!(exec min price from .qsql.trades;exec max price from .qsql.trades))
    );

.solutions.qsql.medium:
    `groupBySymbol`averageBySymbol`countBySymbol`vwapBySymbol`notionalBySymbol`maxTradeBySymbol`sortByPrice`sortByVolumeDescending`sortMultipleColumns`updatePrice`signedQuantity`notional`priceBucket`deleteColumn`deleteRows`timeFilter`midPrice`spread`spreadBps`returns!(
        (select totalSize:sum size by sym from .qsql.trades);
        (select avgPrice:avg price by sym from .qsql.trades);
        (select cnt:count i by sym from .qsql.trades);
        (select vwap:size wavg price by sym from .qsql.trades);
        (select totalNotional:sum price*size by sym from .qsql.trades);
        (select maxSize:max size by sym from .qsql.trades);
        (`price xasc .qsql.trades);
        (`size xdesc .qsql.trades);
        (`sym`price xasc .qsql.trades);
        (update price:price*1.01 from .qsql.trades);
        (update signedQty:size*1-2*side=`S from .qsql.trades);
        (exec sum price*size from .qsql.trades);
        (update bucket:floor price from .qsql.trades);
        (delete side from .qsql.trades);
        (delete from .qsql.trades where size<5);
        (select from .qsql.trades where time>09:31:00);
        (update mid:(bid+ask)%2 from .qsql.quotes);
        (update spread:ask-bid from .qsql.quotes);
        (update spreadBps:10000*(ask-bid)%(bid+ask)%2 from .qsql.quotes);
        (update ret:(price-prev price)%prev price from .qsql.trades)
    );

.solutions.qsql.medium[`logReturns]: update logRet:log price%prev price from .qsql.trades;

.solutions.qsql.hard:
    `rollingVolatility`leftJoin`asofJoin`tradeToMidMarkout`vwap`participationRate`tradeClassification`adverseSelection!(
        (update vol:3 mdev price from .qsql.trades);
        (.qsql.trades lj (`sym xkey .qsql.symRef));
        (aj[`sym`time;.qsql.hardTrades;.qsql.hardQuotes]);
        (update markout:price-((bid+ask)%2) from aj[`sym`time;.qsql.hardTrades;.qsql.hardQuotes]);
        (exec size wavg price from .qsql.trades);
        (select participationRate:size%sum size by sym from .qsql.trades);
        (update classification:?[price>(bid+ask)%2;`aggressiveBuy;`aggressiveSell] from aj[`sym`time;.qsql.hardTrades;.qsql.hardQuotes]);
        (exec avg price-((bid+ask)%2) from aj[`sym`time;.qsql.hardTrades;.qsql.hardQuotes])
    );
