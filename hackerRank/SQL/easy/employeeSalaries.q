.quiz.hackerRank.sql.employeeSalaries.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Employee Salaries";
    -1 "======================================";
    -1 "";
    -1 "Query EMPLOYEE_ID and SALARY from EMPLOYEE for employees who";
    -1 "have been employed fewer than 10 months and earn more than";
    -1 "5000, ordered by EMPLOYEE_ID.";
    -1 "";
    -1 "Table: EMPLOYEE(EMPLOYEE_ID;NAME;MONTHS;SALARY)";
    -1 "";
    -1 "Task:";
    -1 "- Return EMPLOYEE_ID and SALARY where SALARY>5000 and MONTHS<10,";
    -1 "  ordered by EMPLOYEE_ID";
    -1 "";
    -1 "Function Description:";
    -1 "employeeSalaries takes no arguments - query the global EMPLOYEE";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per row, \"EMPLOYEE_ID SALARY\"";
 };


/ Solution Info ===============================================
/ employeeSalaries[]

employeeSalaries:{[]
  t:`EMPLOYEE_ID xasc select EMPLOYEE_ID,SALARY from EMPLOYEE where SALARY>5000,MONTHS<10;
  {" " sv string value x} each t
 };
/ =============================================================
