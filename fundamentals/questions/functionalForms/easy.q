//====================================================================
//
// fundamentals - Functional Forms - Question Functions
//
// Auto-generated from .inputs.functionalForms.easy/medium/hard
// config. Each function prints the exercise header/description and
// the input for that question, pulled from the corresponding input
// and solution banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.functionalForms.indexAt:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Index At (@)";
    -1 "======================================";
    -1 "";
    -1 "Use @ to fetch a value from a dictionary by key using input: .inputs.functionalForms.easy.indexAt";
    -1 "Input: ", -3!.inputs.functionalForms.easy`indexAt;
    -1 "Expected Output: ", -3!.solutions.functionalForms.easy`indexAt
 };

.fundamental.functionalForms.applyDot:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Apply (.)";
    -1 "======================================";
    -1 "";
    -1 "Use . to apply a function to a list of positional arguments using input: .inputs.functionalForms.easy.applyDot";
    -1 "Input: ", -3!.inputs.functionalForms.easy`applyDot;
    -1 "Expected Output: ", -3!.solutions.functionalForms.easy`applyDot
 };

.fundamental.functionalForms.amendAt:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Amend At (Unary)";
    -1 "======================================";
    -1 "";
    -1 "Use functional amend (@[d;k;f]) to apply a one-argument function to the value at a key, leaving other keys untouched, using input: .inputs.functionalForms.easy.amendAt";
    -1 "Input: ", -3!.inputs.functionalForms.easy`amendAt;
    -1 "Expected Output: ", -3!.solutions.functionalForms.easy`amendAt
 };

.fundamental.functionalForms.amendAtValue:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Amend At (Dyadic)";
    -1 "======================================";
    -1 "";
    -1 "Use functional amend (@[d;k;f;y]) to apply a two-argument function with an explicit extra value to the value at a key using input: .inputs.functionalForms.easy.amendAtValue";
    -1 "Input: ", -3!.inputs.functionalForms.easy`amendAtValue;
    -1 "Expected Output: ", -3!.solutions.functionalForms.easy`amendAtValue
 };
