.quiz.hackerRank.sql.theBlunder.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - The Blunder";
    -1 "======================================";
    -1 "";
    -1 "Samantha was tasked with calculating the average monthly";
    -1 "salaries in EMPLOYEES, but her query accidentally divided every";
    -1 "SALARY by 1000 with integer division before averaging - losing";
    -1 "precision on each individual row instead of just the final";
    -1 "result. Find the positive difference between the correctly";
    -1 "rounded average salary and her incorrectly rounded average.";
    -1 "";
    -1 "Table: EMPLOYEES(EMPLOYEE_ID;SALARY)";
    -1 "";
    -1 "Task:";
    -1 "- Return round[avg SALARY] - round[avg SALARY div 1000]";
    -1 "";
    -1 "Function Description:";
    -1 "theBlunder takes no arguments - query the global EMPLOYEES";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A single integer difference";
 };


/ Solution Info ===============================================
/ theBlunder[]

theBlunder:{[]
  salaries:exec SALARY from EMPLOYEES;
  correct:`long$0.5+avg salaries;
  blundered:`long$0.5+avg (salaries div 1000);
  correct-blundered
 };
/ =============================================================
