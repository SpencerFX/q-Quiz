/Question Info ===============================================
/
Time Conversion

Given a time in 12-hour AM/PM format, convert it to military
(24-hour) time.

Note:
- 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock
- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock

Task:
- Convert the given time string to 24-hour format
- Return the converted time

Example:
s = 07:05:45PM

Result:
19:05:45

Explanation:
- PM time → add 12 to the hour (except 12PM)
- AM time → keep hour the same (except 12AM → 00)

Function Description:
timeConversion takes:
  - s: a string representing time in 12-hour format (hh:mm:ssAM or PM)

Returns:
  - string representing time in 24-hour format (HH:mm:ss)

Input Format:
- A single string s in the format hh:mm:ssAM or hh:mm:ssPM

Output Format:
- Return the converted time string

Constraints:
- All input times are valid
- 01 ≤ hh ≤ 12
- 00 ≤ mm, ss ≤ 59

Notes:
- If period is "AM":
    - If hour == 12 → convert to "00"
    - Else → keep hour as is
- If period is "PM":
    - If hour == 12 → keep as 12
    - Else → add 12 to hour
- Only the hour portion changes

Goal:
- Correctly handle edge cases (12AM, 12PM)
- Return properly formatted 24-hour time string
\
/=============================================================

/ Input Info ==================================================
input: "07:05:45PM";
/ =============================================================


/ Solution Info ===============================================
/ timeConversion input
timeConversion:{[t]
  h:"J"$2#t;        / hour as int
  suffix:-2#t;      / "AM" or "PM"
  rest:1_(-2)_t;    / ":MM:SS"
  nh:
    $[suffix like "AM";
        $[h=12; 0; h];
        $[h=12; 12; h+12]
     ];
  / format hour properly as 2-digit string
  hh:$[nh<10; "0",string nh; string nh];
  hh,1_rest
 };
/ =============================================================