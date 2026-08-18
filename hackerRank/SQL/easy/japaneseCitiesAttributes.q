.quiz.hackerRank.sql.japaneseCitiesAttributes.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Japanese Cities' Attributes";
    -1 "======================================";
    -1 "";
    -1 "Query all attributes for every Japanese city in the CITY table.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return every row where COUNTRYCODE=`JPN, in ID order";
    -1 "";
    -1 "Function Description:";
    -1 "japaneseCitiesAttributes takes no arguments - query the global";
    -1 "CITY table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per matching row, columns joined by a";
    -1 "  single space, in ID order";
 };


/ Solution Info ===============================================
/ japaneseCitiesAttributes[]

japaneseCitiesAttributes:{[]
  {" " sv string value x} each `ID xasc select from CITY where COUNTRYCODE=`JPN
 };
/ =============================================================
