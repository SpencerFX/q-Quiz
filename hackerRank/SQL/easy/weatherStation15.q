.quiz.hackerRank.sql.weatherStation15.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 15";
    -1 "======================================";
    -1 "";
    -1 "Query the CITY name for the station with the greatest LAT_N";
    -1 "value smaller than 40.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return the CITY whose LAT_N equals max LAT_N where LAT_N<40";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation15 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single symbol, the matching city name";
 };


/ Solution Info ===============================================
/ weatherStation15[]

weatherStation15:{[]
  t:select from STATION where LAT_N<40;
  first exec CITY from t where LAT_N=max LAT_N
 };
/ =============================================================
