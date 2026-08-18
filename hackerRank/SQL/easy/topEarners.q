.quiz.hackerRank.sql.topEarners.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Top Earners";
    -1 "======================================";
    -1 "";
    -1 "Each employee's total earnings is SALARY*MONTHS. Find the";
    -1 "maximum total earnings in EMPLOYEE and the number of employees";
    -1 "who share that maximum.";
    -1 "";
    -1 "Table: EMPLOYEE(EMPLOYEE_ID;NAME;MONTHS;SALARY)";
    -1 "";
    -1 "Task:";
    -1 "- Compute earnings=SALARY*MONTHS per employee";
    -1 "- Return the maximum earnings value and how many employees";
    -1 "  reach it";
    -1 "";
    -1 "Function Description:";
    -1 "topEarners takes no arguments - query the global EMPLOYEE table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single string, \"MAXEARNINGS COUNT\"";
 };


/ Solution Info ===============================================
/ topEarners[]

topEarners:{[]
  earnings:exec SALARY*MONTHS from EMPLOYEE;
  topAmount:max earnings;
  topCount:count earnings where earnings=topAmount;
  " " sv (string topAmount; string topCount)
 };
/ =============================================================
