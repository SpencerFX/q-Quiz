//====================================================================
//
// q-Quiz
//
// Topic      : Compression
// Difficulty : Easy
//
// Based on the KX whitepaper "Compression"
//
//====================================================================
.quiz.compression.easy:`compressionPurpose`twoApproaches`streamCompression`setCompression`fieldCompression`compressionDefaults`readCompressed`automaticDecompression`logicalBlock`compressionRatio`sortingBenefit`booleanCompression`scpTransfer`compressionTradeoff`zdotzd`compressedQueries`cpuDisk`fieldDictionary`hotCache`coldCache!
    (
    `question`answers`correct!(
        "What is the primary goal of compression in kdb+?";

        `a`b`c`d!(
            "Reduce disk usage and potentially improve performance";
            "Increase symbol enumeration";
            "Reduce table count";
            "Replace partitioning"
        );

        `a
    );

    `question`answers`correct!(
        "How many high-level approaches does the whitepaper describe for saving compressed data?";

        `a`b`c`d!(
            "Two";
            "Three";
            "Four";
            "One"
        );

        `a
    );

    `question`answers`correct!(
        "Which syntax streams data directly from memory into compressed format?";

        `a`b`c`d!(
            "(`:file;block;alg;level) set table";
            "`:file set table";
            "get`:file";
            ".Q.dpft table"
        );

        `a
    );

    `question`answers`correct!(
        "Which q keyword is used to write compressed files?";

        `a`b`c`d!(
            "set";
            "save";
            "compress";
            "zip"
        );

        `a
    );

    `question`answers`correct!(
        "What allows different columns within the same table to use different compression settings?";

        `a`b`c`d!(
            "Field-by-field compression";
            "Column attributes";
            "Enumerations";
            "Partitioning"
        );

        `a
    );

    `question`answers`correct!(
        "Which variable stores the default compression parameters used by set?";

        `a`b`c`d!(
            ".z.zd";
            ".Q.zd";
            ".z.zip";
            ".Q.comp"
        );

        `a
    );

    `question`answers`correct!(
        "When reading compressed files, decompression is:";

        `a`b`c`d!(
            "Automatic and transparent";
            "Always manual";
            "Only available on Linux";
            "Only available using get"
        );

        `a
    );

    `question`answers`correct!(
        "What happens when a query touches compressed data?";

        `a`b`c`d!(
            "Required blocks are automatically decompressed";
            "The entire database is decompressed";
            "Nothing is decompressed";
            "The sym file is expanded"
        );

        `a
    );

    `question`answers`correct!(
        "What does the logical block size primarily control?";

        `a`b`c`d!(
            "How much data is compressed together";
            "The number of partitions";
            "The page size of the OS";
            "The number of columns"
        );

        `a
    );

    `question`answers`correct!(
        "Which factor strongly influences compression ratio?";

        `a`b`c`d!(
            "The nature of the data";
            "The number of namespaces";
            "The number of processes";
            "The number of CPUs"
        );

        `a
    );

    `question`answers`correct!(
        "According to the whitepaper, sorting highly repetitive data before compression often:";

        `a`b`c`d!(
            "Improves compression ratios";
            "Reduces query accuracy";
            "Disables compression";
            "Increases disk usage"
        );

        `a
    );

    `question`answers`correct!(
        "Which datatype generally compresses particularly well?";

        `a`b`c`d!(
            "Boolean";
            "GUID";
            "Timestamp";
            "Float"
        );

        `a
    );

    `question`answers`correct!(
        "If compressed files only need to be copied between machines, the whitepaper recommends using:";

        `a`b`c`d!(
            "scp";
            "IPC";
            "get";
            "set"
        );

        `a
    );

    `question`answers`correct!(
        "Compression usually involves trading:";

        `a`b`c`d!(
            "CPU time for reduced disk I/O";
            "Memory for CPU";
            "Threads for partitions";
            "Symbols for integers"
        );

        `a
    );

    `question`answers`correct!(
        "In field-by-field compression, which dictionary key specifies the default compression behavior?";

        `a`b`c`d!(
            "The null symbol (`)";
            "`default";
            "`all";
            "`*"
        );

        `a
    );

    `question`answers`correct!(
        "With frequently repeated queries and a hot OS cache, compressed data may:";

        `a`b`c`d!(
            "Perform worse due to repeated decompression";
            "Always outperform uncompressed data";
            "Never require decompression";
            "Automatically become uncompressed"
        );

        `a
    );

    `question`answers`correct!(
        "The benefit of compression is greatest when a system is bottlenecked by:";

        `a`b`c`d!(
            "Disk I/O";
            "CPU";
            "Network latency";
            "Memory allocation"
        );

        `a
    );

    `question`answers`correct!(
        "Which structure is used to specify field-by-field compression settings?";

        `a`b`c`d!(
            "A dictionary mapping columns to compression parameters";
            "A keyed table";
            "A namespace";
            "A list of symbols"
        );

        `a
    );

    `question`answers`correct!(
        "With a hot OS cache, simple queries on compressed data are often:";

        `a`b`c`d!(
            "Slower than uncompressed data";
            "Always faster";
            "Exactly the same speed";
            "Unable to execute"
        );

        `a
    );

    `question`answers`correct!(
        "With a cold OS cache, compression can improve performance because:";

        `a`b`c`d!(
            "Less data must be read from disk";
            "Queries skip decompression";
            "The CPU is idle";
            "No memory is allocated"
        );

        `a
    )
 );
//====================================================================