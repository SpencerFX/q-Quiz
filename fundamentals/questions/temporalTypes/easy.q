//====================================================================
//
// q-Quiz
//
// Topic      : Temporal Types
// Difficulty : Easy
//
// Auto-generated from .inputs.temporalTypes.easy/medium/hard config.
// Each function prints the exercise header/description and the input
// for that question, pulled from the corresponding input and solution
// banks. Covers q's date/time/timestamp/timespan/month types - one of
// kdb+'s biggest strengths as a time-series database, and a rich
// source of real, easy-to-miss gotchas around casting and arithmetic
// between them.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.temporalTypes.extractDate:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Extract Date";
    -1 "======================================";
    -1 "";
    -1 "Given a timestamp, extract just its date component using input: .inputs.temporalTypes.easy.extractDate";
    -1 "Input: ", -3!.inputs.temporalTypes.easy`extractDate;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.easy`extractDate
 };

.fundamental.temporalTypes.dateArithmetic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Date Arithmetic";
    -1 "======================================";
    -1 "";
    -1 "Add a number of days to a date using input: .inputs.temporalTypes.easy.dateArithmetic";
    -1 "Input: ", -3!.inputs.temporalTypes.easy`dateArithmetic;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.easy`dateArithmetic
 };

.fundamental.temporalTypes.daysBetween:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Days Between";
    -1 "======================================";
    -1 "";
    -1 "Find the number of days between two dates. Gotcha: date minus date returns an int, not a long or a date. Using input: .inputs.temporalTypes.easy.daysBetween";
    -1 "Input: ", -3!.inputs.temporalTypes.easy`daysBetween;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.easy`daysBetween
 };

.fundamental.temporalTypes.extractTimeOfDay:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Extract Time Of Day";
    -1 "======================================";
    -1 "";
    -1 "Given a timestamp, extract just its time-of-day component. Note: time only holds millisecond precision, so the nanosecond fraction gets truncated. Using input: .inputs.temporalTypes.easy.extractTimeOfDay";
    -1 "Input: ", -3!.inputs.temporalTypes.easy`extractTimeOfDay;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.easy`extractTimeOfDay
 };
