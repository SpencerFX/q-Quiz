//====================================================================
// fundamentals — enumerations inputs
//
// Own dedicated inputs, same pattern as the other fundamentals kinds.
// An enum domain in q is just an ordinary global symbol list; `x$y`
// enumerates y against domain x (erroring - a 'cast - on any value
// not already in it), `x?y` does the same but auto-EXTENDS the
// domain with anything new. Both are demonstrated below against
// dedicated domains under .enum.* so this section doesn't touch or
// depend on any other kind's globals.
//
// Everything here was verified against a live q process before being
// written down, including one real mistake worth flagging: writing
// `.enum.stocksA$xs` (no backtick) inside a lambda does NOT enumerate
// - it evaluates .enum.stocksA to its plain value first and applies a
// different overload of $ entirely, failing with a confusing error
// named after the data itself (e.g. 'AAPL) rather than a normal type
// error. The domain name must be a backtick-quoted SYMBOL - `` `.enum.stocksA$xs `` -
// exactly like `sym$x` in the kdb+ reference docs.
//
// -3! (what grading compares) shows an enum in `domain$values` form
// regardless of whether it was built with $ or ? - confirmed live -
// so these are genuinely gradeable, not just cosmetic, same as the
// attribute prefixes fundamentals/inputs/attributes.q relies on.
//====================================================================

.enum.stocksA:`AAPL`GOOG`MSFT;
.enum.stocksB:`AAPL`GOOG;
.enum.stocksC:`AAPL`GOOG;
.enum.stocksD:`AAPL`GOOG`MSFT;
.enum.stocksE:`AAPL`GOOG`MSFT;
.enum.stocksG:`AAPL`GOOG`MSFT;
.enum.stocksH:`AAPL`GOOG`MSFT;

.inputs.enumerations.easy:
    `enumerateBasic`checkEnumType`enumCompareToSymbol`dequenumerateValue!(
        (enlist `AAPL`GOOG`AAPL);
        (enlist `.enum.stocksA$`AAPL`GOOG);
        (`.enum.stocksA$`AAPL`GOOG; `AAPL`GOOG);
        (enlist `.enum.stocksA$`AAPL`GOOG`AAPL)
    );

.inputs.enumerations.medium:
    `extendDomainViaQuestion`domainAfterExtend`protectedCast`enumTableColumn!(
        (enlist `AAPL`TSLA);
        (enlist `AAPL`NFLX);
        (enlist `ORCL);
        (enlist ([] sym:`AAPL`GOOG`AAPL; price:1 2 3))
    );

.inputs.enumerations.hard:
    `enumerateViaQEnUtility`rawIndexBehindEnum`safeEnumBatch!(
        (enlist ([] sym:`AAPL`GOOG`AAPL; price:1 2 3));
        (enlist `GOOG`AAPL`MSFT);
        (enlist `AAPL`ORCL`GOOG)
    );
