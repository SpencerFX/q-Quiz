//====================================================================
//
// fundamentals - .Q Utils - Question Functions
//
// Auto-generated from .inputs.qUtils.easy/medium/hard config. Each
// function prints the exercise header/description and the input for
// that question, pulled from the corresponding input and solution
// banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.qUtils.qType:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.ty";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.ty to get the single-character type code for a value using input: .inputs.qUtils.easy.qType";
    -1 "Input: ", -3!.inputs.qUtils.easy`qType;
    -1 "Expected Output: ", -3!.solutions.qUtils.easy`qType
 };

.fundamental.qUtils.isTable:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.qt";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.qt to check whether a value is a table - a plain dictionary is NOT one, even though a table is really just a special dictionary, using input: .inputs.qUtils.easy.isTable";
    -1 "Input: ", -3!.inputs.qUtils.easy`isTable;
    -1 "Expected Output: ", -3!.solutions.qUtils.easy`isTable
 };

.fundamental.qUtils.sanitizeIdentifier:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.id";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.id to sanitise a symbol with invalid characters (spaces, dots) into a valid q identifier using input: .inputs.qUtils.easy.sanitizeIdentifier";
    -1 "Input: ", -3!.inputs.qUtils.easy`sanitizeIdentifier;
    -1 "Expected Output: ", -3!.solutions.qUtils.easy`sanitizeIdentifier
 };

.fundamental.qUtils.checkAgainstMaxLong:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.M";
    -1 "======================================";
    -1 "";
    -1 "Compare a value against .Q.M, the max-long sentinel commonly used to mean \"infinite\"/\"no limit\", using input: .inputs.qUtils.easy.checkAgainstMaxLong";
    -1 "Input: ", -3!.inputs.qUtils.easy`checkAgainstMaxLong;
    -1 "Expected Output: ", -3!.solutions.qUtils.easy`checkAgainstMaxLong
 };
