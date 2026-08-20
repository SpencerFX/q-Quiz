//====================================================================
// fundamentals — foreign keys inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds.
// A foreign key is just an enumeration (fundamentals/inputs/
// enumerations.q) whose domain is the key column of a KEYED table
// instead of a plain symbol list - that's what unlocks dot-notation
// lookups (t.fkCol.otherCol) into the referenced table.
//
// Two things confirmed live before writing this file:
//
//   - The dot-notation lookup ONLY works inside a qsql clause
//     (select/exec/update) - "trade.sym.sector" as a bare top-level
//     expression throws (error text is literally "sector", the same
//     "error named after the token" pattern already seen for
//     `.enum.stocksA$xs` without a backtick in
//     fundamentals/inputs/enumerations.q). "select sym.sector from
//     trade" works fine - fk chasing is qsql-clause-only syntax.
//   - "select c1,c2,fk.other from t" only equals "t lj ref" when ref
//     has exactly the one non-key column being dot-chased - lj pulls
//     in EVERY non-key column of ref, so a ref table with two
//     non-key columns needs both dot-chased to match. .fk.currRef
//     below has a single non-key column specifically so
//     fkEquivalentToLeftJoin's equivalence holds; .fk.sectorRef has
//     just one too, for the same reason.
//====================================================================

.fk.sectorRef:([sym:`AAPL`GOOG`MSFT] sector:`Tech`CommServices`Tech);

.fk.currRef:([sym:`AAPL`GOOG`MSFT] curr:`USD`USD`USD);

.fk.sectorInfo:([sector:`Tech`CommServices] region:`US`US);

.fk.sectorChain:([sym:`AAPL`GOOG`MSFT] sector:`.fk.sectorInfo$`Tech`CommServices`Tech);

.fk.baseTrade:([] sym:`AAPL`GOOG`AAPL; price:100 200 101);

.fk.currTrade:update sym:`.fk.currRef$sym from .fk.baseTrade;

.fk.chainTrade:update sym:`.fk.sectorChain$sym from .fk.baseTrade;

.inputs.foreignKeys.easy:
    `createForeignKey`metaShowsForeignKey`qDotFk`fkRejectsUnknownValue!(
        (enlist .fk.baseTrade);
        (enlist (update sym:`.fk.sectorRef$sym from .fk.baseTrade));
        (enlist (update sym:`.fk.sectorRef$sym from .fk.baseTrade)`sym);
        (enlist `ORCL)
    );

.inputs.foreignKeys.medium:
    `dotNotationInSelect`fkEquivalentToLeftJoin`fkInWhereClause`fkInAggregateBy!(
        (enlist (update sym:`.fk.sectorRef$sym from .fk.baseTrade));
        (enlist .fk.currTrade);
        (enlist (update sym:`.fk.sectorRef$sym from .fk.baseTrade));
        (enlist (update sym:`.fk.sectorRef$sym from .fk.baseTrade))
    );

.inputs.foreignKeys.hard:
    `manualLjMatchesFkSelect`transitiveForeignKey`safeForeignKeyBatch!(
        (enlist .fk.currTrade);
        (enlist .fk.chainTrade);
        (enlist `AAPL`ORCL`GOOG)
    );
