//====================================================================
//
// q-Quiz
//
// Topic      : Compression
// Difficulty : Medium
//
// Based on the KX whitepaper "Compression"
//
//====================================================================
.quiz.compression.medium:`streamVsConvert`logicalBlockTradeoff`fieldCompressionBenefit`zdotzdPurpose`decompressionCache`hotCacheReason`coldCacheReason`sortingReason`longCompression`compressionFactors`blockSizeChoice`ipcTransfer`fieldDefaults`compressionAlgorithms`memoryUsage`randomAccess`compressionRatio`systemCharacteristics`compressionPlanning`queryWorkload!
    (
    `question`answers`correct!(
        "When is converting an existing file using set generally preferred over streaming compression?";

        `a`b`c`d!(
            "When compressing existing historical data";
            "When creating symbol files";
            "When querying HDBs";
            "When enumerating symbols"
        );

        `a
    );

    `question`answers`correct!(
        "Increasing logical block size generally results in:";

        `a`b`c`d!(
            "Better compression but more data decompressed per query";
            "Worse compression and less decompression";
            "No effect on compression";
            "Automatic partitioning"
        );

        `a
    );

    `question`answers`correct!(
        "Why might field-by-field compression be preferable to compressing every column identically?";

        `a`b`c`d!(
            "Some columns benefit from different compression settings or none at all";
            "Each table may only compress one column";
            "Compression requires keyed tables";
            "Columns cannot share algorithms"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main purpose of defining .z.zd?";

        `a`b`c`d!(
            "To avoid specifying compression parameters on every set";
            "To compress IPC traffic";
            "To configure partitioning";
            "To enable encryption"
        );

        `a
    );

    `question`answers`correct!(
        "Why does kdb+ cache decompressed vectors during a query?";

        `a`b`c`d!(
            "To avoid decompressing the same data multiple times";
            "To permanently replace compressed files";
            "To eliminate disk usage";
            "To update the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "Why can compressed data perform worse with a hot OS cache?";

        `a`b`c`d!(
            "The OS caches compressed data, so decompression occurs every query";
            "Compressed files bypass memory mapping";
            "Compression disables caching";
            "Compressed files cannot be queried"
        );

        `a
    );

    `question`answers`correct!(
        "Why can compression improve performance with a cold OS cache?";

        `a`b`c`d!(
            "Fewer bytes need to be read from disk";
            "No decompression occurs";
            "Compression reduces CPU usage";
            "Memory allocation is eliminated"
        );

        `a
    );

    `question`answers`correct!(
        "Why does sorting highly repetitive columns improve compression ratios?";

        `a`b`c`d!(
            "Repeated values become more contiguous";
            "It reduces table width";
            "It changes data types";
            "It removes duplicate rows"
        );

        `a
    );

    `question`answers`correct!(
        "Why can long columns sometimes compress significantly better than expected?";

        `a`b`c`d!(
            "Unused precision can often be reclaimed during compression";
            "Longs are stored as integers";
            "Longs automatically enumerate";
            "Longs are dictionary encoded"
        );

        `a
    );

    `question`answers`correct!(
        "Besides compression settings, what has the greatest influence on compression ratio?";

        `a`b`c`d!(
            "The characteristics of the data itself";
            "CPU frequency";
            "Number of partitions";
            "Operating system"
        );

        `a
    );

    `question`answers`correct!(
        "How should logical block size generally be chosen?";

        `a`b`c`d!(
            "Based on expected query access patterns";
            "Always use the largest possible";
            "Always use page size";
            "Always use 4KB"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the whitepaper recommend scp for moving compressed files between hosts?";

        `a`b`c`d!(
            "It avoids unnecessary decompression and recompression";
            "It automatically increases compression";
            "It preserves symbol enumeration";
            "It encrypts HDB partitions"
        );

        `a
    );

    `question`answers`correct!(
        "In field-by-field compression, what happens to columns not explicitly listed in the dictionary?";

        `a`b`c`d!(
            "They inherit the default compression parameters";
            "They remain uncompressed";
            "They cannot be written";
            "They use gzip level 9"
        );

        `a
    );

    `question`answers`correct!(
        "Which compression parameter primarily affects CPU time when using gzip?";

        `a`b`c`d!(
            "Compression level";
            "Table size";
            "Partition count";
            "Symbol count"
        );

        `a
    );

    `question`answers`correct!(
        "Why might memory usage appear larger while querying compressed data?";

        `a`b`c`d!(
            "kdb+ allocates space for decompressed vectors during the query";
            "The OS duplicates every file";
            "Compression expands symbol files";
            "Memory mapping is disabled"
        );

        `a
    );

    `question`answers`correct!(
        "Random access to compressed data means:";

        `a`b`c`d!(
            "Only required blocks are decompressed";
            "Entire tables are always decompressed";
            "Compression is disabled";
            "Queries must scan every block"
        );

        `a
    );

    `question`answers`correct!(
        "A larger logical block size usually improves compression because:";

        `a`b`c`d!(
            "There is more opportunity to identify repeated values";
            "The CPU performs fewer calculations";
            "Disk pages become smaller";
            "Enumeration is automatic"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, the optimal compression configuration depends primarily on:";

        `a`b`c`d!(
            "The characteristics of the target system and workload";
            "The kdb+ version";
            "The number of namespaces";
            "The number of keyed tables"
        );

        `a
    );

    `question`answers`correct!(
        "When evaluating compression, which combination should be considered together?";

        `a`b`c`d!(
            "CPU cost, disk I/O, compression ratio, and workload";
            "Partitions, namespaces, and symbols";
            "Threads, IPC, and gateways";
            "Memory mapping and joins only"
        );

        `a
    );

    `question`answers`correct!(
        "Which workload benefits the least from compression according to the benchmark results?";

        `a`b`c`d!(
            "Simple repeated reads from a hot OS cache";
            "Cold-cache full table scans";
            "CPU-intensive aggregations";
            "Large as-of joins"
        );

        `a
    )
 );
//====================================================================