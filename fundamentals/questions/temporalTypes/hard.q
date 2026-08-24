//====================================================================
//
// q-Quiz
//
// Topic      : Temporal Types
// Difficulty : Hard
//
// Auto-generated from .inputs.temporalTypes.easy/medium/hard config.
// Each function prints the exercise header/description and the input
// for that question, pulled from the corresponding input and solution
// banks.
//
//====================================================================


//====================================================================
// HARD
//====================================================================

.fundamental.temporalTypes.timespanToSeconds:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Timespan To Seconds";
    -1 "======================================";
    -1 "";
    -1 "Convert a timespan into its total whole seconds, as a plain number. Gotcha: dividing a timespan directly (eg sp div 1000000000) does NOT strip its temporal type - the result just gets re-wrapped as a (nonsensical, few-microsecond) timespan. Cast to long first to actually get a plain count out. Using input: .inputs.temporalTypes.hard.timespanToSeconds";
    -1 "Input: ", -3!.inputs.temporalTypes.hard`timespanToSeconds;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.hard`timespanToSeconds
 };

.fundamental.temporalTypes.dateToMonthCast:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Date To Month Cast";
    -1 "======================================";
    -1 "";
    -1 "Cast a date down to its month, dropping the day entirely. Using input: .inputs.temporalTypes.hard.dateToMonthCast";
    -1 "Input: ", -3!.inputs.temporalTypes.hard`dateToMonthCast;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.hard`dateToMonthCast
 };

.fundamental.temporalTypes.timeVsTimespanOverflow:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Temporal Types - Time Vs Timespan Overflow";
    -1 "======================================";
    -1 "";
    -1 "Cast a timespan longer than 24 hours down to time. Gotcha: unlike a real clock, time does NOT wrap around modulo 24 hours here - it just displays whatever hour count comes out, even a nonsensical one like '30:00:00.000' ('30 o'clock'). Using input: .inputs.temporalTypes.hard.timeVsTimespanOverflow";
    -1 "Input: ", -3!.inputs.temporalTypes.hard`timeVsTimespanOverflow;
    -1 "Expected Output: ", -3!.solutions.temporalTypes.hard`timeVsTimespanOverflow
 };
