//====================================================================
//
// q-Quiz
//
// Topic      : DBMaint — Hard
// Difficulty : Hard
//
//====================================================================
.quiz.syntaxDbMaint.hard:`dotDConsistency`partitionPathResolution`partitionDirectoryFiltering`columnFileValidation`symbolDomainHandling`compressionPreservation`fnColNoOpOptimization`renameNestedColumnFiles`copyNestedColumnFiles`missingColumnReconstruction`reorderAfterRepair`reorderValidation`partitionSchemaConsistency`partitionedColumnMutation`rowCountFromDotD`deleteNestedColumnFiles`compressionDefault`compressionParameterHandling`renameSameTable`renameDestinationValidation`listColsPartitioned`flatTableDotDCheck`persistedColumnReorder`missingColumnRepair!
    (
    `question`answers`correct!(
        "A table is stored as a partitioned table and exists in every partition, but one partition has a different .d column ordering. Which DBMaint health check is specifically designed to detect this inconsistency?";

        `a`b`c`d!(
            "`checkTabExistence`, because it compares the table directory across partitions";
            "`checkColFiles`, because it verifies that .d matches the column files inside each partition";
            "`checkDotDEquality`, because it compares the contents of the .d files across partitions";
            "`listCols`, because it reads the final partition and detects the differing schema"
        );

        `c
    );

    `question`answers`correct!(
        "What does `getTableType` return when the table name is not directly present in the database root but represents a partitioned/splayed table discovered through partition paths?";

        `a`b`c`d!(
            "`flat`, because all partitioned tables are represented as flat tables internally";
            "`splayed`, because partition paths always point to splayed tables";
            "`partOrMissing`, because the table is expected to exist under partition directories";
            "`segmented`, because the table is not present at the database root"
        );

        `c
    );

    `question`answers`correct!(
        "In `buildTablePaths`, why are database-root entries matching `\"*$\"` removed before table paths are constructed?";

        `a`b`c`d!(
            "They are temporary files that cannot contain columns";
            "They represent directories ending in `$`, which DBMaint intentionally ignores when discovering partitions";
            "They are compressed column files and must be handled separately";
            "They are symbol-domain directories and would otherwise be enumerated twice"
        );

        `b
    );

    `question`answers`correct!(
        "A splayed table's `.d` file contains `time`, `sym`, and `price`, but the directory also contains `debug` and `price#`. What does `check1ColFiles` do with these entries?";

        `a`b`c`d!(
            "It treats both as ordinary unknown columns";
            "It treats `price#` as a valid ordinary column and reports only `debug`";
            "It recognizes `price#` as an associated list-column file and only reports it if its base column is not represented correctly in `.d`";
            "It deletes both files automatically"
        );

        `c
    );

    `question`answers`correct!(
        "Why does DBMaint's `addCol` convert a symbol default using `.Q.dd[db;domain]?default` when `11h=abs type default`?";

        `a`b`c`d!(
            "To convert the symbol into a string before writing it";
            "To enumerate the new symbol column against the requested symbol domain";
            "To determine whether the table is partitioned";
            "To preserve the existing column attribute"
        );

        `b
    );

    `question`answers`correct!(
        "Suppose a persisted column has compression metadata. Which implementation detail allows `fnCol` to avoid silently losing the existing compression configuration when rewriting the column?";

        `a`b`c`d!(
            "It always rewrites the column uncompressed";
            "It calls `.Q.en` before applying the function";
            "It retrieves the existing compression parameters with `getCompParam` and passes them to `set`";
            "It copies the column first and deletes the original"
        );

        `c
    );

    `question`answers`correct!(
        "What is the purpose of the comparison in `fn1Col`: `if[$[oldAttr~newAttr;not oldVal~newVal;1b]; ...]`?";

        `a`b`c`d!(
            "To ensure the function is unary";
            "To avoid rewriting the column when neither its attribute nor its values changed";
            "To force the column to retain its original type";
            "To determine whether the column is partitioned"
        );

        `b
    );

    `question`answers`correct!(
        "When `rename1Col` renames a column in a splayed table, why does it separately check for files named with `#` and `##` suffixes?";

        `a`b`c`d!(
            "They are compression headers that must be regenerated";
            "They are temporary files created by `rename`";
            "They can represent associated list-column files and therefore must also be renamed";
            "They are symbol-domain files shared by all columns"
        );

        `c
    );

    `question`answers`correct!(
        "When `copy1Col` copies a column that has associated `#` or `##` files, what does DBMaint do?";

        `a`b`c`d!(
            "It copies only the primary column file and ignores the associated files";
            "It copies the primary column and corresponding `#`/`##` files when they exist, then adds the destination column to `.d`";
            "It converts the column to a flat table before copying";
            "It copies the `.d` file instead of the column data"
        );

        `b
    );

    `question`answers`correct!(
        "Why does `addMissingCols` use the good table directory as the source of both the missing column's default value and compression parameters?";

        `a`b`c`d!(
            "The good directory provides a representative column value and its on-disk compression configuration";
            "The good directory determines the database partitioning field";
            "The good directory contains the sym file for every missing column";
            "The good directory is used only to determine the table name"
        );

        `a
    );

    `question`answers`correct!(
        "Consider `add1MissingCols`. After adding missing columns, why does it call `reorder1Cols[tdir;goodCols]`?";

        `a`b`c`d!(
            "To sort the newly added columns alphabetically";
            "To make the repaired partition's `.d` column ordering match the reference partition";
            "To remove duplicate columns from the partition";
            "To compress the newly added columns"
        );

        `b
    );

    `question`answers`correct!(
        "A caller invokes `reorderCols` on a flat table with a column ordering that contains a symbol not currently present. What happens before the table is rewritten?";

        `a`b`c`d!(
            "The unknown column is automatically added with null values";
            "The requested order is passed directly to `xcols`";
            "`verifyReorderCols` raises an error because every requested column must already exist";
            "Only the known columns are retained silently"
        );

        `c
    );

    `question`answers`correct!(
        "Which statement best describes the difference between `checkColFiles` and `checkDotDEquality` for a partitioned table?";

        `a`b`c`d!(
            "`checkColFiles` compares `.d` files between partitions, while `checkDotDEquality` checks individual column files";
            "`checkColFiles` validates each table directory against its own `.d`; `checkDotDEquality` compares `.d` contents across partitions";
            "They are aliases and perform exactly the same validation";
            "`checkColFiles` only works on flat tables, while `checkDotDEquality` only works on splayed tables"
        );

        `b
    );

    `question`answers`correct!(
        "Why does `addCol` use `add1Col` on each partition rather than loading the complete partitioned table into memory and writing it back?";

        `a`b`c`d!(
            "Because partitioned tables cannot be loaded into memory";
            "Because DBMaint performs filesystem-level column changes, allowing the new column file to be created with the appropriate row count and compression without rewriting the whole table";
            "Because `.d` files cannot be modified after a table is loaded";
            "Because `set` cannot write tables containing existing columns"
        );

        `b
    );

    `question`answers`correct!(
        "What happens when `add1Col` determines the row count for a splayed table?";

        `a`b`c`d!(
            "It reads the row count from `.d`";
            "It uses the count of the first column listed in `.d`";
            "It assumes every partition contains exactly 1000 rows";
            "It calculates the row count from the number of files in the directory"
        );

        `b
    );

    `question`answers`correct!(
        "A column is deleted using `del1Col`. Why does the implementation explicitly check for `<column>#` and `<column>##` after deleting the primary column file?";

        `a`b`c`d!(
            "To remove associated list-column files that otherwise remain orphaned on disk";
            "To remove compression metadata from the `.d` file";
            "To remove the column from the sym file";
            "To reset the table's partitioning attribute"
        );

        `a
    );

    `question`answers`correct!(
        "What does `getCompParam` return when `-21!path` does not provide compression metadata?";

        `a`b`c`d!(
            "The path itself";
            "`0 0 0i`";
            "`0 0 0f`";
            "An empty dictionary"
        );

        `b
    );

    `question`answers`correct!(
        "Why does `addTab` treat a `compparam` dictionary differently from an integer compression vector?";

        `a`b`c`d!(
            "The dictionary is converted to a symbol domain";
            "A dictionary is passed directly to `set`, while a compression vector is wrapped in an enlist where required by the `set` syntax";
            "The dictionary disables compression";
            "The vector applies only to symbol columns"
        );

        `b
    );

    `question`answers`correct!(
        "A caller attempts `renameTab[db;`trade;`trade]`. What is the intended DBMaint behavior?";

        `a`b`c`d!(
            "It silently succeeds because the source and destination are identical";
            "It deletes the table and recreates it";
            "It raises an error because the new table name must differ from the old name";
            "It copies the table instead"
        );

        `c
    );

    `question`answers`correct!(
        "Why does `renameTab` check whether the destination name already exists before performing the filesystem rename?";

        `a`b`c`d!(
            "To prevent overwriting an existing kdb+ object at the destination";
            "To determine the table's compression parameters";
            "To determine whether the source table is partitioned";
            "To populate the destination `.d` file"
        );

        `a
    );

    `question`answers`correct!(
        "Which statement best describes `listCols` for a partitioned table?";

        `a`b`c`d!(
            "It merges the `.d` files from every partition";
            "It considers only the latest partition when determining the column names";
            "It always reads the first partition";
            "It only works on flat tables"
        );

        `b
    );

    `question`answers`correct!(
        "Why can `checkDotDEquality` legitimately return `1b` even when the database contains a flat table?";

        `a`b`c`d!(
            "Because it converts flat tables into partitioned tables before checking";
            "Because it only performs its comparison for `partOrMissing` tables and returns `0b` otherwise";
            "Because flat tables always have identical `.d` files";
            "Because `.d` is generated dynamically for flat tables"
        );

        `b
    );

    `question`answers`correct!(
        "Which operation is most directly analogous to applying `xcol` to an in-memory table, but for persisted data?";

        `a`b`c`d!(
            "`dbmaint.renameCol`";
            "`dbmaint.fnCol`";
            "`dbmaint.reorderCols`";
            "`dbmaint.addMissingCols`"
        );

        `c
    );

    `question`answers`correct!(
        "A partitioned table has a missing column in one partition. Which DBMaint function is specifically designed to repair the missing schema using another table directory as the reference?";

        `a`b`c`d!(
            "`copyCol`";
            "`addMissingCols`";
            "`checkDotDEquality`";
            "`reorderCols`"
        );

        `b
    )
    );