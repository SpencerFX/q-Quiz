.quiz.hackerRank.sql.weatherStation6.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 6";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names starting with vowels (a, e, i, o";
    -1 "or u) from STATION. Result should not contain duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where the first letter is a vowel,";
    -1 "  sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation6 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation6[]

weatherStation6:{[]
  cities:distinct exec CITY from STATION;
  asc cities where (first each string cities) in "AEIOU"
 };
/ =============================================================
