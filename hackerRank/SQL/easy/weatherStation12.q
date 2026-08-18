.quiz.hackerRank.sql.weatherStation12.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 12";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names from STATION that neither start";
    -1 "nor end with vowels. Result should not contain duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where NOT(starts with vowel) AND";
    -1 "  NOT(ends with vowel), sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation12 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation12[]

weatherStation12:{[]
  cities:distinct exec CITY from STATION;
  starts:(first each string cities) in "AEIOU";
  ends:(last each string cities) in "aeiou";
  asc cities where (not starts)&not ends
 };
/ =============================================================
