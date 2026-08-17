.quiz.hackerRank.sql.revisingAggregationsAvg.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Revising Aggregations - Averages";
    -1 "======================================";
    -1 "";
    -1 "Average the populations of all cities in the Texas district.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return average POPULATION where DISTRICT=`Texas";
    -1 "";
    -1 "Function Description:";
    -1 "revisingAggregationsAvg takes no arguments - query the global";
    -1 "CITY table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single float average";
 };


/ Solution Info ===============================================
/ revisingAggregationsAvg[]

revisingAggregationsAvg:{[]
  avg exec POPULATION from CITY where DISTRICT=`Texas
 };
/ =============================================================
