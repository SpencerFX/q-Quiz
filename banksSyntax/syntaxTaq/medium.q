//====================================================================
//
// q-Quiz
//
// Topic      : kdb+ TAQ — Processing & Ingestion
// Difficulty : Medium
//
//====================================================================
.quiz.syntaxTaq.medium:`tqArgumentValidation`tqOptionParsing`tqDestinationPath`tqSchemaVersions`tqSchemaDefinitions`tqFormatString`tqSymbolSanitization`tqPartedSymbols`tqSymbolEnumeration`tqPartitionPath`tqPartitionWritePath`tqPartedAttribute`tqPartedAttributeCheck`tqQuoteSplitValidation`tqQuoteSplitOrdering`tqTradeFileProcessing`tqTradeTransformation`tqSizefHandling`tqTradeCorrection`tqCorrectionConcept`tqHistoricalVersions`tqKdbVersionCheck`tqEnumeratedWrite`tqParallelProcessing`tqParallelTradeSymbols`tqPar2Path`tqFileTiming`tqDataTransformation`tqLoaderArchitecture!
    (
    `question`answers`correct!(
        "What does the check `if[1>count .Q.x;-1\">q \",(string .z.f),\" SRC\";exit 1]` in tq.q enforce?";

        `a`b`c`d!(
            "That a source-directory argument has been supplied to the script";
            "That exactly one TAQ file must exist in SRC";
            "That eight processing threads must be supplied";
            "That the destination directory must already exist"
        );

        `a
    );

    `question`answers`correct!(
        "In tq.q, what is the purpose of `o:.Q.opt .z.x`?";

        `a`b`c`d!(
            "It parses command-line options supplied to the q process";
            "It opens the TAQ source directory";
            "It creates the output table options";
            "It parses the TAQ schema version from the filename"
        );

        `a
    );

    `question`answers`correct!(
        "What does `dst:`$\":\",.Q.x[1],\"/taq\"` establish?";

        `a`b`c`d!(
            "The destination directory under which the processed TAQ database is written";
            "The source directory containing compressed TAQ files";
            "The path to the NYSE FTP server";
            "The location of the sym file used by `.Q.en`"
        );

        `a
    );

    `question`answers`correct!(
        "Why does tq.q define multiple versions of `nh2`, `nf2`, `th2`, `tf2`, `qh2` and `qf2`?";

        `a`b`c`d!(
            "TAQ file schemas changed across historical TAQ versions, so different field layouts and types must be supported";
            "Each variable represents a different tickerplant process";
            "They are alternative schemas for different kdb+ architectures";
            "They represent separate NYSE exchanges"
        );

        `a
    );

    `question`answers`correct!(
        "In tq.q, what is the purpose of the version-specific schema definitions such as `th2` and `tf2`?";

        `a`b`c`d!(
            "They describe the column names and parsing format used to interpret trade files";
            "They define the final HDB partition attributes";
            "They determine the number of processing threads";
            "They enumerate symbols against the master table"
        );

        `a
    );

    `question`answers`correct!(
        "What does the format string beginning `\"NC*S...\"` in a TAQ schema definition primarily describe?";

        `a`b`c`d!(
            "The q types used to parse the fields from the delimited source data";
            "The number of rows to process in each partition";
            "The compression level of the source file";
            "The sort order of the resulting table"
        );

        `a
    );

    `question`answers`correct!(
        "Why does tq.q call `s16` when processing the Symbol field?";

        `a`b`c`d!(
            "It replaces spaces in symbols with dots and converts the cleaned value back to symbol";
            "It converts symbols to 16-bit integers";
            "It removes all symbols containing dots";
            "It creates a 16-character fixed-width symbol"
        );

        `a
    );

    `question`answers`correct!(
        "What does `psym` do to the `Symbol` column after data has been written?";

        `a`b`c`d!(
            "It applies the parted attribute and removes duplicate symbol values within the relevant partition";
            "It converts every symbol into a string";
            "It applies the sorted attribute to Time";
            "It creates the NBBO table"
        );

        `a
    );

    `question`answers`correct!(
        "In `adsftg2`, what is the role of `.Q.en[d]`?";

        `a`b`c`d!(
            "It enumerates symbol values against the sym file/domain associated with the destination database";
            "It decompresses the source TAQ file";
            "It converts timestamps into nanoseconds";
            "It creates the master table"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of `.Q.par . dpt` in the TAQ ingestion code?";

        `a`b`c`d!(
            "To determine the partition path associated with the destination database and date";
            "To parse the command-line options";
            "To calculate the number of rows per thread";
            "To determine the TAQ schema version"
        );

        `a
    );

    `question`answers`correct!(
        "Why is `p:*`/:(,.Q.par . dpt),`` used before writing data in `adsftg2`?";

        `a`b`c`d!(
            "It constructs the path to the partition/table being written";
            "It creates a symbol enumeration domain";
            "It generates the source filenames";
            "It sorts the incoming records by symbol"
        );

        `a
    );

    `question`answers`correct!(
        "What is the significance of the `p#` attribute in the TAQ processing code?";

        `a`b`c`d!(
            "It is used to partition/group data by symbol so symbol-based access and processing are efficient";
            "It compresses each partition";
            "It converts symbols to integers";
            "It forces the table to be keyed"
        );

        `a
    );

    `question`answers`correct!(
        "Why does `psym` check whether the Symbol column already has the `p#` attribute?";

        `a`b`c`d!(
            "To avoid unnecessarily reapplying the parted attribute";
            "Because `p#` and `s#` cannot be used with symbols";
            "Because `.Q.en` requires an unpartitioned column";
            "To determine which TAQ schema version is being used"
        );

        `a
    );

    `question`answers`correct!(
        "What does the check `if[(#Q:F\"splits_us_all_bbo_*[0-9]\")within 1 25;-1\"missing quote splits\";exit 1]` protect against?";

        `a`b`c`d!(
            "Processing cannot continue if the expected quote split files are missing";
            "The trade table contains too many rows";
            "The sym file contains too many symbols";
            "The destination database has too many partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why is the quote file list passed through `.q.asc Q` before processing?";

        `a`b`c`d!(
            "To process the quote split files in ascending order";
            "To sort the quotes by price";
            "To sort the quotes by symbol";
            "To remove duplicate quote records"
        );

        `a
    );

    `question`answers`correct!(
        "Which line in tq.q processes the trade files matching `eqy_us_all_trade_[0-9]*`?";

        `a`b`c`d!(
            "`\\t {foo2[`trade;Tf2;tt2;tg2]x}'F\"eqy_us_all_trade_[0-9]*\"`";
            "`\\t {foo2[`quote;Qf2;qt2;qg2]x}'F\"eqy_us_all_trade_[0-9]*\"`";
            "`\\t {foo2[`trade;Qf2;qt2;qg2]x}'F\"eqy_us_all_quote_[0-9]*\"`";
            "`\\t {foo2[`nbbo;Tf2;tt2;tg2]x}'F\"eqy_us_all_trade_[0-9]*\"`"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the `tg2` function used when processing current trade files?";

        `a`b`c`d!(
            "It transforms and corrects trade fields, including the size/sizef handling, before the data is written";
            "It groups trades by hour";
            "It creates the sym file";
            "It validates the quote split filenames"
        );

        `a
    );

    `question`answers`correct!(
        "According to the comments in tq.q, what changed in the newer TAQ version handling for `sizef`?";

        `a`b`c`d!(
            "A float `sizef` field was added and the integer size is adjusted using rules based on its value";
            "Trade price was changed from float to integer";
            "Symbol was changed from symbol to char";
            "Trade time was changed from nanosecond to second"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the newer trade processing use `corr` when constructing the trade transformation?";

        `a`b`c`d!(
            "To apply the trade-correction logic to the relevant fields";
            "To correct the destination partition path";
            "To correct symbol enumeration failures";
            "To correct the number of processing threads"
        );

        `a
    );

    `question`answers`correct!(
        "What does `corr` represent conceptually in the TAQ ingestion code?";

        `a`b`c`d!(
            "A transformation used to account for trade corrections in the source data";
            "The correlation between bid and offer prices";
            "A correction to the kdb+ version number";
            "A correction to the source-directory name"
        );

        `a
    );

    `question`answers`correct!(
        "Why does tq.q contain historical branches for TAQ 2.2, 3.0, 3.2 and 3.3?";

        `a`b`c`d!(
            "The NYSE TAQ schema evolved over time and the loader maintains compatibility with different historical layouts";
            "Different branches correspond to different kdb+ IPC protocols";
            "Each branch is for a different CPU architecture";
            "They represent different levels of database compression"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the `if[(3.4>.z.K)|2016.09.26>.z.k;...;exit 1]` check?";

        `a`b`c`d!(
            "It prevents execution on kdb+ versions older than the required minimum";
            "It checks whether the TAQ data is newer than 2016";
            "It checks whether the source file contains at least 3.4 million rows";
            "It verifies that three quote files exist"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the code use `.Q.en[d]@+g f!...` rather than simply writing the raw Symbol strings to the partition?";

        `a`b`c`d!(
            "The symbols are enumerated against the destination sym domain before the transformed table is written";
            "Raw strings cannot be stored in kdb+ tables";
            "The operation converts symbols to timestamps";
            "It is required to calculate the NBBO"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the `par` option in the newer TAQ loader?";

        `a`b`c`d!(
            "It enables partition-aware processing, including splitting symbol work across partition paths";
            "It disables all multithreading";
            "It converts the TAQ database into a keyed table";
            "It enables compression of the source `.gz` files"
        );

        `a
    );

    `question`answers`correct!(
        "When `par` is enabled and the table is a trade table, why does `adsftg2` have special handling for `sym`?";

        `a`b`c`d!(
            "Trade data is partitioned by symbol, so the write targets must be determined from symbol values";
            "Trade tables do not contain a symbol column";
            "Trade symbols must be converted to integers before partitioning";
            "The trade table cannot use `.Q.en`"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of `par2` in the newer TAQ processing code?";

        `a`b`c`d!(
            "It determines the partition path for a particular partition/table combination, using partition metadata when available";
            "It parses the TAQ source file";
            "It creates a secondary index on Time";
            "It applies the sorted attribute to Symbol"
        );

        `a
    );

    `question`answers`correct!(
        "What does the expression `\\t {foo2[...]x}'...` provide during TAQ processing?";

        `a`b`c`d!(
            "It times the processing of each source file";
            "It starts a tickerplant";
            "It writes a timer event to the HDB";
            "It converts the source file to gzip"
        );

        `a
    );

    `question`answers`correct!(
        "Why is the source data transformed before `.Q.en` and the final write rather than simply loaded as-is?";

        `a`b`c`d!(
            "The loader must normalize fields, handle schema differences/corrections, enumerate symbols and prepare the data for partitioned storage";
            "TAQ files contain no usable timestamps";
            "kdb+ cannot read delimited text";
            "The transformation is only required to display the data in the README"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes the relationship between `foo2`, `adsftg2`, and `.Q.en` in the current loader?";

        `a`b`c`d!(
            "`foo2` supplies the table/schema-specific arguments to `adsftg2`, while `adsftg2` transforms, enumerates and writes the data";
            "`foo2` creates the sym file and `.Q.en` performs all partitioning";
            "`adsftg2` parses command-line arguments while `foo2` starts the kdb+ process";
            "They are three independent query functions used only after the HDB is loaded"
        );

        `a
    )
    );