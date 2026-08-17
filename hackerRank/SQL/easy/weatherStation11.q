.quiz.hackerRank.sql.weatherStation11.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 11";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names from STATION that either do not";
    -1 "start with vowels or do not end with vowels. Result should not";
    -1 "contain duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where NOT(starts with vowel) OR";
    -1 "  NOT(ends with vowel), sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation11 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation11[]

weatherStation11:{[]
  cities:distinct exec CITY from STATION;
  starts:(first each string cities) in "AEIOU";
  ends:(last each string cities) in "aeiou";
  asc cities where (not starts)|not ends
 };
/ =============================================================
