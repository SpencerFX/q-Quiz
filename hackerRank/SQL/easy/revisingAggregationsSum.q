.quiz.hackerRank.sql.revisingAggregationsSum.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Revising Aggregations - The Sum Function";
    -1 "======================================";
    -1 "";
    -1 "Sum the populations of all cities in the California district.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return sum of POPULATION where DISTRICT=`California";
    -1 "";
    -1 "Function Description:";
    -1 "revisingAggregationsSum takes no arguments - query the global";
    -1 "CITY table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer sum";
 };


/ Solution Info ===============================================
/ revisingAggregationsSum[]

revisingAggregationsSum:{[]
  sum exec POPULATION from CITY where DISTRICT=`California
 };
/ =============================================================
