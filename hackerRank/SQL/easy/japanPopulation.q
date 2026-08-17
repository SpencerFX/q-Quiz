.quiz.hackerRank.sql.japanPopulation.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Japan Population";
    -1 "======================================";
    -1 "";
    -1 "Query the sum of the populations of all Japanese cities.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return sum of POPULATION where COUNTRYCODE=`JPN";
    -1 "";
    -1 "Function Description:";
    -1 "japanPopulation takes no arguments - query the global CITY table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer sum";
 };


/ Solution Info ===============================================
/ japanPopulation[]

japanPopulation:{[]
  sum exec POPULATION from CITY where COUNTRYCODE=`JPN
 };
/ =============================================================
