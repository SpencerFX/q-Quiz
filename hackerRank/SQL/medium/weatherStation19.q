.quiz.hackerRank.sql.weatherStation19.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 19";
    -1 "======================================";
    -1 "";
    -1 "Consider P1(a,b) and P2(c,d) to be two points on a 2D plane,";
    -1 "where (a,b) = (MIN(LAT_N), MIN(LONG_W)) and (c,d) =";
    -1 "(MAX(LAT_N), MAX(LONG_W)) across every row in STATION. Query";
    -1 "the Euclidean Distance between P1 and P2, rounded to 4 decimal";
    -1 "places.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return sqrt[(c-a) xexp 2 + (d-b) xexp 2], rounded to 4";
    -1 "  decimal places";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation19 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float, rounded to 4 decimal places";
 };


/ Solution Info ===============================================
/ weatherStation19[]

weatherStation19:{[]
  lats:exec LAT_N from STATION;
  longs:exec LONG_W from STATION;
  a:min lats; c:max lats;
  b:min longs; d:max longs;
  dist:sqrt (((c-a) xexp 2)+((d-b) xexp 2));
  0.0001*`long$0.5+10000*dist
 };
/ =============================================================
