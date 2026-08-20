//====================================================================
// MEDIUM
//====================================================================

.fundamental.dictionaries.addNewKeyViaJoin:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Adding A Key (,)";
    -1 "======================================";
    -1 "";
    -1 "Use , (join) to add a new key/value pair onto an existing dictionary using input: .inputs.dictionaries.medium.addNewKeyViaJoin";
    -1 "Input: ", -3!.inputs.dictionaries.medium`addNewKeyViaJoin;
    -1 "Expected Output: ", -3!.solutions.dictionaries.medium`addNewKeyViaJoin
 };

.fundamental.dictionaries.updateExistingKeyViaAmend:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Updating A Key (Amend)";
    -1 "======================================";
    -1 "";
    -1 "Use functional amend (@[d;k;:;v]) to overwrite the value at an existing key using input: .inputs.dictionaries.medium.updateExistingKeyViaAmend";
    -1 "Input: ", -3!.inputs.dictionaries.medium`updateExistingKeyViaAmend;
    -1 "Expected Output: ", -3!.solutions.dictionaries.medium`updateExistingKeyViaAmend
 };

.fundamental.dictionaries.eachOverDictValues:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Each Over A Dictionary";
    -1 "======================================";
    -1 "";
    -1 "Apply a function to a dictionary with each - it runs over the VALUES and gives back another dictionary with the same keys, using input: .inputs.dictionaries.medium.eachOverDictValues";
    -1 "Input: ", -3!.inputs.dictionaries.medium`eachOverDictValues;
    -1 "Expected Output: ", -3!.solutions.dictionaries.medium`eachOverDictValues
 };

.fundamental.dictionaries.dictToTableViaFlip:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - A Dictionary Is A Table Sideways";
    -1 "======================================";
    -1 "";
    -1 "Use flip on a dictionary of same-length lists to turn it into a genuine table - the standard table-is-a-flipped-dict-of-columns idiom, using input: .inputs.dictionaries.medium.dictToTableViaFlip";
    -1 "Input: ", -3!.inputs.dictionaries.medium`dictToTableViaFlip;
    -1 "Expected Output: ", -3!.solutions.dictionaries.medium`dictToTableViaFlip
 };
