.quiz.hackerRank.sql.weatherStation7.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 7";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names ending with vowels (a, e, i, o or";
    -1 "u) from STATION. Result should not contain duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where the last letter is a vowel, sorted";
    -1 "  alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation7 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation7[]

weatherStation7:{[]
  cities:distinct exec CITY from STATION;
  asc cities where (last each string cities) in "aeiou"
 };
/ =============================================================
