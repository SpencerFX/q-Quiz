.quiz.hackerRank.sql.revisingSelectQueryI.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Revising the Select Query I";
    -1 "======================================";
    -1 "";
    -1 "Query the NAME field for all American cities in the CITY table";
    -1 "with a POPULATION larger than 100000.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return the NAME of every city where COUNTRYCODE=`USA and";
    -1 "  POPULATION>100000";
    -1 "";
    -1 "Function Description:";
    -1 "revisingSelectQueryI takes no arguments - query the global CITY";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list of matching city names";
 };


/ Solution Info ===============================================
/ revisingSelectQueryI[]

revisingSelectQueryI:{[]
  exec NAME from CITY where COUNTRYCODE=`USA, POPULATION>100000
 };
/ =============================================================
