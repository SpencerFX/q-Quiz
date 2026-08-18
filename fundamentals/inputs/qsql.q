//====================================================================
// fundamentals — qsql inputs
//
// One shared trades/quotes table pair for easy+medium (and the
// non-join hard questions), plus a second, denser hardTrades/
// hardQuotes pair used only by the join-dependent hard questions
// (leftJoin/asofJoin/tradeToMidMarkout/tradeClassification/
// adverseSelection) - trades/quotes share identical timestamps
// per row, which makes an as-of join indistinguishable from a plain
// exact-match join and forces every trade-to-mid markout to exactly
// zero, so those five questions need data where a trade's time
// doesn't exactly coincide with a quote's.
//====================================================================

.qsql.trades:([]
    time:09:30:00 09:30:05 09:31:00 09:31:30 09:32:00 09:32:10 09:33:00 09:33:20;
    sym:`AAPL`GOOG`AAPL`MSFT`GOOG`AAPL`MSFT`GOOG;
    side:`B`S`B`S`B`S`B`S;
    price:100.0 200.0 101.0 300.0 202.0 100.5 301.0 201.0;
    size:10 5 8 3 6 12 4 7
 );

.qsql.quotes:([]
    time:09:30:00 09:30:05 09:31:00 09:31:30 09:32:00 09:32:10 09:33:00 09:33:20;
    sym:`AAPL`GOOG`AAPL`MSFT`GOOG`AAPL`MSFT`GOOG;
    bid:99.5 199.0 100.5 299.0 201.0 100.0 300.5 200.5;
    ask:100.5 201.0 101.5 301.0 203.0 101.0 301.5 201.5
 );

.qsql.symRef:([] sym:`AAPL`GOOG`MSFT; sector:`Tech`CommServices`Tech);

.qsql.hardQuotes:`time xasc ([]
    time:09:30:00 09:30:30 09:32:00 09:30:00 09:31:00 09:31:00 09:33:00;
    sym:`AAPL`AAPL`AAPL`GOOG`GOOG`MSFT`MSFT;
    bid:99.4 100.4 99.9 198.5 200.5 298.5 300.0;
    ask:100.6 101.6 101.1 200.5 202.5 300.5 302.0
 );

.qsql.hardTrades:([]
    time:09:30:10 09:30:40 09:31:10 09:31:40 09:32:10 09:32:30 09:33:10 09:33:40;
    sym:`AAPL`GOOG`AAPL`MSFT`GOOG`AAPL`MSFT`GOOG;
    side:`B`S`B`S`B`S`B`S;
    price:100.3 199.0 101.3 299.0 202.0 100.2 301.5 201.0;
    size:10 5 8 3 6 12 4 7
 );

.inputs.qsql.easy: (!) . flip raze 2 cut
    (
        (`selectColumn; enlist .qsql.trades);
        (`selectMultipleColumns; enlist .qsql.trades);
        (`filterRows; enlist .qsql.trades);
        (`filterBySymbol; enlist .qsql.trades);
        (`multipleConditions; enlist .qsql.trades);
        (`calculatedColumn; enlist .qsql.trades);
        (`booleanColumn; enlist .qsql.trades);
        (`renameColumn; enlist .qsql.trades);
        (`average; enlist .qsql.trades);
        (`sum; enlist .qsql.trades);
        (`count; enlist .qsql.trades);
        (`maximum; enlist .qsql.trades);
        (`minMax; enlist .qsql.trades)
    );

.inputs.qsql.medium: (!) . flip raze 2 cut
    (
        (`groupBySymbol; enlist .qsql.trades);
        (`averageBySymbol; enlist .qsql.trades);
        (`countBySymbol; enlist .qsql.trades);
        (`vwapBySymbol; enlist .qsql.trades);
        (`notionalBySymbol; enlist .qsql.trades);
        (`maxTradeBySymbol; enlist .qsql.trades);
        (`sortByPrice; enlist .qsql.trades);
        (`sortByVolumeDescending; enlist .qsql.trades);
        (`sortMultipleColumns; enlist .qsql.trades);
        (`updatePrice; enlist .qsql.trades);
        (`signedQuantity; enlist .qsql.trades);
        (`notional; enlist .qsql.trades);
        (`priceBucket; enlist .qsql.trades);
        (`deleteColumn; enlist .qsql.trades);
        (`deleteRows; enlist .qsql.trades);
        (`timeFilter; enlist .qsql.trades);
        (`midPrice; enlist .qsql.quotes);
        (`spread; enlist .qsql.quotes);
        (`spreadBps; enlist .qsql.quotes);
        (`returns; enlist .qsql.trades)
    );

/ 20 entries above would make the flip/cut idiom fine, but logReturns
/ is the 21st across two literal blocks - kept as one dict, no
/ single-entry risk here either way; still written as a separate
/ statement purely for readability of the (already long) medium tier.
.inputs.qsql.medium[`logReturns]: enlist .qsql.trades;

.inputs.qsql.hard: (!) . flip raze 2 cut
    (
        (`rollingVolatility; enlist .qsql.trades);
        (`leftJoin; (.qsql.trades; .qsql.symRef));
        (`asofJoin; (.qsql.hardTrades; .qsql.hardQuotes));
        (`tradeToMidMarkout; (.qsql.hardTrades; .qsql.hardQuotes));
        (`vwap; enlist .qsql.trades);
        (`participationRate; enlist .qsql.trades);
        (`tradeClassification; (.qsql.hardTrades; .qsql.hardQuotes));
        (`adverseSelection; (.qsql.hardTrades; .qsql.hardQuotes))
    );
