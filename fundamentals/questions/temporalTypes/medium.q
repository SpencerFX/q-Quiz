//====================================================================
//
// q-Quiz
//
// Topic      : Temporal Types
// Difficulty : Medium
//
// Auto-generated from .inputs.temporalTypes.easy/medium/hard config.
// Each function prints the exercise header/description and the input
// for that question, pulled from the corresponding input and solution
// banks.
//
//====================================================================


//====================================================================
// MEDIUM
//====================================================================

.fundamental.temporalTypes.timestampDiff:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Timestamp Difference";
    -1 "======================================";
    -1 "";
    -1 "Subtract one timestamp from another. Note the result type: a duration (timespan), not a timestamp. Using input: .inputs.temporalTypes.medium.timestampDiff";
    -1 "Input: ", -3!.inputs.temporalTypes.medium`timestampDiff;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.medium`timestampDiff
 };

.fundamental.temporalTypes.castToMinute:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Cast To Minute";
    -1 "======================================";
    -1 "";
    -1 "Cast a timestamp down to minute granularity, truncating the seconds. Using input: .inputs.temporalTypes.medium.castToMinute";
    -1 "Input: ", -3!.inputs.temporalTypes.medium`castToMinute;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.medium`castToMinute
 };

.fundamental.temporalTypes.addTimespanToTimestamp:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Add Timespan To Timestamp";
    -1 "======================================";
    -1 "";
    -1 "Add a duration (timespan) to a timestamp using input: .inputs.temporalTypes.medium.addTimespanToTimestamp";
    -1 "Input: ", -3!.inputs.temporalTypes.medium`addTimespanToTimestamp;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.medium`addTimespanToTimestamp
 };

.fundamental.temporalTypes.monthArithmetic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Month Arithmetic";
    -1 "======================================";
    -1 "";
    -1 "Add a number of months to a month value. q's month type rolls over into the next year automatically, same as calendar math would. Using input: .inputs.temporalTypes.medium.monthArithmetic";
    -1 "Input: ", -3!.inputs.temporalTypes.medium`monthArithmetic;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.medium`monthArithmetic
 };
