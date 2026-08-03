//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxForeignKeys.hard:`fullCompoundFkBlock`fullRemoveKeysDef`fullLcEn`fullLcDpft`fullJoinSaveTables`fullCreatePart`ajInJoinSave`updateLinkColumn`aOverrideAttr`metaExecFilter`xbarAggQuery`symlinkCreateFunc`insertVsUpdateFk`twoColFkVsOneCol!
    (
    `question`answers`correct!(
        "Which block correctly builds t1 and t2 and then creates the compound foreign key t1fkey linking t2 to t1 on sym and exchange, matching the paper?";

        `a`b`c`d!(
            "t1:([sym:`A`B`C;ex:`NYSE`NYSE`NDQ];sharesInIssue:3?1000); t2:([]time:2?.z.T;sym:`A`B;exchange:`NYSE`NYSE;price:2?10.); update t1fkey:`t1$(t2[`sym],'t2[`exchange]) from `t2";
            "t1:([sym:`A`B`C;ex:`NYSE`NYSE`NDQ];sharesInIssue:3?1000); t2:([]time:2?.z.T;sym:`A`B;exchange:`NYSE`NYSE;price:2?10.); update t1fkey:`t1$(t2[`sym],t2[`exchange]) from `t2";
            "t1:([sym:`A`B`C;ex:`NYSE`NYSE`NDQ];sharesInIssue:3?1000); t2:([]time:2?.z.T;sym:`A`B;exchange:`NYSE`NYSE;price:2?10.); update t1fkey:`t2$(t1[`sym],'t1[`ex]) from `t1";
            "t1:([sym:`A`B`C;ex:`NYSE`NYSE`NDQ];sharesInIssue:3?1000); t2:([]time:2?.z.T;sym:`A`B;exchange:`NYSE`NYSE;price:2?10.); update t1fkey:t1?(t2[`sym],'t2[`exchange]) from `t2"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition correctly reproduces the removeKeys helper function used to strip foreign keys from every relevant column of a table x?";

        `a`b`c`d!(
            "removeKeys:{[x] v[i]:value each (v:value flip x)i:where not null(0!meta x)`f; flip (cols x)!v}";
            "removeKeys:{[x] v:value each value flip x; flip (cols x)!v}";
            "removeKeys:{[x] i:where null(0!meta x)`f; v[i]:value flip x; flip (cols x)!v}";
            "removeKeys:{[x] v[i]:value each (v:flip x)i:where not null(meta x)`f; flip (cols x)!v}"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition correctly reproduces .lc.en, the modified version of .Q.en that enumerates symbol columns against a custom-named sym file a instead of the default sym?";

        `a`b`c`d!(
            ".lc.en:{[d;a;x] if[not -11h=type a;'`$\"expected symbol parameter type for a\"]; @[x; cs@where 11h=type each x cs:key flip x; (` sv (hsym d),a)?] }";
            ".lc.en:{[d;a;x] @[x; cs@where 11h=type each x cs:key flip x; (hsym d)?] }";
            ".lc.en:{[d;x] if[not -11h=type d;'`$\"expected symbol parameter type for d\"]; @[x; cs@where 11h=type each x cs:key flip x; (` sv (hsym d),`sym)?] }";
            ".lc.en:{[d;a;x] @[x; where 20h=type each x; (` sv (hsym d),a)?] }"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition correctly reproduces .lc.dpft, the modified .Q.dpft that takes an extra alternative sym-file-name argument a?";

        `a`b`c`d!(
            ".lc.dpft:{[d;a;p;f;t] if[not all .Q.qm each r:flip .lc.en[d;a]`. t;'`unmappable]; {[d;t;i;x] @[d;x;:;t[x]i]}[d:.Q.par[d;p;t];r;iasc r f] each key r; @[;f;`p#]@[d;`.d;:;f,(r:key r) except f]; }";
            ".lc.dpft:{[d;p;f;t] if[not all .Q.qm each r:flip .Q.en[d]`. t;'`unmappable]; {[d;t;i;x] @[d;x;:;t[x]i]}[d:.Q.par[d;p;t];r;iasc r f] each key r; @[;f;`p#]@[d;`.d;:;f,(r:key r) except f]; }";
            ".lc.dpft:{[d;a;p;f;t] .Q.dpft[d;p;f;t]; .lc.en[d;a]`. t }";
            ".lc.dpft:{[d;a;p;f;t] if[not all .Q.qm each r:flip .lc.en[d;a]`. t;'`unmappable]; @[d:.Q.par[d;p;t];`.d;:;f,(r:key r) except f]; }"
        );

        `a
    );

    `question`answers`correct!(
        "In .lc.joinSaveTables, which line correctly force-loads only the sym and time columns of the remote table into memory before the as-of join?";

        `a`b`c`d!(
            "remoteTable set select sym,time from (get remoteFileHandle);";
            "remoteTable set get remoteFileHandle;";
            "remoteTable set select from (get remoteFileHandle) where sym=time;";
            "remoteTable: select sym,time from remoteFileHandle;"
        );

        `a
    );

    `question`answers`correct!(
        "In .lc.joinSaveTables, which line correctly performs the as-of join between baseTable and remoteTable, adding an id column from the remote side for later linking?";

        `a`b`c`d!(
            "baseTable set aj[ajCols; value baseTable; ?[value remoteTable; (); 0b; (ajCols!ajCols),(enlist `id)!enlist `i] ];";
            "baseTable set aj[ajCols; value remoteTable; value baseTable];";
            "baseTable set ?[value baseTable; (); 0b; (ajCols!ajCols),(enlist `id)!enlist `i];";
            "baseTable set lj[value baseTable; value remoteTable];"
        );

        `a
    );

    `question`answers`correct!(
        "Which line correctly builds the createPart master function, combining symlink creation and the join-and-save step for a given partition date?";

        `a`b`c`d!(
            ".lc.createPart:{[basePath;baseTable;remotePath;remoteTable;ajCols;dt] .lc.createSymLink[raze basePath,\"/\",string dt;raze remotePath,\"/\",string dt;remoteTable]; .lc.joinSaveTables[ajCols;basePath;dt;baseTable;remoteTable]; }";
            ".lc.createPart:{[basePath;baseTable;remotePath;remoteTable;ajCols;dt] .lc.joinSaveTables[ajCols;basePath;dt;baseTable;remoteTable]; .lc.createSymLink[basePath;remotePath;remoteTable]; }";
            ".lc.createPart:{[basePath;remotePath;ajCols;dt] .lc.createSymLink[basePath;remotePath;dt]; }";
            ".lc.createPart:{[basePath;baseTable;remotePath;remoteTable;ajCols;dt] .lc.joinSaveTables[ajCols;basePath;dt;baseTable;remoteTable]; }"
        );

        `a
    );

    `question`answers`correct!(
        "Which line correctly builds the link column on baseTable by matching each row's id against the remote table's row index i, as used in .lc.joinSaveTables?";

        `a`b`c`d!(
            "update link:remoteTable!(exec i from select i from value remoteTable)?id from baseTable;";
            "update link:remoteTable!id from baseTable;";
            "update link:baseTable!(exec i from value remoteTable)?id from remoteTable;";
            "update link:(exec i from value baseTable)?id from remoteTable!baseTable;"
        );

        `a
    );

    `question`answers`correct!(
        "In .lc.joinSaveTables, why does the code re-apply attributes to the in-memory remoteTable copy right after force-loading it, using a construct like ![remoteTable;();0b;a[`c]!{(#;enlist x;y)}.'flip value a:exec a,c from meta get remoteFileHandle where c in ajCols]?";

        `a`b`c`d!(
            "Because reading select sym,time from a splayed table drops any on-disk attributes (like sorted or parted), so they must be reapplied in memory for the as-of join to work correctly and efficiently";
            "Because attributes must be removed before an as-of join can run, and this line strips them";
            "Because the remote table's column names would otherwise clash with the base table's";
            "Because .Q.dpft requires all columns to have the grouped attribute before saving"
        );

        `a
    );

    `question`answers`correct!(
        "What does select a,c from meta get remoteFileHandle where c in ajCols extract, as used to determine which attributes to reapply?";

        `a`b`c`d!(
            "The attribute (a) and column name (c) metadata rows, restricted to only the columns used in the as-of join";
            "A count of rows in the remote table restricted to the ajCols columns";
            "The actual attribute values for every column in the remote table, regardless of ajCols";
            "A list of column names only, with attributes discarded"
        );

        `a
    );

    `question`answers`correct!(
        "Which query correctly reproduces the paper's aggregation over the linked trade/quote data, bucketing by sym and 10-minute windows?";

        `a`b`c`d!(
            "select size wavg price,bsize wavg bid,asize wavg ask by sym,10 xbar time.minute from select time,sym,size,price,link.ask,link.asize,link.bid,link.bsize from trade where date=max date";
            "select size wavg price,bsize wavg bid,asize wavg ask by sym,10 xbar time.hh from trade where date=max date";
            "select size wavg price by sym,10 xbar time.minute from trade lj quote where date=max date";
            "select avg price,avg bid,avg ask by sym from trade where date=max date, 10 xbar time.minute"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition of .lc.createSymLink correctly checks whether the symlink already exists before creating it with the Unix ln -s command?";

        `a`b`c`d!(
            ".lc.createSymLink:{[basePath;remotePath;rTab] remoteTablePath:remotePath,\"/\",rTab; baseTablePath:basePath,\"/\",rTab; if[not(`$rTab) in key hsym `$basePath; system \"ln -s \",remoteTablePath,\" \",baseTablePath]; }";
            ".lc.createSymLink:{[basePath;remotePath;rTab] system \"ln -s \",remotePath,\"/\",rTab,\" \",basePath,\"/\",rTab; }";
            ".lc.createSymLink:{[basePath;remotePath;rTab] if[(`$rTab) in key hsym `$basePath; system \"ln -s \",remotePath,\"/\",rTab,\" \",basePath,\"/\",rTab]; }";
            ".lc.createSymLink:{[remotePath;rTab] system \"ln -s \",remotePath,\"/\",rTab; }"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing `equityPositions insert (`A;200;2.;`financials!0) with a true foreign-key insert, what is the key syntactic/behavioral difference in how the last field is supplied?";

        `a`b`c`d!(
            "The linked-column insert supplies a raw domain-tagged index (`financials!0) directly with no lookup/validation, whereas a true foreign key would be enumerated automatically (e.g. via `financials$sym) and fail with a cast error on an unmapped value";
            "There is no difference; both are validated identically against the referenced table";
            "The linked-column insert requires the referenced table to be keyed, while foreign keys do not";
            "The linked-column insert only works with compound keys, never single-column ones"
        );

        `a
    );

    `question`answers`correct!(
        "Why does the paper's two-column foreign key example re-key exInfo first with exInfo:`sym`exID xkey 0!exInfo before creating exfKey with update exfKey:`exInfo$(trade[`sym],'trade[`exID]) from `trade?";

        `a`b`c`d!(
            "Because a compound foreign key must enumerate against a table keyed on the same combination of columns (sym and exID together), so exInfo must first be re-keyed on both before it can serve as that lookup domain";
            "Because 0!exInfo permanently deletes the sym column, requiring xkey to restore it";
            "Because xkey is required before any select statement can be run on exInfo";
            "Because trade must also be re-keyed on sym and exID before the update can run"
        );

        `a
    )
 );
//====================================================================