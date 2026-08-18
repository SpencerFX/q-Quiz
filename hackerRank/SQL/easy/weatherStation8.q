.quiz.hackerRank.sql.weatherStation8.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 8";
    -1 "======================================";
    -1 "";
    -1 "Query the list of CITY names from STATION that both start and";
    -1 "end with vowels (a, e, i, o or u). Result should not contain";
    -1 "duplicates.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where the first AND last letters are";
    -1 "  both vowels, sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation8 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation8[]

weatherStation8:{[]
  cities:distinct exec CITY from STATION;
  starts:(first each string cities) in "AEIOU";
  ends:(last each string cities) in "aeiou";
  asc cities where starts&ends
 };
/ =============================================================
