//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxForeignKeys.medium:`compoundFkCreate`eachBothJoin`compoundInsertSyntax`complexFkInitTable`removeKeysFunc`metaFColumn`tsCompareLj`compoundDotChain`onDiskLinkSet`dDotFileUpdate`compoundLinkOnDisk`cLink2Reload!
    (
    `question`answers`correct!(
        "What does update t1fkey:`t1$(t2[`sym],'t2[`exchange]) from `t2 create, and why are two columns combined before the enumeration?";

        `a`b`c`d!(
            "A compound foreign key from t2 to t1 based on the combination of sym and exchange together, since a single-column key can't distinguish rows that share a sym but differ in exchange";
            "Two separate single-column foreign keys, one for sym and one for exchange";
            "A new table t1fkey containing only the sym and exchange columns";
            "A left join between t2 and t1 on sym and exchange"
        );

        `a
    );

    `question`answers`correct!(
        "In t2[`sym],'t2[`exchange], what does the ,' (Each Both / Join Each) operator do compared to a plain , (Join)?";

        `a`b`c`d!(
            "Joins the two columns element-by-element into pairs (one pair per row), rather than concatenating them into one long combined list";
            "Joins the two columns into one long list, identical to plain Join";
            "Filters out rows where sym and exchange are equal";
            "Sorts the combined result before returning it"
        );

        `a
    );

    `question`answers`correct!(
        "What does `t2 insert (.z.T;`C;`NDQ;4.05;`t1$`C`NDQ) do for the compound-foreign-keyed table t2?";

        `a`b`c`d!(
            "Inserts a new row, enumerating the sym/exchange pair `C`NDQ against t1 to populate the compound foreign-key column";
            "Inserts a row without any foreign-key mapping, leaving t1fkey null";
            "Inserts a row directly into t1 rather than t2";
            "Fails because compound foreign keys cannot be inserted this way"
        );

        `a
    );

    `question`answers`correct!(
        "Which table definition correctly initializes a table with a complex (compound) foreign key column t1fkey from the outset?";

        `a`b`c`d!(
            "t2:([]time:`time$();sym:`$();exchange:`$();price:`float$(); t1fkey:`t1$())";
            "t2:([]time:`time$();sym:`t1$();exchange:`t1$();price:`float$(); t1fkey:`int$())";
            "t2:([t1fkey:`t1$()] time:`time$();sym:`$();exchange:`$();price:`float$())";
            "t2:([]time:`time$();sym:`$();exchange:`$();price:`float$(); t1fkey:())"
        );

        `a
    );

    `question`answers`correct!(
        "In the removeKeys function v[i]:value each (v:value flip x)i:where not null(0!meta x)`f; flip (cols x)!v, what does where not null(0!meta x)`f identify?";

        `a`b`c`d!(
            "The indices of columns in x that have a non-null f (foreign-key domain) entry in their metadata, i.e. the foreign-key columns";
            "The indices of columns that contain any null values in their data";
            "The indices of columns with a parted or sorted attribute applied";
            "The indices of all key columns in table x"
        );

        `a
    );

    `question`answers`correct!(
        "In removeKeys, what does value each (v:value flip x)i do once i (the foreign-key column indices) has been found?";

        `a`b`c`d!(
            "Applies value to each of those columns, replacing the foreign-key enumeration with the plain underlying integer/value list";
            "Deletes those columns from the flipped table entirely";
            "Casts those columns to type long";
            "Re-enumerates those columns against a fresh domain"
        );

        `a
    );

    `question`answers`correct!(
        "In meta output showing t1fkey| i t1, what do the i and t1 entries in the f (foreign key) column represent?";

        `a`b`c`d!(
            "i is the underlying storage type (int, holding row indices) and t1 is the name of the table this column is a foreign key into";
            "i means the column is indexed, and t1 is a comment string";
            "i is the column's attribute and t1 is its default value";
            "i is the row count and t1 is the key column name"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing \\ts select time,sym,exSym from trade lj exInfo against \\ts select time,sym,sym.exSym from trade (after sym has been enumerated as a foreign key), what does the \\ts prefix report in each case?";

        `a`b`c`d!(
            "The time taken and memory used to evaluate the query that follows it";
            "The number of rows returned and the number of columns";
            "The time zone and session ID of the query";
            "A trace of every intermediate step in query evaluation"
        );

        `a
    );

    `question`answers`correct!(
        "What does select time,sym,sym.exchangeID.ex from trade do, given exchangeID is itself a foreign key on financials pointing to exchange?";

        `a`b`c`d!(
            "Follows the foreign key chain from trade's sym through financials' exchangeID column into the exchange table's ex column, in one compound dot expression";
            "Selects three unrelated columns named sym, exchangeID and ex from trade directly";
            "Performs two separate left joins and concatenates their results";
            "Fails, since dot notation can only chain through a single foreign key"
        );

        `a
    );

    `question`answers`correct!(
        "What does `:db/t/cLink set `companyInfo!(companyInfo`sym)?(t`sym) do?";

        `a`b`c`d!(
            "Creates and saves a new on-disk column cLink under table t, linking each row of t to the matching row in companyInfo via a sym lookup";
            "Renames the sym column in t to cLink";
            "Deletes the existing companyInfo table from disk";
            "Loads companyInfo into memory under the variable name cLink"
        );

        `a
    );

    `question`answers`correct!(
        "What does .[`:db/t/.d;();,;`cLink] do after cLink has been written to disk as a new column file?";

        `a`b`c`d!(
            "Amends the on-disk .d column-order file for table t, appending `cLink so the table structure recognizes the new column";
            "Deletes the .d file for table t";
            "Compresses the .d file using the cLink algorithm";
            "Creates a brand-new .d file containing only cLink"
        );

        `a
    );

    `question`answers`correct!(
        "What does `:db/t/cLink2 set `companyInfo!(flip companyInfo`sym`exchange)?flip t`sym`ex do differently from the single-column cLink example?";

        `a`b`c`d!(
            "It links t to companyInfo based on matching sym AND exchange together, by flipping both column pairs into lists of pairs before searching";
            "It links t to companyInfo using only the exchange column, ignoring sym";
            "It creates two separate single-column links, cLink and cLink2";
            "It performs the link entirely in memory without writing anything to disk"
        );

        `a
    )
 );