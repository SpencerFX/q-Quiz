//====================================================================
// HARD
//====================================================================

.fundamental.qUtils.checkReservedWords:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.res";
    -1 "======================================";
    -1 "";
    -1 "Check a list of candidate identifiers against .Q.res, the list of q's reserved words, using input: .inputs.qUtils.hard.checkReservedWords";
    -1 "Input: ", -3!.inputs.qUtils.hard`checkReservedWords;
    -1 "Expected Output: ", -3!.solutions.qUtils.hard`checkReservedWords
 };

.fundamental.qUtils.sanitizeIdentifierBatch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.id Over A List";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.id with each to sanitise a whole list of messy symbols (e.g. column names pulled from somewhere external) at once, using input: .inputs.qUtils.hard.sanitizeIdentifierBatch";
    -1 "Input: ", -3!.inputs.qUtils.hard`sanitizeIdentifierBatch;
    -1 "Expected Output: ", -3!.solutions.qUtils.hard`sanitizeIdentifierBatch
 };

.fundamental.qUtils.protectedTrpWithBacktrace:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.trp";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.trp[f;x;handler] - protected evaluation like @, but the handler receives BOTH the error text and a backtrace - using input: .inputs.qUtils.hard.protectedTrpWithBacktrace";
    -1 "Input: ", -3!.inputs.qUtils.hard`protectedTrpWithBacktrace;
    -1 "Expected Output: ", -3!.solutions.qUtils.hard`protectedTrpWithBacktrace
 };
