//====================================================================
// HARD
//====================================================================

.fundamental.dictionaries.mergeDictsUpsert:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Merging Two Dictionaries";
    -1 "======================================";
    -1 "";
    -1 "Join two dictionaries together with , - it's an upsert, so an overlapping key takes the RIGHT-hand dictionary's value, using input: .inputs.dictionaries.hard.mergeDictsUpsert";
    -1 "Input: ", -3!.inputs.dictionaries.hard`mergeDictsUpsert;
    -1 "Expected Output: ", -3!.solutions.dictionaries.hard`mergeDictsUpsert
 };

.fundamental.dictionaries.nestedDictAccess:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - A Dictionary Of Dictionaries";
    -1 "======================================";
    -1 "";
    -1 "Look up a value two levels deep in a dictionary whose values are themselves dictionaries using input: .inputs.dictionaries.hard.nestedDictAccess";
    -1 "Input: ", -3!.inputs.dictionaries.hard`nestedDictAccess;
    -1 "Expected Output: ", -3!.solutions.dictionaries.hard`nestedDictAccess
 };

.fundamental.dictionaries.tableRowAsDict:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - A Table Row Is A Dictionary";
    -1 "======================================";
    -1 "";
    -1 "Index a table by row number to get that row back as a dictionary keyed by column name - the mirror image of flip, using input: .inputs.dictionaries.hard.tableRowAsDict";
    -1 "Input: ", -3!.inputs.dictionaries.hard`tableRowAsDict;
    -1 "Expected Output: ", -3!.solutions.dictionaries.hard`tableRowAsDict
 };
