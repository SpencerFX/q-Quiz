//====================================================================
//
// q-Quiz
//
// Topic      : dbmaint — Database Maintenance
// Difficulty : Medium
//
// Reference  : KxSystems/dbmaint
//
//====================================================================
.quiz.syntaxDbMaint.medium:`checkColFiles`checkColFilesFlat`checkDotDEquality`checkDotDEqualityScope`getTableType`getTableTypeMissing`buildTablePathsDollar`buildTablePathsPar`buildTablePathsDates`buildTablePathsPattern`isValidName`getName`addTabFlat`addTabSplayed`addTabPart`addColEnum`addColExisting`addColDefaults`delColPersisted`reorderColsFlat`reorderColsPart`fnColDates`castColString`setAttrFnCol`rmAttrDelegate`addMissingColsScope`addMissingColsGoodTdir`listColsFlat`getCompParamDefault`getCompParamInspect`flatCompression`checkPathsCommon`checkTablePathsExist`renameTabSame`renameTabPaths`copyColValidation`fnColPeach!
    (
    `question`answers`correct!(
        "What does checkColFiles verify for a non-flat table?";

        `a`b`c`d!(
            "That the table's .d column list agrees with the column files present in the table directory";
            "That all columns have the same datatype";
            "That every partition contains the same number of rows";
            "That the table has a valid partitioned attribute"
        );

        `a
    );

    `question`answers`correct!(
        "What does checkColFiles return immediately when the table type is `flat?";

        `a`b`c`d!(
            "0b";
            "1b";
            "`flat";
            "It signals a 'flat error"
        );

        `a
    );

    `question`answers`correct!(
        "What problem does checkDotDEquality detect for a partitioned table?";

        `a`b`c`d!(
            "Different partitions having different `.d` column-order files";
            "A missing sym file";
            "Different compression algorithms between columns";
            "Duplicate rows across partitions"
        );

        `a
    );

    `question`answers`correct!(
        "Why does checkDotDEquality only operate when getTableType returns `partOrMissing?";

        `a`b`c`d!(
            "Because `.d` consistency is relevant to partitioned table paths, not flat or ordinary splayed-root tables";
            "Because `.d` files exist only for flat tables";
            "Because splayed tables cannot contain columns";
            "Because `partOrMissing` means the table is compressed"
        );

        `a
    );

    `question`answers`correct!(
        "How does getTableType distinguish a flat table from a splayed table when the table name exists directly in the database root?";

        `a`b`c`d!(
            "It compares the database directory keys with the keys of the table's .Q.dd path";
            "It checks whether the table has a `.d` file";
            "It checks whether the table has a `p# attribute";
            "It checks whether the table contains a symbol column"
        );

        `a
    );

    `question`answers`correct!(
        "What does getTableType return when the table name is not present directly in the database root?";

        `a`b`c`d!(
            "`partOrMissing";
            "`flat";
            "`splayed";
            "`missing"
        );

        `a
    );

    `question`answers`correct!(
        "What does buildTablePaths ignore when discovering partition directories?";

        `a`b`c`d!(
            "Directories whose names end in `$`";
            "Directories whose names begin with digits";
            "All directories containing a `.d` file";
            "The `par.txt` file"
        );

        `a
    );

    `question`answers`correct!(
        "What happens when buildTablePaths finds a `par.txt` file?";

        `a`b`c`d!(
            "It uses the paths described by par.txt rather than simply discovering numeric partition directories";
            "It signals a 'par error";
            "It ignores the database entirely";
            "It treats par.txt as a table directory"
        );

        `a
    );

    `question`answers`correct!(
        "What is the purpose of the optional dates argument to buildTablePaths?";

        `a`b`c`d!(
            "To restrict the generated table paths to the supplied dates";
            "To change the partitioning column";
            "To convert dates to timestamps";
            "To create missing partitions for those dates"
        );

        `a
    );

    `question`answers`correct!(
        "Why does buildTablePaths filter database keys using the pattern \"[0-9]*\"?";

        `a`b`c`d!(
            "To identify partition directories whose names begin with digits";
            "To identify all symbol files";
            "To identify splayed tables";
            "To identify compressed columns"
        );

        `a
    );

    `question`answers`correct!(
        "What does isValidName test in addition to checking .Q.id normalization?";

        `a`b`c`d!(
            "That the name is not a reserved name found in key`.q";
            "That the name exists in the sym file";
            "That the name is a valid partition date";
            "That the name is not a splayed table"
        );

        `a
    );

    `question`answers`correct!(
        "What does getName do when isValidName returns false?";

        `a`b`c`d!(
            "Signals an 'Invalid name error";
            "Automatically fixes the name";
            "Returns the original name unchanged";
            "Creates the name in the database"
        );

        `a
    );

    `question`answers`correct!(
        "In addTab, what happens when tabletype is `flat?";

        `a`b`c`d!(
            "The table is written directly to the database root and the function returns without creating partition paths";
            "The table is written to every numeric partition";
            "A `.d` file is created manually for each partition";
            "The table is always written as a splayed table"
        );

        `a
    );

    `question`answers`correct!(
        "For addTab with tabletype `splayed, which path is used as the target table directory?";

        `a`b`c`d!(
            ".Q.dd[db;tname]";
            "buildTablePaths[db;tname]";
            "db,`par.txt";
            ".Q.dd[db;`.d]"
        );

        `a
    );

    `question`answers`correct!(
        "For addTab with tabletype `partOrMissing, what paths does it target?";

        `a`b`c`d!(
            "Partition table paths returned by buildTablePaths that do not already exist";
            "Only the database root";
            "Only the first partition";
            "Every existing splayed table directory"
        );

        `a
    );

    `question`answers`correct!(
        "Why does addCol convert a symbol default using the sym domain before writing it?";

        `a`b`c`d!(
            "To ensure the default value is represented consistently with the table's symbol enumeration domain";
            "To convert every symbol to a string";
            "To sort the symbol domain";
            "To remove the symbol from the sym file"
        );

        `a
    );

    `question`answers`correct!(
        "What does addCol do if the target table is flat and the requested column already exists?";

        `a`b`c`d!(
            "It signals an error rather than overwriting the existing column";
            "It replaces the existing column with the default";
            "It silently skips the column";
            "It renames the existing column"
        );

        `a
    );

    `question`answers`correct!(
        "Why does addCol use (count tab)#enlist default for a flat table?";

        `a`b`c`d!(
            "To create one default value for every existing row";
            "To create one default value for every partition";
            "To create one default value for every column";
            "To create a single scalar column"
        );

        `a
    );

    `question`answers`correct!(
        "What is the main difference between delCol on a flat table and on a persisted splayed/partitioned table?";

        `a`b`c`d!(
            "A flat table is rewritten as a whole, while persisted tables have the relevant column file removed from each applicable table directory";
            "Flat tables use .d files while persisted tables do not";
            "Only flat tables support column deletion";
            "Persisted tables require the entire database to be rewritten"
        );

        `a
    );

    `question`answers`correct!(
        "What does reorderCols verify before modifying a flat table?";

        `a`b`c`d!(
            "That the requested column ordering is valid for the table's existing columns";
            "That every partition has the same row count";
            "That the table contains a sym column";
            "That the requested order contains every database table"
        );

        `a
    );

    `question`answers`correct!(
        "When reorderCols operates on a partitioned table, what additional consistency is checked?";

        `a`b`c`d!(
            "The requested order is checked against the `.d` files of the relevant partitions";
            "Every partition is converted to a flat table";
            "The sym file is rebuilt";
            "All partitions are copied into memory"
        );

        `a
    );

    `question`answers`correct!(
        "What does fnCol do with an optional fifth argument?";

        `a`b`c`d!(
            "It can restrict the operation to specified date partitions";
            "It specifies a second column to modify";
            "It specifies the compression algorithm";
            "It changes the table type"
        );

        `a
    );

    `question`answers`correct!(
        "What does castCol do internally when the requested type is the string \"string\"?";

        `a`b`c`d!(
            "It uses the string function rather than treating \"string\" as a q type cast";
            "It enumerates the column against `sym";
            "It converts the column to symbol";
            "It removes the column"
        );

        `a
    );

    `question`answers`correct!(
        "Which operation does setAttr ultimately delegate to for each affected partition?";

        `a`b`c`d!(
            "fnCol";
            "addCol";
            "copyCol";
            "getTableType"
        );

        `a
    );

    `question`answers`correct!(
        "How does rmAttr differ from setAttr at the implementation level?";

        `a`b`c`d!(
            "rmAttr calls setAttr with an empty attribute specification";
            "rmAttr deletes the column before calling setAttr";
            "rmAttr only works on flat tables";
            "rmAttr changes the table type to `flat"
        );

        `a
    );

    `question`answers`correct!(
        "Why is addMissingCols restricted to `partOrMissing tables?";

        `a`b`c`d!(
            "It is intended to repair missing column files across partitions of a partitioned table";
            "Flat tables cannot have columns";
            "Splayed tables do not support `.d` files";
            "Only partitioned tables can contain symbols"
        );

        `a
    );

    `question`answers`correct!(
        "What does the goodTdir argument to addMissingCols represent?";

        `a`b`c`d!(
            "A table directory known to contain the complete set of columns";
            "The database root directory";
            "The sym file directory";
            "A directory containing only missing columns"
        );

        `a
    );

    `question`answers`correct!(
        "How does listCols handle a flat table differently from a splayed table?";

        `a`b`c`d!(
            "For a flat table it obtains columns from the in-memory table; for a splayed table it obtains them from the persisted table metadata";
            "For a flat table it reads `.d`; for a splayed table it reads the sym file";
            "It only works on flat tables";
            "It always scans every partition into memory"
        );

        `a
    );

    `question`answers`correct!(
        "What does getCompParam return when the target path has no compression metadata?";

        `a`b`c`d!(
            "0 0 0i";
            "0b";
            "`none";
            "A null dictionary"
        );

        `a
    );

    `question`answers`correct!(
        "What does getCompParam inspect to obtain compression information?";

        `a`b`c`d!(
            "The result of -21! applied to the path";
            "The `.d` file";
            "The sym file";
            "The partition date"
        );

        `a
    );

    `question`answers`correct!(
        "Why does dbmaint preserve compression parameters when rewriting an existing flat table?";

        `a`b`c`d!(
            "So rewriting the table does not unnecessarily discard its existing compression settings";
            "Because flat tables cannot be written without compression";
            "Because compression determines the table's column names";
            "Because compression is required to create `.d` files"
        );

        `a
    );

    `question`answers`correct!(
        "What does checkPathsCommon return when all requested paths satisfy the supplied check?";

        `a`b`c`d!(
            "The original paths";
            "An empty list";
            "1b";
            "The database root"
        );

        `a
    );

    `question`answers`correct!(
        "How are checkTablePathsExist and checkTablePathsNotExist related to checkPathsCommon?";

        `a`b`c`d!(
            "They are specialized versions using opposite existence checks";
            "They are unrelated functions";
            "They only validate column names";
            "They are aliases for getTableType"
        );

        `a
    );

    `question`answers`correct!(
        "What happens when renameTab is asked to rename a table to the same name?";

        `a`b`c`d!(
            "It signals 'New table name must be different from old table name";
            "It silently succeeds";
            "It deletes the table";
            "It copies the table under the same name"
        );

        `a
    );

    `question`answers`correct!(
        "For a persisted table, why does renameTab check both the source and destination paths before renaming?";

        `a`b`c`d!(
            "It verifies the source exists and the destination does not already contain a conflicting object";
            "It determines which compression algorithm to use";
            "It converts the table into a splayed table first";
            "It checks that the table is keyed"
        );

        `a
    );

    `question`answers`correct!(
        "What does copyCol prevent before copying a column?";

        `a`b`c`d!(
            "The source and destination column names being identical, and the destination already existing";
            "The source column being a symbol column";
            "The destination table being partitioned";
            "The source table containing a `.d` file"
        );

        `a
    );

    `question`answers`correct!(
        "Why does fnCol use peach for persisted table operations?";

        `a`b`c`d!(
            "The column transformation can be applied independently to multiple persisted partition paths";
            "peach is required to cast q symbols";
            "peach converts a table into a flat table";
            "peach is needed to create `.d` files"
        );

        `a
    )
    );