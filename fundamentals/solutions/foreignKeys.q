//====================================================================
// fundamentals — foreign keys solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / enumerations.q / dictionaries.q /
// qUtils.q for the same reasoning). See
// fundamentals/inputs/foreignKeys.q for the mechanics these rely on.
//====================================================================

.solutions.foreignKeys.easy:
    `createForeignKey`metaShowsForeignKey`qDotFk`fkRejectsUnknownValue!(
        (update sym:`.fk.sectorRef$sym from .fk.baseTrade);
        (meta (update sym:`.fk.sectorRef$sym from .fk.baseTrade));
        (.Q.fk (update sym:`.fk.sectorRef$sym from .fk.baseTrade)`sym);
        (@[{`.fk.sectorRef$x};`ORCL;{x}])
    );

.solutions.foreignKeys.medium:
    `dotNotationInSelect`fkEquivalentToLeftJoin`fkInWhereClause`fkInAggregateBy!(
        (select sym,price,sym.sector from (update sym:`.fk.sectorRef$sym from .fk.baseTrade));
        (select sym,price,sym.curr from .fk.currTrade);
        (select from (update sym:`.fk.sectorRef$sym from .fk.baseTrade) where sym.sector=`Tech);
        (select totalPrice:sum price by sym.sector from (update sym:`.fk.sectorRef$sym from .fk.baseTrade))
    );

.solutions.foreignKeys.hard:
    `manualLjMatchesFkSelect`transitiveForeignKey`safeForeignKeyBatch!(
        ((select sym,price,sym.curr from .fk.currTrade)~(.fk.currTrade lj .fk.currRef));
        (select sym,sym.sector,sym.sector.region from .fk.chainTrade);
        ({[xs] {@[{`.fk.sectorRef$x};x;{`UNKNOWN}]} each xs}[`AAPL`ORCL`GOOG])
    );
