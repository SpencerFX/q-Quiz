//====================================================================
//
// q-Quiz
//
// Topic      : Compression
// Difficulty : Hard
//
// Based on the KX whitepaper "Compression"
//
//====================================================================
.quiz.compression.hard:`archiveWorkflow`logicalBlockMinimum`blockTradeoff`fieldCompressionDefault`automaticCaching`swapSpace`hotCacheColumns`sortingScope`compressionVsPrecision`compressionBottleneck`gzipLevel`ipcAlgorithm`randomAccess`fullTableQueries`symbolSubsetQueries`aggregationQueries`memoryAllocation`compressionChoice`scpReason`benchmarkConclusion!
    (
    `question`answers`correct!(
        "Why does the whitepaper recommend placing the source and destination files on separate physical disks when converting existing data using set?";

        `a`b`c`d!(
            "To reduce disk seeks during iterative compression";
            "To increase compression ratios";
            "To improve symbol enumeration";
            "To reduce logical block size"
        );

        `a
    );

    `question`answers`correct!(
        "What determines the minimum useful logical block size for compression?";

        `a`b`c`d!(
            "The operating system allocation granularity";
            "The table row count";
            "The number of symbols";
            "The partition count"
        );

        `a
    );

    `question`answers`correct!(
        "Choosing an excessively large logical block size primarily increases:";

        `a`b`c`d!(
            "Redundant decompression work for selective queries";
            "Compression ratio variability";
            "Memory mapping speed";
            "Symbol lookup time"
        );

        `a
    );

    `question`answers`correct!(
        "Within a field-by-field compression dictionary, which key specifies the default behavior for unspecified columns?";

        `a`b`c`d!(
            "The null symbol (`)";
            "`default";
            "`all";
            "`columns"
        );

        `a
    );

    `question`answers`correct!(
        "Why does kdb+ cache decompressed vectors only for the lifetime of a query?";

        `a`b`c`d!(
            "To avoid repeated decompression during the same query while minimizing long-term memory usage";
            "To permanently replace compressed files";
            "To eliminate OS caching";
            "To rebuild partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why might additional swap space be required even if swap is never actually used?";

        `a`b`c`d!(
            "kdb+ reserves enough virtual memory to decompress entire vectors";
            "Compression duplicates every column";
            "The OS expands compressed files";
            "Memory mapping requires swap"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, which columns are often good candidates to leave uncompressed?";

        `a`b`c`d!(
            "Columns accessed very frequently by repeated queries";
            "Columns containing booleans";
            "Sparse columns";
            "Columns containing many repeated values"
        );

        `a
    );

    `question`answers`correct!(
        "Sorting a table before compression only improves compression for:";

        `a`b`c`d!(
            "The columns participating in the sort";
            "Every column equally";
            "Only timestamp columns";
            "Only enumerated columns"
        );

        `a
    );

    `question`answers`correct!(
        "Why do long vectors sometimes compress much better than expected?";

        `a`b`c`d!(
            "Compression reclaims unused precision in many values";
            "Longs are internally stored as ints";
            "They automatically become enumerations";
            "They use dictionary encoding"
        );

        `a
    );

    `question`answers`correct!(
        "Compression is most likely to improve overall performance when the application is limited by:";

        `a`b`c`d!(
            "Disk I/O bandwidth";
            "CPU throughput";
            "Memory allocation";
            "IPC latency"
        );

        `a
    );

    `question`answers`correct!(
        "For gzip compression, increasing the compression level primarily trades:";

        `a`b`c`d!(
            "CPU time for improved compression";
            "Memory for symbols";
            "Disk usage for enumeration";
            "IPC latency for joins"
        );

        `a
    );

    `question`answers`correct!(
        "Which compression algorithm was used for the benchmarked query-performance tests in the whitepaper?";

        `a`b`c`d!(
            "The kdb+ IPC compression algorithm";
            "gzip";
            "ZFS";
            "LZ4"
        );

        `a
    );

    `question`answers`correct!(
        "Random access to compressed data means:";

        `a`b`c`d!(
            "Only the required compressed blocks are decompressed";
            "Entire files must always be decompressed";
            "Compression is disabled during queries";
            "Only get can read compressed files"
        );

        `a
    );

    `question`answers`correct!(
        "Which benchmark showed the greatest benefit from compression under a cold OS cache?";

        `a`b`c`d!(
            "Selecting the entire table";
            "Hot-cache aggregations";
            "Hot-cache symbol lookups";
            "Small random reads"
        );

        `a
    );

    `question`answers`correct!(
        "Why did symbol-subset queries become slower as logical block size increased?";

        `a`b`c`d!(
            "More unnecessary data had to be decompressed";
            "Compression ratio decreased dramatically";
            "Memory mapping stopped working";
            "Enumeration overhead increased"
        );

        `a
    );

    `question`answers`correct!(
        "Why did CPU-intensive aggregations show a smaller relative slowdown than simple reads?";

        `a`b`c`d!(
            "Aggregation dominates total execution time, reducing the impact of decompression";
            "Aggregations bypass decompression";
            "Compression is disabled during aggregation";
            "Aggregations never touch disk"
        );

        `a
    );

    `question`answers`correct!(
        "When querying compressed vectors, memory is allocated for:";

        `a`b`c`d!(
            "The full decompressed vector, even if only part is ultimately used";
            "Only the returned rows";
            "Only the compressed bytes";
            "Only the selected columns"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, selecting compression settings should primarily be driven by:";

        `a`b`c`d!(
            "Expected workload and system characteristics";
            "Using the highest compression level available";
            "Matching OS page size";
            "Using identical settings for every column"
        );

        `a
    );

    `question`answers`correct!(
        "Why is scp recommended instead of IPC when simply moving compressed files between hosts?";

        `a`b`c`d!(
            "IPC would unnecessarily decompress and recompress the data";
            "IPC cannot transfer compressed files";
            "scp automatically increases compression";
            "IPC cannot transfer HDBs"
        );

        `a
    );

    `question`answers`correct!(
        "What is the principal conclusion of the benchmark section regarding compression?";

        `a`b`c`d!(
            "The optimal compression strategy depends on workload, hardware, and query patterns";
            "Compression should always be enabled";
            "Compression should never be used on HDBs";
            "The largest logical block size is always optimal"
        );

        `a
    )
 );
//====================================================================