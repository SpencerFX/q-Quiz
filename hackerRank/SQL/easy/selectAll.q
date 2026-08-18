.quiz.hackerRank.sql.selectAll.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Select All";
    -1 "======================================";
    -1 "";
    -1 "Query all columns for every row in the CITY table.";
    -1 "";
    -1 "Table: CITY(ID;NAME;COUNTRYCODE;DISTRICT;POPULATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return every row's ID, NAME, COUNTRYCODE, DISTRICT and";
    -1 "  POPULATION, in ID order";
    -1 "";
    -1 "Function Description:";
    -1 "selectAll takes no arguments - query the global CITY table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per row, each row's columns joined by a";
    -1 "  single space, in ID order";
 };


/ Solution Info ===============================================
/ selectAll[]

selectAll:{[]
  {" " sv string value x} each `ID xasc CITY
 };
/ =============================================================
