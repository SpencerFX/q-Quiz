//====================================================================
// fundamentals — .Q utils inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds.
// .Q is kdb+'s standard utility namespace - `key `.Q` lists well over
// a hundred names on this build, but most are internal plumbing (used
// BY other .Q.* functions, splay/partition/IPC helpers that need a
// real filesystem or cluster). This kind sticks to the handful that
// are genuinely public, documented, deterministic, and usable
// in-memory: .Q.ty/.Q.qt/.Q.qp (type/shape inspection), .Q.id
// (sanitise a symbol into a valid name), .Q.f/.Q.fmt (fixed-format
// number-to-string), .Q.dd (hsym path joining), .Q.M (the max-long
// "infinity" sentinel), .Q.res (the reserved-word list) and .Q.trp
// (protected eval with a backtrace, a step up from the plain @/. in
// fundamentals/inputs/protectedEvaluation.q).
//
// Two things confirmed live before writing this file, since they
// weren't obvious in advance: .Q.j10/.Q.x10 (looked like base
// conversion) either error or return 'nyi on this build - dropped.
// .Q.v on a table just returns the table unchanged, not the column
// values as I expected - dropped rather than build a question around
// behaviour I don't actually understand.
//====================================================================

.inputs.qUtils.easy:
    `qType`isTable`sanitizeIdentifier`checkAgainstMaxLong!(
        (enlist `hello);
        (enlist `a`b!1 2);
        (enlist `$"my column");
        (enlist 0Wj)
    );

.inputs.qUtils.medium:
    `formatFixedDecimals`formatFixedWidth`buildFilePath`checkPartitioned!(
        (3; 2.718281828);
        (12; 3; 2.718281828);
        (`:/data/trades; `2024.01.01; `AAPL);
        (enlist ([] sym:`AAPL`GOOG; price:100 200))
    );

.inputs.qUtils.hard:
    `checkReservedWords`sanitizeIdentifierBatch`protectedTrpWithBacktrace!(
        (enlist `select`from`myColumn`update`price);
        (enlist (`$"my col";`$"another.col";`cleanCol));
        ({`a+1}; 0; {[e;bt] e})
    );
