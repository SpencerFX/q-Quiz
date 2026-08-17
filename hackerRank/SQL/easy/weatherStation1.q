.quiz.hackerRank.sql.weatherStation1.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 1";
    -1 "======================================";
    -1 "";
    -1 "Query a list of CITY and STATE from the STATION table.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return CITY and STATE for every row, in ID order";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation1 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per row, \"CITY STATE\", in ID order";
 };


/ Solution Info ===============================================
/ weatherStation1[]

weatherStation1:{[]
  {" " sv string value x} each select CITY,STATE from `ID xasc STATION
 };
/ =============================================================
