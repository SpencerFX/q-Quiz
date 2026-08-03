//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxCompression.hard:`fullSortedCompareBlock`fullBoolIntLongBlock`fullTradeGen`fullQuoteGen`aggBySymBucketFull`ajFullLine`streamVsTwoStepPick`fieldDictNullPick`zzdUsagePick`xascMultiColPick`selectSubsetPick`logicalBlockLowerBound!
    (
    `question`answers`correct!(
        "Which block of code correctly reproduces the four-way compression comparison (uncompressed, unsorted, sorted by sym, sorted by sym and venue) from the paper?";

        `a`b`c`d!(
            "n:100000000; t:([]sym:n?`ibm`goog`aapl`tsla`spx;venue:n?`nsdq`nyse); `:uncompressed/ set .Q.en[`:uncompressed] t; (`:unsorted/;16;2;5) set .Q.en[`:unsorted] t; (`:symSorted/;16;2;5) set .Q.en[`:symSorted] `sym xasc t; (`:symVenueSorted/;16;2;5) set .Q.en[`:symVenueSorted] `sym`venue xasc t";
            "n:100000000; t:([]sym:n?`ibm`goog`aapl`tsla`spx;venue:n?`nsdq`nyse); `:uncompressed/ set t; (`:unsorted/;16;2;5) set `sym xasc t; (`:symSorted/;16;2;5) set .Q.en[`:symSorted] t; (`:symVenueSorted/;16;2;5) set .Q.en[`:symVenueSorted] t";
            "n:100000000; t:([]sym:n?`ibm`goog`aapl`tsla`spx;venue:n?`nsdq`nyse); (`:uncompressed/;16;2;5) set t; `:unsorted/ set .Q.en[`:unsorted] t; `:symSorted/ set `sym xasc t; `:symVenueSorted/ set `sym`venue xasc t";
            "n:100000000; t:([]sym:n?`ibm`goog`aapl`tsla`spx;venue:n?`nsdq`nyse); `:uncompressed/ set .Q.en[`:uncompressed] t; (`:unsorted/;16;2;5) set `sym xasc .Q.en[`:unsorted] t; (`:symSorted/;16;2;5) set .Q.en[`:symSorted] t; (`:symVenueSorted/;16;2;5) set .Q.en[`:symVenueSorted] t"
        );

        `a
    );

    `question`answers`correct!(
        "Which block correctly reproduces the boolean/int/long compression test, where the int and long columns share the same underlying values?";

        `a`b`c`d!(
            "n:100000000; ints:n?0Wi; t:([]boolean:n?01b;integer:ints;longint:`long$ints); `:nocomp/ set t; (`:comp/;16;2;5) set t";
            "n:100000000; ints:n?0Wi; t:([]boolean:n?01b;integer:ints;longint:n?0Wj); `:nocomp/ set t; (`:comp/;16;2;5) set t";
            "n:100000000; t:([]boolean:n?01b;integer:n?0Wi;longint:n?0Wj); (`:nocomp/;16;2;5) set t; `:comp/ set t";
            "n:100000000; ints:n?0Wi; t:([]boolean:n?01b;integer:ints;longint:ints); (`:nocomp/;16;2;5) set t; `:comp/ set t"
        );

        `a
    );

    `question`answers`correct!(
        "Which snippet correctly reproduces the trade-table generator, with sym pre-sorted and time evenly spaced across the trading session?";

        `a`b`c`d!(
            "n:100000000; st:.z.D+09:30; et:.z.D+16:00; trade:([]sym:asc n?`3; time:\"p\"$st+((et-st)%n-1)*til n; price:n?1000.; size:n?100)";
            "n:100000000; st:.z.D+09:30; et:.z.D+16:00; trade:([]sym:n?`3; time:\"p\"$st+n?(et-st); price:n?1000.; size:n?100)";
            "n:100000000; st:.z.D+09:30; et:.z.D+16:00; trade:([]sym:asc n?`3; time:st+til n; price:n?1000.; size:n?100)";
            "n:100000000; st:.z.D+09:30; et:.z.D+16:00; trade:([]sym:desc n?`3; time:\"p\"$st+((et-st)%n-1)*til n; price:n?1000.; size:n?100)"
        );

        `a
    );

    `question`answers`correct!(
        "Given trade was built with row count n, which snippet correctly builds the quote table with 4x as many rows and matching evenly-spaced timestamps?";

        `a`b`c`d!(
            "n*:4; quote:([]sym:asc n?`3; time:\"p\"$st+((et-st)%n-1)*til n; bp:n?1000.; ap:n?1000.; bs:n?100; as:n?100)";
            "quote:([]sym:asc (4*n)?`3; time:\"p\"$st+((et-st)%n-1)*til n; bp:n?1000.; ap:n?1000.; bs:n?100; as:n?100)";
            "n:n%4; quote:([]sym:asc n?`3; time:\"p\"$st+((et-st)%n-1)*til n; bp:n?1000.; ap:n?1000.; bs:n?100; as:n?100)";
            "n*:4; quote:([]sym:desc n?`3; time:\"p\"$st+((et-st)%n+1)*til n; bp:n?1000.; ap:n?1000.; bs:n?100; as:n?100)"
        );

        `a
    );

    `question`answers`correct!(
        "Which query correctly reproduces 'aggregate values by a subset of symbols using 5-minute time buckets', matching the paper's Figure 4 test?";

        `a`b`c`d!(
            "select size wavg price by sym, 5 xbar time.minute from trade where sym in ids";
            "select size wavg price by sym from trade where sym in ids, 5 xbar time.minute";
            "select avg size wavg price by 5 xbar sym, time.minute from trade where sym in ids";
            "select size wavg price by sym from trade where (5 xbar time.minute) in ids"
        );

        `a
    );

    `question`answers`correct!(
        "Which line correctly performs the as-of join test from the paper, joining trade (restricted to ids) against the full quote table on sym and time?";

        `a`b`c`d!(
            "aj[`sym`time; select from trade where sym in ids; select from quote]";
            "aj[`sym`time; select from quote; select from trade where sym in ids]";
            "aj[`time`sym; select from trade; select from quote where sym in ids]";
            "aj[`sym; select from trade where sym in ids; select from quote]"
        );

        `a
    );

    `question`answers`correct!(
        "When choosing between (`:file;16;2;5) set t and `:file set .Q.en[`:file] t (with .z.zd left unset), which correctly describes the outcome?";

        `a`b`c`d!(
            "The first streams t to disk compressed with block size 16, algorithm 2, level 5; the second saves the enumerated table uncompressed since no default compression parameters are set";
            "Both produce identical compressed output, since .Q.en implies compression";
            "The first saves uncompressed; the second saves compressed using algorithm 2 by default";
            "Neither will succeed without .z.zd being set first"
        );

        `a
    );

    `question`answers`correct!(
        "Which field-compression dictionary correctly compresses column a with parameters (17;2;9), leaves column b at (17;2;6), and applies (17;2;6) as the default for any other column, matching the paper's example?";

        `a`b`c`d!(
            "``a`b!((17;2;6); (17;2;9); (17;2;6))";
            "`a`b`!((17;2;9); (17;2;6); (17;2;6))";
            "``a`b!((17;2;9); (17;2;6); (17;2;6))";
            "`a`b!((17;2;9); (17;2;6))"
        );

        `a
    );

    `question`answers`correct!(
        "Which line correctly sets default compression parameters and then saves data the plain old-fashioned way, relying on those defaults, matching .z.zd:(17;2;6);`:zfile set asc 10000?`3?";

        `a`b`c`d!(
            ".z.zd:(17;2;6); `:zfile set asc 10000?`3";
            "`:zfile set (.z.zd:(17;2;6); asc 10000?`3)";
            ".z.zd:(17;2;6) set `:zfile asc 10000?`3";
            "asc 10000?`3 set .z.zd:(17;2;6) `:zfile"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression correctly sorts a table by sym first, then venue, as the final and most-compressed variant in the paper's sorting test?";

        `a`b`c`d!(
            "`sym`venue xasc t";
            "`venue`sym xasc t";
            "xasc[`sym`venue] each t";
            "t xasc `sym`venue"
        );

        `a
    );

    `question`answers`correct!(
        "Which query correctly matches 'select all data for a subset of symbols' from the paper, given ids is a pre-selected vector of 100 symbols?";

        `a`b`c`d!(
            "select from trade where sym in ids";
            "select from trade where sym=ids";
            "select ids from trade where sym";
            "select from trade where sym within ids"
        );

        `a
    );

    `question`answers`correct!(
        "According to the paper, what determines the practical lower bound on logical block size, and why?";

        `a`b`c`d!(
            "The system's allocation granularity (e.g. 4KB page size on AMD64); dividing data into smaller chunks than that wastes space";
            "The number of columns in the table; fewer columns allow a smaller block size";
            "The compression algorithm chosen; gzip enforces a fixed minimum block size";
            "The row count of the table; smaller tables require proportionally smaller blocks"
        );

        `a
    )
 );
//====================================================================