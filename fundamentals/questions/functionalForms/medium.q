//====================================================================
// MEDIUM
//====================================================================

.fundamental.functionalForms.dotAmendPath:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Dot Amend (Nested Path, Unary)";
    -1 "======================================";
    -1 "";
    -1 "Use .[d;path;f] to apply a one-argument function to a value nested two levels deep (a dict of dicts) using input: .inputs.functionalForms.medium.dotAmendPath";
    -1 "Input: ", -3!.inputs.functionalForms.medium`dotAmendPath;
    -1 "Expected Output: ", -3!.solutions.functionalForms.medium`dotAmendPath
 };

.fundamental.functionalForms.dotAmendPathValue:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Dot Amend (Nested Path, Dyadic)";
    -1 "======================================";
    -1 "";
    -1 "Use .[d;path;f;y] to apply a two-argument function with an explicit extra value to a value nested two levels deep using input: .inputs.functionalForms.medium.dotAmendPathValue";
    -1 "Input: ", -3!.inputs.functionalForms.medium`dotAmendPathValue;
    -1 "Expected Output: ", -3!.solutions.functionalForms.medium`dotAmendPathValue
 };

.fundamental.functionalForms.dotAmendTableCell:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Dot Amend (Table Cell)";
    -1 "======================================";
    -1 "";
    -1 "Use .[t;(row;col);f;y] to add a value to a single table cell addressed by row index and column name using input: .inputs.functionalForms.medium.dotAmendTableCell";
    -1 "Input: ", -3!.inputs.functionalForms.medium`dotAmendTableCell;
    -1 "Expected Output: ", -3!.solutions.functionalForms.medium`dotAmendTableCell
 };

.fundamental.functionalForms.funcDeleteColumn:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Functional Delete";
    -1 "======================================";
    -1 "";
    -1 "Use the functional form of delete (![t;c;b;cols]) to drop a column, equivalent to delete col from t, using input: .inputs.functionalForms.medium.funcDeleteColumn";
    -1 "Input: ", -3!.inputs.functionalForms.medium`funcDeleteColumn;
    -1 "Expected Output: ", -3!.solutions.functionalForms.medium`funcDeleteColumn
 };
