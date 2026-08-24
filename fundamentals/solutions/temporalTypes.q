//====================================================================
// fundamentals — temporalTypes solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/temporalTypes.q for background).
//
// Two gotchas surfaced verifying these live, both worth knowing:
//   - date subtraction (daysBetween) returns an int (10i), not a long
//     - a rare case where q's own arithmetic result isn't the "widest"
//     type of its inputs.
//   - dividing a timespan by a plain number (timespanToSeconds)
//     doesn't strip its temporal type - `sp div 1000000000` re-wraps
//     the answer as a (nonsensical, ~5 microsecond) timespan rather
//     than handing back a plain count. Cast to long FIRST, then
//     divide, to actually get the number out.
//====================================================================

.solutions.temporalTypes.easy:
    `extractDate`dateArithmetic`daysBetween`extractTimeOfDay!(
        2023.06.15;
        2023.06.25;
        10i;
        14:30:00.123
    );

.solutions.temporalTypes.medium:
    `timestampDiff`castToMinute`addTimespanToTimestamp`monthArithmetic!(
        0D02:00:00.000000000;
        14:30;
        2023.06.15D14:00:00.000000000;
        2024.03m
    );

.solutions.temporalTypes.hard:
    `timespanToSeconds`dateToMonthCast`timeVsTimespanOverflow!(
        5400;
        2023.06m;
        30:00:00.000
    );
