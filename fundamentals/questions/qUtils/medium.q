//====================================================================
// MEDIUM
//====================================================================

.fundamental.qUtils.formatFixedDecimals:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.f";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.f to format a float to a fixed number of decimal places, returned as a string, using input: .inputs.qUtils.medium.formatFixedDecimals";
    -1 "Input: ", -3!.inputs.qUtils.medium`formatFixedDecimals;
    -1 "Expected Output: ", -3!.solutions.qUtils.medium`formatFixedDecimals
 };

.fundamental.qUtils.formatFixedWidth:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.fmt";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.fmt to format a float into a fixed-WIDTH, fixed-decimal string (right-padded with spaces), using input: .inputs.qUtils.medium.formatFixedWidth";
    -1 "Input: ", -3!.inputs.qUtils.medium`formatFixedWidth;
    -1 "Expected Output: ", -3!.solutions.qUtils.medium`formatFixedWidth
 };

.fundamental.qUtils.buildFilePath:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.dd";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.dd to join hsym path segments together, chaining two calls to join three segments into one path, using input: .inputs.qUtils.medium.buildFilePath";
    -1 "Input: ", -3!.inputs.qUtils.medium`buildFilePath;
    -1 "Expected Output: ", -3!.solutions.qUtils.medium`buildFilePath
 };

.fundamental.qUtils.checkPartitioned:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - .Q Utils - .Q.qp";
    -1 "======================================";
    -1 "";
    -1 "Use .Q.qp to check whether a table is a partitioned (on-disk) table - an ordinary in-memory table is not, using input: .inputs.qUtils.medium.checkPartitioned";
    -1 "Input: ", -3!.inputs.qUtils.medium`checkPartitioned;
    -1 "Expected Output: ", -3!.solutions.qUtils.medium`checkPartitioned
 };
