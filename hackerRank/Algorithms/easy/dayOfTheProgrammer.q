//====================================================================
// Day of the Programmer
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.dayOfTheProgrammer.info[]
//====================================================================
.quiz.hackerRank.algorithms.dayOfTheProgrammer.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Day of the Programmer";
    -1 "";
    -1 "Marie invented a Time Machine and wants to calculate the exact date";
    -1 "of the Day of the Programmer for a given year.";
    -1 "";
    -1 "The Day of the Programmer is the 256th day of the year.";
    -1 "";
    -1 "In Russia, the calendar system changed in 1918:";
    -1 "- From 1700 to 1917 -> Julian calendar";
    -1 "- From 1919 onwards -> Gregorian calendar";
    -1 "- In 1918 -> transition year:";
    -1 "    - January 31 was followed by February 14";
    -1 "    - This year has only 256 - 13 = 243 actual days before adjustment";
    -1 "";
    -1 "Leap year rules:";
    -1 "- Julian calendar (before 1918):";
    -1 "    - Leap year if divisible by 4";
    -1 "- Gregorian calendar (after 1918):";
    -1 "    - Leap year if:";
    -1 "        divisible by 400 OR";
    -1 "        divisible by 4 AND not divisible by 100";
    -1 "";
    -1 "Task:";
    -1 "- Determine the date of the 256th day of the given year";
    -1 "- Return the date in format dd.mm.yyyy";
    -1 "";
    -1 "Example:";
    -1 "year = 2017 -> not a leap year -> 13.09.2017";
    -1 "year = 2016 -> leap year -> 12.09.2016";
    -1 "";
    -1 "Special case:";
    -1 "year = 1918 -> 26.09.1918";
    -1 "";
    -1 "Function Description:";
    -1 "dayOfProgrammer takes:";
    -1 "  - year: integer";
    -1 "";
    -1 "Returns:";
    -1 "  - string representing the date in format dd.mm.yyyy";
    -1 "";
    -1 "Input Format:";
    -1 "- A single integer year";
    -1 "";
    -1 "Output Format:";
    -1 "- Return a string representing the Day of the Programmer";
    -1 "";
    -1 "Constraints:";
    -1 "- 1700 <= year <= 2700";
    -1 "";
    -1 "Notes:";
    -1 "- In leap years -> Day 256 falls on 12 September";
    -1 "- In non-leap years -> Day 256 falls on 13 September";
    -1 "- Exception:";
    -1 "    - Year 1918 -> return 26.09.1918 due to calendar shift";
    -1 "- Apply correct leap rules depending on calendar system";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly handle Julian vs Gregorian rules";
    -1 "- Handle the special transition year (1918)";
    -1 "- Return properly formatted date string";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "year:2017;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ dayOfTheProgrammer input
dayOfTheProgrammer:{[y]
  feb:$[y<1918;
        $[0=y mod 4; 29; 28];
        $[(0=y mod 400) | ((0=y mod 4) & (0<>y mod 100)); 29; 28]
      ];

  days:(31;feb;31;30;31;30;31;31;30;31;30;31);
  cum:sums days;

  idx:first where cum>=256;
  prev1:$[idx=0; 0; cum idx-1];

  d:256 - prev1;
  m:idx + 1;

  / format with zero padding
  dd:$[d<10;"0",string d;string d];
  mm:$[m<10;"0",string m;string m];
  yyyy:string y;

  dd,".",mm,".",yyyy
 }
/ =============================================================
