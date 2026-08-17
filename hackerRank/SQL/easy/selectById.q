.quiz.hackerRank.sql.selectById.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Select By ID";
    -1 "======================================";
    -1 "";
    -1 "Query all columns for the CITY row with ID=3.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return the row where ID=3";
    -1 "";
    -1 "Function Description:";
    -1 "selectById takes no arguments - query the global CITY table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single string with that row's columns joined by a space";
 };


/ Solution Info ===============================================
/ selectById[]

selectById:{[]
  first {" " sv string value x} each select from CITY where ID=3
 };
/ =============================================================
