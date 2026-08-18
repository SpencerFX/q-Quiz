.quiz.hackerRank.sql.weatherStation4.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 4";
    -1 "======================================";
    -1 "";
    -1 "Find the difference between the total number of CITY entries";
    -1 "in STATION and the number of distinct CITY names.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return (count CITY)-(count distinct CITY)";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation4 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer difference";
 };


/ Solution Info ===============================================
/ weatherStation4[]

weatherStation4:{[]
  c:exec CITY from STATION;
  (count c)-count distinct c
 };
/ =============================================================
