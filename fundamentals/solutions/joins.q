//====================================================================
// fundamentals — joins solutions
//
// Expected output per problem, computed directly from the fixtures
// in fundamentals/inputs/joins.q rather than hand-transcribed, same
// reasoning as fundamentals/solutions/qsql.q - no risk of a typo'd
// expected table silently diverging from what the reference join
// actually produces.
//====================================================================

.solutions.joins.easy:
    `leftJoinBasic`innerJoinBasic`exceptJoinBasic`unionJoinBasic!(
        (.joins.trades lj .joins.sectors);
        (.joins.trades ij .joins.desks);
        (ej[`sym;.joins.trades;.joins.desks]);
        (.joins.morningTrades uj .joins.afternoonTrades)
    );

.solutions.joins.medium:
    `leftJoinMultiKey`unionJoinMismatchedColumns`leftJoinDefaultFill`innerJoinAggregate!(
        (.joins.deskTrades lj .joins.deskLimits);
        (.joins.morningTrades uj .joins.afternoonTradesWithVenue);
        (update desk:`Unassigned^desk from .joins.trades lj .joins.desks);
        (select totalSize:sum size by desk from .joins.trades ij .joins.desks)
    );

.solutions.joins.hard:
    `asofJoinQuotes`windowJoinMidRange`asofJoinNoMatchFill!(
        (aj[`sym`time;.joins.hardTrades;.joins.hardQuotes]);
        (wj[(.joins.hardTrades.time-00:00:45;.joins.hardTrades.time);`sym`time;.joins.hardTrades;(.joins.hardQuotes;(min;`bid);(max;`ask))]);
        (update bid:0^bid,ask:0^ask from aj[`sym`time;.joins.hardTrades;.joins.hardQuotes])
    );
