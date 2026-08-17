.quiz.hackerRank.sql.weatherStation10.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 10";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names from STATION that do not end with";
    -1 "vowels. Result should not contain duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where the last letter is NOT a vowel,";
    -1 "  sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation10 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation10[]

weatherStation10:{[]
  cities:distinct exec CITY from STATION;
  asc cities where not (last each string cities) in "aeiou"
 };
/ =============================================================
