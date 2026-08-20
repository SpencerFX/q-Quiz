//====================================================================
//
// fundamentals - Dictionaries - Question Functions
//
// Auto-generated from .inputs.dictionaries.easy/medium/hard config.
// Each function prints the exercise header/description and the
// input for that question, pulled from the corresponding input and
// solution banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.dictionaries.createDict:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Create (!)";
    -1 "======================================";
    -1 "";
    -1 "Build a dictionary from a list of keys and a list of values using ! using input: .inputs.dictionaries.easy.createDict";
    -1 "Input: ", -3!.inputs.dictionaries.easy`createDict;
    -1 "Expected Output: ", -3!.solutions.dictionaries.easy`createDict
 };

.fundamental.dictionaries.lookupByKey:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Lookup By Key";
    -1 "======================================";
    -1 "";
    -1 "Index a dictionary by one of its keys to get the value back using input: .inputs.dictionaries.easy.lookupByKey";
    -1 "Input: ", -3!.inputs.dictionaries.easy`lookupByKey;
    -1 "Expected Output: ", -3!.solutions.dictionaries.easy`lookupByKey
 };

.fundamental.dictionaries.getKeysAndValues:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Key And Value";
    -1 "======================================";
    -1 "";
    -1 "Use key and value to pull the keys and the values back out of a dictionary as two separate lists, using input: .inputs.dictionaries.easy.getKeysAndValues";
    -1 "Input: ", -3!.inputs.dictionaries.easy`getKeysAndValues;
    -1 "Expected Output: ", -3!.solutions.dictionaries.easy`getKeysAndValues
 };

.fundamental.dictionaries.missingKeyLookup:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Dictionaries - Looking Up A Missing Key";
    -1 "======================================";
    -1 "";
    -1 "Index a dictionary with a key that isn't in it - this does NOT error, it gives back a typed null - using input: .inputs.dictionaries.easy.missingKeyLookup";
    -1 "Input: ", -3!.inputs.dictionaries.easy`missingKeyLookup;
    -1 "Expected Output: ", -3!.solutions.dictionaries.easy`missingKeyLookup
 };
