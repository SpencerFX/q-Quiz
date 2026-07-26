/Question Info ===============================================
/
Day of the Programmer

Marie invented a Time Machine and wants to calculate the exact date
of the Day of the Programmer for a given year.

The Day of the Programmer is the 256th day of the year.

In Russia, the calendar system changed in 1918:
- From 1700 to 1917 → Julian calendar
- From 1919 onwards → Gregorian calendar
- In 1918 → transition year:
    - January 31 was followed by February 14
    - This year has only 256 - 13 = 243 actual days before adjustment

Leap year rules:
- Julian calendar (before 1918):
    - Leap year if divisible by 4
- Gregorian calendar (after 1918):
    - Leap year if:
        divisible by 400 OR
        divisible by 4 AND not divisible by 100

Task:
- Determine the date of the 256th day of the given year
- Return the date in format dd.mm.yyyy

Example:
year = 2017 → not a leap year → 13.09.2017
year = 2016 → leap year → 12.09.2016

Special case:
year = 1918 → 26.09.1918

Function Description:
dayOfProgrammer takes:
  - year: integer

Returns:
  - string representing the date in format dd.mm.yyyy

Input Format:
- A single integer year

Output Format:
- Return a string representing the Day of the Programmer

Constraints:
- 1700 ≤ year ≤ 2700

Notes:
- In leap years → Day 256 falls on 12 September
- In non-leap years → Day 256 falls on 13 September
- Exception:
    - Year 1918 → return 26.09.1918 due to calendar shift
- Apply correct leap rules depending on calendar system

Goal:
- Correctly handle Julian vs Gregorian rules
- Handle the special transition year (1918)
- Return properly formatted date string
\
/=============================================================


/ Input Info ==================================================
input:2017;
/ =============================================================


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