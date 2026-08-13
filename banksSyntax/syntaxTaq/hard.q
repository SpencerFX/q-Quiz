//====================================================================
//
// q-Quiz
//
// Topic      : kdb+ TAQ — Loader Internals & Architecture
// Difficulty : Hard
//
//====================================================================
.quiz.syntaxTaq.hard:`schemaDispatch`tqVersionCompatibility`foo2Architecture`symbolEnumeration`enumerationDomain`symbolNormalization`partedAttribute`dateVsSymbolPartitioning`sizefHandling`tradeCorrections`historicalSchemaHandling`destinationSchemaTransformation`tradeQuoteTransformation`schemaTypeMismatch`sourceDestinationSeparation`parallelProcessing`partitionAwareRouting`partitionPathResolution`functionalWrite`destinationLayoutResolution!
    (
    `question`answers`correct!(
        "Why is it important that tq.q selects a schema definition before passing a source file to `foo2`?";

        `a`b`c`d!(
            "The source TAQ files have changed layout across historical versions, so the parser must use the matching field definitions";
            "The schema determines how many q processes are started";
            "The schema determines whether the sym file is compressed";
            "The schema is only needed when querying the finished HDB"
        );

        `a
    );

    `question`answers`correct!(
        "Suppose a historical TAQ file contains a field ordering different from the current format. What is the most important consequence of passing it to the current schema anyway?";

        `a`b`c`d!(
            "Fields can be parsed into the wrong columns or with incompatible types, producing corrupted or invalid data";
            "Only the partition size will change";
            "The file will automatically be converted to the newest schema";
            "Only the Symbol column will be affected"
        );

        `a
    );

    `question`answers`correct!(
        "What is the architectural reason for having `foo2` call a lower-level function such as `adsftg2` rather than putting all table-specific logic directly into the file-processing loop?";

        `a`b`c`d!(
            "It separates source-file dispatch and schema selection from the common transformation-and-write machinery";
            "It forces all tables to use the same schema";
            "It prevents `.Q.en` from being called more than once";
            "It converts all TAQ data into keyed tables before writing"
        );

        `a
    );

    `question`answers`correct!(
        "Why must symbol enumeration occur before writing an enumerated Symbol column?";

        `a`b`c`d!(
            "The symbol values must be represented using the destination sym domain rather than stored as raw strings";
            "Enumeration sorts the rows by Time";
            "Enumeration calculates trade corrections";
            "Enumeration determines the number of partitions"
        );

        `a
    );

    `question`answers`correct!(
        "What would be the most likely problem if `.Q.en[d]` were accidentally called with the wrong database directory?";

        `a`b`c`d!(
            "Symbols could be enumerated against the wrong sym domain, producing incompatible enumeration values";
            "Trade timestamps would automatically become seconds";
            "The source gzip files would fail to decompress";
            "The number of worker threads would change"
        );

        `a
    );

    `question`answers`correct!(
        "Why is symbol normalization such as replacing spaces before enumeration particularly important in a market-data loader?";

        `a`b`c`d!(
            "Different textual representations of the same security can otherwise become inconsistent symbol-domain values";
            "Spaces cause q timestamps to overflow";
            "Spaces prevent `.Q.par` from finding partitions";
            "It is required by the gzip format"
        );

        `a
    );

    `question`answers`correct!(
        "Why is `p#` particularly useful when Symbol is the grouping dimension?";

        `a`b`c`d!(
            "It records symbol-group boundaries so q can efficiently locate contiguous groups within the column";
            "It encrypts symbols";
            "It converts symbols into timestamps";
            "It sorts the entire database by Time"
        );

        `a
    );

    `question`answers`correct!(
        "What is the important distinction between partitioning a database by date and using `p#` on Symbol within a partition?";

        `a`b`c`d!(
            "Date partitioning separates data across filesystem partitions, while `p#` organizes values within a column inside a partition";
            "They are two names for exactly the same operation";
            "`p#` creates filesystem directories while date partitioning changes column attributes";
            "Date partitioning is only used for quote data"
        );

        `a
    );

    `question`answers`correct!(
        "The newer trade schema introduces `sizef` alongside an integer size field. Why would the loader need explicit logic rather than simply ignoring `sizef`?";

        `a`b`c`d!(
            "The fractional-size information can require adjustment of the stored size representation according to the TAQ rules";
            "`sizef` determines the destination filesystem partition";
            "`sizef` contains the Symbol enumeration domain";
            "`sizef` is the trade timestamp"
        );

        `a
    );

    `question`answers`correct!(
        "Why is trade correction handling fundamentally different from simply filtering duplicate rows?";

        `a`b`c`d!(
            "A correction can alter the meaning of an existing trade, so the loader must apply the source correction semantics rather than merely remove duplicates";
            "Corrections only apply to quote data";
            "Duplicate filtering always reconstructs the corrected trade";
            "Trade corrections only affect partition names"
        );

        `a
    );

    `question`answers`correct!(
        "Why does historical schema support make the loader more than a simple CSV-to-kdb+ conversion script?";

        `a`b`c`d!(
            "It must interpret different source layouts and normalize them into a consistent destination representation";
            "It must convert q code into C";
            "It must create a tickerplant for every source file";
            "It must store every historical schema separately forever"
        );

        `a
    );

    `question`answers`correct!(
        "Consider a source file whose schema contains an extra field compared with the destination table. What should a robust ingestion layer do?";

        `a`b`c`d!(
            "Parse according to the appropriate source schema and explicitly transform or select the fields required by the destination schema";
            "Write the extra field into an arbitrary destination column";
            "Ignore the entire file automatically";
            "Change the destination schema for every row"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the TAQ loader keep separate transformation functions for trade and quote data instead of forcing both through one identical transformation?";

        `a`b`c`d!(
            "Trades and quotes have different source schemas, fields and market-data semantics";
            "q does not allow one function to process two tables";
            "Quotes cannot contain timestamps";
            "Trades cannot contain symbols"
        );

        `a
    );

    `question`answers`correct!(
        "If a source file is parsed with the wrong q type specification, why might the resulting problem be more serious than a simple type mismatch error?";

        `a`b`c`d!(
            "A value may parse successfully into the wrong type and silently corrupt the semantic meaning of subsequent columns";
            "q always detects every schema mismatch before loading";
            "Only performance is affected";
            "The error can only affect the filename"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the loader need to distinguish source-file processing from destination writing?";

        `a`b`c`d!(
            "Parsing and normalization are source-format concerns, while enumeration, partitioning and attributes are destination-layout concerns";
            "The source files are always stored in the HDB unchanged";
            "Destination writing does not depend on the source schema";
            "The distinction is only cosmetic"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main performance reason for processing TAQ source files in parallel?";

        `a`b`c`d!(
            "Independent source-file transformations can use multiple CPU cores and reduce total ingestion time";
            "Parallelism reduces the number of rows in the source data";
            "Parallelism eliminates the need for symbol enumeration";
            "Parallelism compresses all files simultaneously without CPU cost"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the loader's partition-aware mode require more reasoning about where a row is written than the basic single-output mode?";

        `a`b`c`d!(
            "Rows may need to be routed to different destination paths based on partition metadata and grouping keys";
            "Rows are no longer parsed from text";
            "The loader stops using `.Q.en`";
            "All rows are written to one global table"
        );

        `a
    );

    `question`answers`correct!(
        "What does a function such as `par2` conceptually contribute to the write path?";

        `a`b`c`d!(
            "It helps resolve the destination partition/path associated with the partition-aware write";
            "It parses the raw TAQ CSV";
            "It calculates the trade correction amount";
            "It converts timestamps to dates"
        );

        `a
    );

    `question`answers`correct!(
        "What is the significance of using `.[p;();wf;t]` as the final write operation in the conceptual loader pipeline?";

        `a`b`c`d!(
            "It performs a functional amend/write into the resolved destination path using the prepared table";
            "It performs an IPC query against a tickerplant";
            "It enumerates the Symbol column";
            "It parses the original TAQ file"
        );

        `a
    );

    `question`answers`correct!(
        "Why can the destination HDB layout not be inferred solely from the source TAQ filename?";

        `a`b`c`d!(
            "The filename identifies source-file characteristics, but destination layout also depends on table type, partitioning, symbol enumeration and write logic";
            "TAQ filenames contain no useful information";
            "kdb+ does not support filenames";
            "The destination layout is always identical to the source file"
        );

        `a
    )
    );