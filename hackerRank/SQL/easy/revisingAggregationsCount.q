.quiz.hackerRank.sql.revisingAggregationsCount.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Revising Aggregations - The Count Function";
    -1 "======================================";
    -1 "";
    -1 "Count the number of cities with a population strictly larger";
    -1 "than 100000.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return the count of rows where POPULATION>100000";
    -1 "";
    -1 "Function Description:";
    -1 "revisingAggregationsCount takes no arguments - query the global";
    -1 "CITY table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer count";
 };


/ Solution Info ===============================================
/ revisingAggregationsCount[]

revisingAggregationsCount:{[]
  count select from CITY where POPULATION>100000
 };
/ =============================================================
