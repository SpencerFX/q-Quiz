//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxSymFile.medium:`ensArgs`dpftsArgs`ddShorthand`addcolFlow`enumFuncLogic`allpathsBase`ipcCopyLine`rsyncBackup`compactPathBuild`symTypeFilter`gcCall`countRatioCheck`fileLikeFilter!
    (
    `question`answers`correct!(
        "What do the three arguments to .Q.ens[dir;table;enum] represent?";

        `a`b`c`d!(
            "The directory to save into, the table to enumerate and splay, and the name of the domain to enumerate against (instead of the default sym)";
            "The directory, the domain, and the partition date";
            "The table, the column to enumerate, and the attribute to apply";
            "The sym file path, the backup path, and the table name"
        );

        `a
    );

    `question`answers`correct!(
        "What is the key difference in arguments between .Q.dpft and .Q.dpfts[directory;partition;`p#field;tablename;enum]?";

        `a`b`c`d!(
            ".Q.dpfts takes an extra final argument specifying which enum domain to use instead of the default sym";
            ".Q.dpfts does not require a partition argument";
            ".Q.dpfts requires the table to be keyed, unlike .Q.dpft";
            ".Q.dpfts omits the p#field argument"
        );

        `a
    );

    `question`answers`correct!(
        "The paper states .Q.dd is shorthand for which expression?";

        `a`b`c`d!(
            "(`)sv x,`$string y";
            "(`)sv x,y";
            "hsym x,y";
            "` sv x,`$y"
        );

        `a
    );

    `question`answers`correct!(
        "In dbmaint.q's addcol flow, what is the correct call order described in the paper?";

        `a`b`c`d!(
            "addcol checks the column name, then calls add1col with directory/column/default, which passes the default through enum for conditional enumeration";
            "addcol calls enum directly, then add1col checks the reserved-keyword list";
            "add1col calls addcol once per partition path found by allpaths";
            "enum is called first to validate the column name, then addcol runs add1col"
        );

        `a
    );

    `question`answers`correct!(
        "In the enum helper function from dbmaint.q, what does it do if the default value passed in is not of type symbol?";

        `a`b`c`d!(
            "It returns straight away without attempting any enumeration";
            "It signals a 'type error";
            "It converts the value to symbol first, then enumerates it";
            "It deletes the existing sym file"
        );

        `a
    );

    `question`answers`correct!(
        "In enum's use of .Q.dd, what operator is used to conditionally enumerate the default value back to the sym file on disk?";

        `a`b`c`d!(
            "? (Enum Extend)";
            "$ (Enum/Cast)";
            "! (Amend)";
            ", (Join)"
        );

        `a
    );

    `question`answers`correct!(
        "In the multithreaded allpaths function, what does files@:where files like\"[0-9]*\" do?";

        `a`b`c`d!(
            "Filters the list of files down to only those whose names start with a digit (i.e. partition directories)";
            "Filters files down to those with numeric extensions";
            "Removes all files with fewer than 9 characters in their name";
            "Sorts files numerically"
        );

        `a
    );

    `question`answers`correct!(
        "In allpaths, what does the recursive branch handling files like \"par.txt\" do?";

        `a`b`c`d!(
            "It handles the case where dbdir contains a par.txt file (a multi-partition setup), recursing into each listed partition directory";
            "It handles the case where the table is keyed and must be unkeyed first";
            "It handles the case where dbdir has no sym file and one must be created";
            "It handles the case where files contains compound (#) columns"
        );

        `a
    );

    `question`answers`correct!(
        "In the IPC copy example, what does the remote call h({`sym xasc select from trade where date=x};dt) do?";

        `a`b`c`d!(
            "Sends a function over the IPC handle h to db2, selecting and sym-sorting trade rows for date dt, and returns the result";
            "Opens a new handle to db2 for each date dt";
            "Writes the trade table for date dt directly to db1 over IPC";
            "Enumerates the trade table against db1's sym file remotely"
        );

        `a
    );

    `question`answers`correct!(
        "In the IPC copy example, why is .Q.en[`:db1] wrapped around the fetched data (with date removed) before saving?";

        `a`b`c`d!(
            "To enumerate the incoming symbol columns against db1's local sym file (updating it) before persisting the data as a new partition";
            "To remove the date column so the table can be keyed";
            "To compress the data before writing to disk";
            "To validate that db1 and db2 share an identical sym file"
        );

        `a
    );

    `question`answers`correct!(
        "In the backup helper that splays a table, enumerates it, and then runs system\"rsync db/sym \",backupdir, what does that rsync line achieve?";

        `a`b`c`d!(
            "Incrementally copies the updated sym file to the backup directory after the table has been splayed and enumerated";
            "Deletes the old backup before creating a new one";
            "Enumerates the sym file against the backup domain";
            "Compresses the sym file before copying it"
        );

        `a
    );

    `question`answers`correct!(
        "In the single-threaded rewrite, what does tableRoot:root,/:\"/\",/:tableNames construct, and why is ,/: (Join Each Right) used?";

        `a`b`c`d!(
            "It builds the full path string for each table under the date directory, joining each table name onto root; Join Each Right applies the join between one left value and each right value";
            "It builds a list of table names only, and ,/: removes duplicates";
            "It builds partition indices, with ,/: casting each to int";
            "It builds column paths, with ,/: enumerating each column"
        );

        `a
    );

    `question`answers`correct!(
        "What does types:type each get each files compute, and what is it used for immediately afterward?";

        `a`b`c`d!(
            "The type of each file's on-disk contents; used to filter down to only enumerated (type 20h) files with enumeratedFiles:files where types=20h";
            "The type of each column name; used to rename columns";
            "The file size of each file in bytes; used to sort files by size";
            "The attribute applied to each file; used to reapply the parted attribute after rewriting"
        );

        `a
    )
 );

