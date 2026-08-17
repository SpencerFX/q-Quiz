.quiz.hackerRank.sql.weatherStation3.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 3";
    -1 "======================================";
    -1 "";
    -1 "Query a list of CITY names from STATION for cities with an";
    -1 "even ID, printed without duplicates, in alphabetical order.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return distinct CITY where ID mod 2 = 0, sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation3 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ weatherStation3[]

weatherStation3:{[]
  asc distinct exec CITY from STATION where 0=ID mod 2
 };
/ =============================================================
