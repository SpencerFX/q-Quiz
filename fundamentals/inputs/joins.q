//====================================================================
// fundamentals — joins inputs
//
// Own dedicated fixtures (not shared with .qsql.* from
// fundamentals/inputs/qsql.q) so this section stands alone. Each
// table is built to actually exercise the join's distinguishing
// behaviour rather than just its happy path:
//   - .joins.desks deliberately omits MSFT, so lj/ij/ej on it produce
//     visibly different results (null-filled row / dropped row /
//     kept row) instead of all three looking the same.
//   - .joins.hardTrades has one GOOG row (09:30:50) earlier than any
//     GOOG quote, so an as-of join against it has to produce a null
//     match - same reasoning as fundamentals/inputs/qsql.q's
//     hardTrades/hardQuotes needing non-coincident timestamps.
//====================================================================

.joins.trades:([]
    time:09:30:00 09:30:15 09:31:00 09:31:45 09:32:30 09:33:00;
    sym:`AAPL`GOOG`AAPL`MSFT`GOOG`AAPL;
    price:100.0 200.0 101.0 300.0 202.0 100.5;
    size:10 5 8 3 6 12
 );

.joins.sectors:([sym:`AAPL`GOOG`MSFT] sector:`Tech`CommServices`Tech);

.joins.desks:([sym:`AAPL`GOOG] desk:`Equities`Equities);

.joins.morningTrades:([]
    time:09:30:00 09:31:00;
    sym:`AAPL`GOOG;
    price:100.0 200.0;
    size:10 5
 );

.joins.afternoonTrades:([]
    time:14:30:00 14:31:00;
    sym:`MSFT`AAPL;
    price:305.0 102.0;
    size:4 6
 );

.joins.afternoonTradesWithVenue:([]
    time:14:30:00 14:31:00;
    sym:`MSFT`AAPL;
    price:305.0 102.0;
    size:4 6;
    venue:`NYSE`NASDAQ
 );

.joins.deskTrades:([]
    time:09:30:00 09:31:00 09:32:00 09:33:00;
    sym:`AAPL`GOOG`MSFT`AAPL;
    desk:`Equities`Equities`FICC`Options;
    price:100.0 200.0 300.0 105.0;
    size:10 5 4 7
 );

.joins.deskLimits:([sym:`AAPL`GOOG`MSFT; desk:`Equities`Equities`FICC] limit:100000 250000 500000);

.joins.hardQuotes:`time xasc ([]
    time:09:30:00 09:30:30 09:31:15 09:32:00 09:32:45 09:33:30;
    sym:`AAPL`AAPL`GOOG`AAPL`GOOG`AAPL;
    bid:99.5 100.0 199.0 100.3 201.0 100.6;
    ask:100.5 101.0 201.0 101.3 203.0 101.6
 );

.joins.hardTrades:([]
    time:09:30:10 09:30:45 09:30:50 09:31:30 09:32:15 09:33:00;
    sym:`AAPL`AAPL`GOOG`GOOG`AAPL`AAPL;
    price:100.2 100.4 198.5 199.8 100.9 100.55;
    size:10 5 4 8 6 12
 );

.inputs.joins.easy:
    `leftJoinBasic`innerJoinBasic`exceptJoinBasic`unionJoinBasic!(
        (.joins.trades; .joins.sectors);
        (.joins.trades; .joins.desks);
        (.joins.trades; .joins.desks);
        (.joins.morningTrades; .joins.afternoonTrades)
    );

.inputs.joins.medium:
    `leftJoinMultiKey`unionJoinMismatchedColumns`leftJoinDefaultFill`innerJoinAggregate!(
        (.joins.deskTrades; .joins.deskLimits);
        (.joins.morningTrades; .joins.afternoonTradesWithVenue);
        (.joins.trades; .joins.desks);
        (.joins.trades; .joins.desks)
    );

.inputs.joins.hard:
    `asofJoinQuotes`windowJoinMidRange`asofJoinNoMatchFill!(
        (.joins.hardTrades; .joins.hardQuotes);
        (.joins.hardTrades; .joins.hardQuotes);
        (.joins.hardTrades; .joins.hardQuotes)
    );
