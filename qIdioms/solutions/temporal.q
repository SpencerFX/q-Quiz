.solutions.temporal.easy: (!) . flip raze 2 cut
    (
    (`isLeapYear;enlist 1900 1901 1904 1999 2000 2100);
    (`daysInMonth;((7;1996)));
    (`daysInLeapFebruary;((2;1996)));
    (`daysInNonLeapFebruary;((2;1997)));
    (`ascendingDateFormat;enlist 2019.01.01);
    (`twelveHourClock;enlist 01:58:57);
    (`americanDateFormat;enlist 2018.09.15)
    );

.solutions.temporal.medium: (!) . flip raze 2 cut
    (
    (`daysAcrossYears;((2;1900 1904 2000 2100)));
    (`ascendingDateFormatting;enlist .z.p);
    (`twelveHourClockPM;enlist 13:59:59);
    (`americanDateFormatting;enlist .z.d);
    (`leapYearVector;enlist 1996 + til 10)
    );

.solutions.temporal.hard: (!) . flip raze 2 cut
    (
    (`monthLengthsOverYears;((1 2 3 4 5 6 7 8 9 10 11 12;2020)));
    (`multipleDateFormatting;enlist 2020.01.01 2021.06.15 2024.12.31);
    (`multipleTimeFormatting;enlist 00:00:00 11:59:59 12:00:00 23:59:59);
    (`leapYearRange;enlist 1800 + til 500);
    (`mixedDateTimeFormatting;enlist .z.p)
    );