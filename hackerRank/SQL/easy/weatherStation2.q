.quiz.hackerRank.sql.weatherStation2.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 2";
    -1 "======================================";
    -1 "";
    -1 "Query the sum of Northern Latitudes (LAT_N) and Western";
    -1 "Longitudes (LONG_W) from STATION, rounded to 2 decimal places.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return (sum LAT_N)+(sum LONG_W), rounded to 2 decimal places";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation2 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float, rounded to 2 decimal places";
 };


/ Solution Info ===============================================
/ weatherStation2[]

weatherStation2:{[]
  total:(sum exec LAT_N from STATION)+sum exec LONG_W from STATION;
  0.01*`long$0.5+100*total
 };
/ =============================================================
