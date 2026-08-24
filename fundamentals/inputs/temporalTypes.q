//====================================================================
// fundamentals — temporalTypes inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Every input below is a fixed literal date/time/timestamp value -
// never .z.d/.z.p/.z.t (the current-time system variables), since
// those change on every call and would make the precomputed
// .solutions.temporalTypes.* literals wrong the moment time moves on.
//====================================================================

.inputs.temporalTypes.easy:
    `extractDate`dateArithmetic`daysBetween`extractTimeOfDay!(
        (enlist 2023.06.15D14:30:00.123456789);
        (2023.06.15;10);
        (2023.06.15;2023.06.25);
        (enlist 2023.06.15D14:30:00.123456789)
    );

.inputs.temporalTypes.medium:
    `timestampDiff`castToMinute`addTimespanToTimestamp`monthArithmetic!(
        (2023.06.15D12:00:00.000000000;2023.06.15D14:00:00.000000000);
        (enlist 2023.06.15D14:30:45.123000000);
        (2023.06.15D12:00:00.000000000;0D02:00:00.000000000);
        (2023.10m;5)
    );

.inputs.temporalTypes.hard:
    `timespanToSeconds`dateToMonthCast`timeVsTimespanOverflow!(
        (enlist 0D01:30:00.000000000);
        (enlist 2023.06.15);
        (enlist 1D06:00:00.000000000)
    );
