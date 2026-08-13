//====================================================================
//
// q-Quiz
//
// Topic      : kdb+ TAQ — Repository & Processing Focus
// Difficulty : Easy
//
//====================================================================
.quiz.syntaxTaq.easy:`taqPurpose`taqDataSource`taqSourceDirectory`taqDecompression`taqProcessingScript`taqThreads`taqLoadScript`taqTradeTable`taqTradeSymbol`taqTradePrice`taqTradeVolume`taqTradeTimestamp`taqSchemaInspection`taqTradeAggregationCount`taqTradeAggregationMax`taqTradeAggregationGrouping`taqDerivedTables`taqSourceFilename`taqFileSize`taqRepositoryRecommendation!
    (
    `question`answers`correct!(
        "What is the primary purpose of the kdb-taq repository?";

        `a`b`c`d!(
            "To process and analyze historical NYSE Daily TAQ (Trade and Quote) data using kdb+/q";
            "To provide a live NYSE trading gateway for submitting orders";
            "To generate synthetic tick data for kdb+ benchmarks";
            "To provide a Python API for querying Bloomberg market data"
        );

        `a
    );

    `question`answers`correct!(
        "Where does the kdb-taq README specify that the historical Daily TAQ data comes from?";

        `a`b`c`d!(
            "The NYSE FTP site";
            "The kdb+ tickerplant";
            "The Bloomberg Terminal";
            "The Federal Reserve API"
        );

        `a
    );

    `question`answers`correct!(
        "After cloning kdb-taq, where does the README suggest placing the downloaded TAQ file before processing it?";

        `a`b`c`d!(
            "In a source directory such as SRC";
            "Directly inside the kdb+ root directory";
            "Inside the sym directory";
            "Inside the taq directory created by the loader"
        );

        `a
    );

    `question`answers`correct!(
        "What does the command `gzip -d SRC/*` do in the documented TAQ workflow?";

        `a`b`c`d!(
            "Decompresses the downloaded TAQ files in SRC";
            "Deletes all TAQ files from SRC";
            "Loads the TAQ files into kdb+";
            "Converts the TAQ files into splayed tables"
        );

        `a
    );

    `question`answers`correct!(
        "Which script is used to process the source TAQ data?";

        `a`b`c`d!(
            "tq.q";
            "taq.q";
            "trade.q";
            "load.q"
        );

        `a
    );

    `question`answers`correct!(
        "What does the `-s 8` option mean in `q tq.q -s 8 SRC`?";

        `a`b`c`d!(
            "Use 8 threads";
            "Process 8 symbols only";
            "Read 8 source files";
            "Split each trade into 8 partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Which command loads the processed TAQ data into the kdb+ environment according to the README?";

        `a`b`c`d!(
            "\\l tq";
            "\\l taq";
            "\\load tq";
            "\\tq"
        );

        `a
    );

    `question`answers`correct!(
        "Which table is explicitly shown in the README as containing trade data?";

        `a`b`c`d!(
            "trade";
            "trades";
            "transaction";
            "tick"
        );

        `a
    );

    `question`answers`correct!(
        "Which column identifies the symbol in the `trade` table schema shown in the README?";

        `a`b`c`d!(
            "Symbol";
            "sym";
            "Ticker";
            "Security"
        );

        `a
    );

    `question`answers`correct!(
        "What is the datatype of `TradePrice` in the documented `trade` table schema?";

        `a`b`c`d!(
            "e";
            "f";
            "d";
            "i"
        );

        `a
    );

    `question`answers`correct!(
        "What is the datatype of `TradeVolume` in the documented `trade` table schema?";

        `a`b`c`d!(
            "i";
            "e";
            "f";
            "j"
        );

        `a
    );

    `question`answers`correct!(
        "What is the datatype of `Time` in the documented `trade` table schema?";

        `a`b`c`d!(
            "n";
            "p";
            "t";
            "d"
        );

        `a
    );

    `question`answers`correct!(
        "Which expression is used in the README to inspect the schema of the `trade` table?";

        `a`b`c`d!(
            "meta trade";
            "schema trade";
            "meta `trade";
            "columns trade"
        );

        `a
    );

    `question`answers`correct!(
        "In the example `select numTrade:count i,maxPrice:max TradePrice by Time.hh from trade`, what does `numTrade` represent?";

        `a`b`c`d!(
            "The number of trades in each hour";
            "The maximum trade volume in each hour";
            "The number of symbols traded in each hour";
            "The number of quote updates in each hour"
        );

        `a
    );

    `question`answers`correct!(
        "In the same aggregation, what does `maxPrice:max TradePrice` calculate?";

        `a`b`c`d!(
            "The maximum trade price for each hour";
            "The average trade price for each hour";
            "The maximum trade volume for each hour";
            "The latest trade price for each hour"
        );

        `a
    );

    `question`answers`correct!(
        "What does `by Time.hh` do in the example TAQ aggregation?";

        `a`b`c`d!(
            "Groups the trades by hour";
            "Groups the trades by symbol";
            "Groups the trades by exchange";
            "Groups the trades by trade condition"
        );

        `a
    );

    `question`answers`correct!(
        "Which three TAQ-related tables are produced or made available by the documented kdb-taq workflow?";

        `a`b`c`d!(
            "trade, quote and nbbo";
            "trade, order and execution";
            "quote, order and position";
            "trade, sym and master"
        );

        `a
    );

    `question`answers`correct!(
        "Which source filename pattern is used in the README example to download a US equity trade file?";

        `a`b`c`d!(
            "EQY_US_ALL_TRADE_<DATE>";
            "US_EQY_TRADE_<DATE>";
            "NYSE_TRADE_<DATE>";
            "TAQ_US_TRADE_<DATE>"
        );

        `a
    );

    `question`answers`correct!(
        "Approximately how large does the README say the sample TAQ files can be?";

        `a`b`c`d!(
            "Around 2 GB each";
            "Around 20 MB each";
            "Around 200 KB each";
            "Around 20 GB each"
        );

        `a
    );

    `question`answers`correct!(
        "What does KX recommend instead of linking an application directly to the kdb-taq repository?";

        `a`b`c`d!(
            "Download the code and subject it to your own version control and regression testing";
            "Fork the repository and automatically pull from master in production";
            "Run the repository directly from GitHub in production";
            "Convert all TAQ data to CSV before every query"
        );

        `a
    )
    );