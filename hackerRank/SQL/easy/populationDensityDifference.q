.quiz.hackerRank.sql.populationDensityDifference.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Population Density Difference";
    -1 "======================================";
    -1 "";
    -1 "Query the difference between the maximum and minimum city";
    -1 "populations in the CITY table.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return max[POPULATION]-min[POPULATION] across every row";
    -1 "";
    -1 "Function Description:";
    -1 "populationDensityDifference takes no arguments - query the";
    -1 "global CITY table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer difference";
 };


/ Solution Info ===============================================
/ populationDensityDifference[]

populationDensityDifference:{[]
  p:exec POPULATION from CITY;
  (max p)-min p
 };
/ =============================================================
