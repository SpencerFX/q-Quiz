.quiz.hackerRank.sql.weatherStation16.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 16";
    -1 "======================================";
    -1 "";
    -1 "Query the smallest value of LAT_N from STATION, for all";
    -1 "records where LAT_N is greater than 38, rounded to 4 decimal";
    -1 "places.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return min LAT_N where LAT_N>38, rounded to 4 decimal places";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation16 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float, rounded to 4 decimal places";
 };


/ Solution Info ===============================================
/ weatherStation16[]

weatherStation16:{[]
  v:min exec LAT_N from STATION where LAT_N>38;
  0.0001*`long$0.5+10000*v
 };
/ =============================================================
