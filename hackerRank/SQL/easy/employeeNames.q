.quiz.hackerRank.sql.employeeNames.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Employee Names";
    -1 "======================================";
    -1 "";
    -1 "Query a list of employee names from EMPLOYEE, ordered";
    -1 "alphabetically.";
    -1 "";
    -1 "Table: EMPLOYEE(EMPLOYEE_ID;NAME;MONTHS;SALARY)";
    -1 "";
    -1 "Task:";
    -1 "- Return NAME for every row, sorted alphabetically";
    -1 "";
    -1 "Function Description:";
    -1 "employeeNames takes no arguments - query the global EMPLOYEE";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, sorted alphabetically";
 };


/ Solution Info ===============================================
/ employeeNames[]

employeeNames:{[]
  asc exec NAME from EMPLOYEE
 };
/ =============================================================
