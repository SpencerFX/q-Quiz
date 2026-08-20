//====================================================================
// MEDIUM
//====================================================================

.fundamental.attributes.sortThenSetAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - Sort Before Setting `s#";
    -1 "======================================";
    -1 "";
    -1 "Setting `s# on data that isn't actually sorted is an error (s-fail) - sort the list first, then apply `s#, using input: .inputs.attributes.medium.sortThenSetAttr";
    -1 "Input: ", -3!.inputs.attributes.medium`sortThenSetAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.medium`sortThenSetAttr
 };

.fundamental.attributes.distinctThenSetAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - Distinct Before Setting `u#";
    -1 "======================================";
    -1 "";
    -1 "Setting `u# on data with duplicates is an error (u-fail) - remove duplicates first, then apply `u#, using input: .inputs.attributes.medium.distinctThenSetAttr";
    -1 "Input: ", -3!.inputs.attributes.medium`distinctThenSetAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.medium`distinctThenSetAttr
 };

.fundamental.attributes.setPartedAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - Parted (`p#)";
    -1 "======================================";
    -1 "";
    -1 "Apply the parted attribute (`p#) to a list whose equal values already occur in contiguous runs using input: .inputs.attributes.medium.setPartedAttr";
    -1 "Input: ", -3!.inputs.attributes.medium`setPartedAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.medium`setPartedAttr
 };

.fundamental.attributes.tableColumnAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - Attribute On A Table Column";
    -1 "======================================";
    -1 "";
    -1 "Apply `p# to a table's sym column (already grouped contiguously) - a common real-world pattern for fast by-sym queries - using input: .inputs.attributes.medium.tableColumnAttr";
    -1 "Input: ", -3!.inputs.attributes.medium`tableColumnAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.medium`tableColumnAttr
 };
