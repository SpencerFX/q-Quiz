//====================================================================
//
// fundamentals - Foreign Keys - Question Functions
//
// Auto-generated from .inputs.foreignKeys.easy/medium/hard config.
// Each function prints the exercise header/description and the
// input for that question, pulled from the corresponding input and
// solution banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.foreignKeys.createForeignKey:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Creating One";
    -1 "======================================";
    -1 "";
    -1 "A foreign key is an enumeration whose domain is a KEYED table - update a table's sym column to be enumerated against .fk.sectorRef using input: .inputs.foreignKeys.easy.createForeignKey";
    -1 "Input: ", -3!.inputs.foreignKeys.easy`createForeignKey;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.easy`createForeignKey
 };

.fundamental.foreignKeys.metaShowsForeignKey:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Meta Shows It";
    -1 "======================================";
    -1 "";
    -1 "Use meta on a table with a foreign key column - its f (foreign key) column names the referenced table, using input: .inputs.foreignKeys.easy.metaShowsForeignKey";
    -1 "Input: ", -3!.inputs.foreignKeys.easy`metaShowsForeignKey;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.easy`metaShowsForeignKey
 };

.fundamental.foreignKeys.qDotFk:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - .Q.fk";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.fk on a foreign key COLUMN (not the whole table) to get back the name of the table it references, using input: .inputs.foreignKeys.easy.qDotFk";
    -1 "Input: ", -3!.inputs.foreignKeys.easy`qDotFk;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.easy`qDotFk
 };

.fundamental.foreignKeys.fkRejectsUnknownValue:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Rejecting An Unknown Value";
    -1 "======================================";
    -1 "";
    -1 "A foreign key is still just an enumeration, so a value not in the referenced table's key still throws a cast error - catch it with @, using input: .inputs.foreignKeys.easy.fkRejectsUnknownValue";
    -1 "Input: ", -3!.inputs.foreignKeys.easy`fkRejectsUnknownValue;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.easy`fkRejectsUnknownValue
 };
