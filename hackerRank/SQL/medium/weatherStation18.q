.quiz.hackerRank.sql.weatherStation18.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 18";
    -1 "======================================";
    -1 "";
    -1 "Consider P1(a,b) and P2(c,d) to be two points on a 2D plane,";
    -1 "where (a,b) = (MIN(LAT_N), MIN(LONG_W)) and (c,d) =";
    -1 "(MAX(LAT_N), MAX(LONG_W)) across every row in STATION. Query";
    -1 "the Manhattan Distance between P1 and P2, rounded to 4 decimal";
    -1 "places.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return |c-a|+|d-b|, rounded to 4 decimal places";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation18 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float, rounded to 4 decimal places";
 };


/ Solution Info ===============================================
/ weatherStation18[]

weatherStation18:{[]
  lats:exec LAT_N from STATION;
  longs:exec LONG_W from STATION;
  a:min lats; c:max lats;
  b:min longs; d:max longs;
  dist:(abs (c-a))+(abs (d-b));
  0.0001*`long$0.5+10000*dist
 };
/ =============================================================
