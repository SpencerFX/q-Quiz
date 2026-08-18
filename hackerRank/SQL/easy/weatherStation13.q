.quiz.hackerRank.sql.weatherStation13.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 13";
    -1 "======================================";
    -1 "";
    -1 "Query the average value of LAT_N from STATION, for all records";
    -1 "where LAT_N is smaller than 40, rounded to 4 decimal places.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return avg LAT_N where LAT_N<40, rounded to 4 decimal places";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation13 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float, rounded to 4 decimal places";
 };


/ Solution Info ===============================================
/ weatherStation13[]

weatherStation13:{[]
  v:avg exec LAT_N from STATION where LAT_N<40;
  0.0001*`long$0.5+10000*v
 };
/ =============================================================
