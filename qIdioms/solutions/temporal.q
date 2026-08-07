.solutions.temporal.easy: (!) . flip raze 2 cut
    (
    (`isLeapYear; 0 0 1 0 1 0b);
    (`daysInMonth; enlist 31);
    (`daysInLeapFebruary; enlist 29);
    (`daysInNonLeapFebruary; enlist 28);
    (`ascendingDateFormat; "01/01/2019");
    (`twelveHourClock; "01:58:57 AM");
    (`americanDateFormat; "9/15/2018")
    );

.solutions.temporal.medium: (!) . flip raze 2 cut
    (
    (`daysAcrossYears; 28 29 29 28);
    (`ascendingDateFormatting; "01/08/2026");
    (`twelveHourClockPM; "01:59:59 PM");
    (`americanDateFormatting; "8/1/2026");
    (`leapYearVector; 1 0 0 0 1 0 0 0 1 0b)
    );

.solutions.temporal.hard: (!) . flip raze 2 cut
    (
    (`monthLengthsOverYears; 31 29 31 30 31 30 31 31 30 31 30 31);
    (`multipleDateFormatting; ("01/01/2020";"15/06/2021";"31/12/2024"));
    (`multipleTimeFormatting; ("12:00:00 AM";"11:59:59 AM";"12:00:00 PM";"11:59:59 PM"));
    (`leapYearRange; {0=mod[;2] sum 0=x mod\:4 100 400} each 1800 + til 500);
    (`mixedDateTimeFormatting; ("01/08/2026";"01:00:00 PM"))
    );