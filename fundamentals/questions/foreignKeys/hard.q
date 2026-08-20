//====================================================================
// HARD
//====================================================================

.fundamental.foreignKeys.manualLjMatchesFkSelect:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Proving The Equivalence";
    -1 "======================================";
    -1 "";
    -1 "Confirm directly that selecting a foreign key's dot-chased column and manually left-joining the referenced table give identical results (~), using input: .inputs.foreignKeys.hard.manualLjMatchesFkSelect";
    -1 "Input: ", -3!.inputs.foreignKeys.hard`manualLjMatchesFkSelect;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.hard`manualLjMatchesFkSelect
 };

.fundamental.foreignKeys.transitiveForeignKey:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Chaining Through Two";
    -1 "======================================";
    -1 "";
    -1 "A foreign key can point to a table that itself has a foreign key - chase two hops with fkCol.otherFkCol.finalCol, using input: .inputs.foreignKeys.hard.transitiveForeignKey";
    -1 "Input: ", -3!.inputs.foreignKeys.hard`transitiveForeignKey;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.hard`transitiveForeignKey
 };

.fundamental.foreignKeys.safeForeignKeyBatch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - A Safe Batch";
    -1 "======================================";
    -1 "";
    -1 "Enumerate a whole list of candidate values against a foreign-key domain via each, catching per-item cast errors with @ and falling back to `UNKNOWN, using input: .inputs.foreignKeys.hard.safeForeignKeyBatch";
    -1 "Input: ", -3!.inputs.foreignKeys.hard`safeForeignKeyBatch;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.hard`safeForeignKeyBatch
 };
