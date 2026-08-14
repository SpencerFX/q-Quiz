//====================================================================
// Time Conversion
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.timeConversion.info[]
//====================================================================
.quiz.hackerRank.algorithms.timeConversion.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Time Conversion";
    -1 "";
    -1 "Given a time in 12-hour AM/PM format, convert it to military";
    -1 "(24-hour) time.";
    -1 "";
    -1 "Note:";
    -1 "- 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock";
    -1 "- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock";
    -1 "";
    -1 "Task:";
    -1 "- Convert the given time string to 24-hour format";
    -1 "- Return the converted time";
    -1 "";
    -1 "Example:";
    -1 "s = 07:05:45PM";
    -1 "";
    -1 "Result:";
    -1 "19:05:45";
    -1 "";
    -1 "Explanation:";
    -1 "- PM time -> add 12 to the hour (except 12PM)";
    -1 "- AM time -> keep hour the same (except 12AM -> 00)";
    -1 "";
    -1 "Function Description:";
    -1 "timeConversion takes:";
    -1 "  - s: a string representing time in 12-hour format (hh:mm:ssAM or PM)";
    -1 "";
    -1 "Returns:";
    -1 "  - string representing time in 24-hour format (HH:mm:ss)";
    -1 "";
    -1 "Input Format:";
    -1 "- A single string s in the format hh:mm:ssAM or hh:mm:ssPM";
    -1 "";
    -1 "Output Format:";
    -1 "- Return the converted time string";
    -1 "";
    -1 "Constraints:";
    -1 "- All input times are valid";
    -1 "- 01 <= hh <= 12";
    -1 "- 00 <= mm, ss <= 59";
    -1 "";
    -1 "Notes:";
    -1 "- If period is \"AM\":";
    -1 "    - If hour == 12 -> convert to \"00\"";
    -1 "    - Else -> keep hour as is";
    -1 "- If period is \"PM\":";
    -1 "    - If hour == 12 -> keep as 12";
    -1 "    - Else -> add 12 to hour";
    -1 "- Only the hour portion changes";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly handle edge cases (12AM, 12PM)";
    -1 "- Return properly formatted 24-hour time string";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "t:\"07:05:45PM\";";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ timeConversion t
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
