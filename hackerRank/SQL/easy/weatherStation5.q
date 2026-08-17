.quiz.hackerRank.sql.weatherStation5.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Weather Observation Station 5";
    -1 "======================================";
    -1 "";
    -1 "Query the two cities in STATION with the shortest and longest";
    -1 "CITY names, as well as their respective lengths. If more than";
    -1 "one city has the shortest/longest name, pick the one that comes";
    -1 "first alphabetically.";
    -1 "";
    -1 "Table: STATION(ID;CITY;STATE;LAT_N;LONG_W)";
    -1 "";
    -1 "Task:";
    -1 "- Return two rows: the shortest-named city and its length, then";
    -1 "  the longest-named city and its length";
    -1 "";
    -1 "Function Description:";
    -1 "weatherStation5 takes no arguments - query the global STATION";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A 2-item list of strings: \"CITY LENGTH\" for the shortest name";
    -1 "  then the longest name";
 };


/ Solution Info ===============================================
/ weatherStation5[]

weatherStation5:{[]
  cities:asc distinct exec CITY from STATION;
  lens:count each string cities;
  shortest:first cities where lens=min lens;
  longest:first cities where lens=max lens;
  shortRow:" " sv (string shortest; string min lens);
  longRow:" " sv (string longest; string max lens);
  (enlist shortRow),enlist longRow
 };
/ =============================================================
