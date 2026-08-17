.quiz.hackerRank.sql.averagePopulation.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Average Population";
    -1 "======================================";
    -1 "";
    -1 "Query the average population of every city, rounded down to";
    -1 "the nearest integer.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return round[avg POPULATION] across every row in CITY";
    -1 "";
    -1 "Function Description:";
    -1 "averagePopulation takes no arguments - query the global CITY";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single rounded integer";
 };


/ Solution Info ===============================================
/ averagePopulation[]

averagePopulation:{[]
  `long$0.5+avg exec POPULATION from CITY
 };
/ =============================================================
