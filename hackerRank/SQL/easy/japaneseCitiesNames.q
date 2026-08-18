.quiz.hackerRank.sql.japaneseCitiesNames.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Japanese Cities' Names";
    -1 "======================================";
    -1 "";
    -1 "Query the names of all Japanese cities in the CITY table.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return NAME for every row where COUNTRYCODE=`JPN, in ID order";
    -1 "";
    -1 "Function Description:";
    -1 "japaneseCitiesNames takes no arguments - query the global CITY";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list of matching city names, in ID order";
 };


/ Solution Info ===============================================
/ japaneseCitiesNames[]

japaneseCitiesNames:{[]
  exec NAME from `ID xasc select from CITY where COUNTRYCODE=`JPN
 };
/ =============================================================
