.quiz.hackerRank.sql.weatherStation17.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 17";
    -1 "======================================";
    -1 "";
    -1 "Query the CITY name for the station with the smallest LAT_N";
    -1 "value greater than 38.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return the CITY whose LAT_N equals min LAT_N where LAT_N>38";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation17 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single symbol, the matching city name";
 };


/ Solution Info ===============================================
/ weatherStation17[]

weatherStation17:{[]
  t:select from STATION where LAT_N>38;
  first exec CITY from t where LAT_N=min LAT_N
 };
/ =============================================================
