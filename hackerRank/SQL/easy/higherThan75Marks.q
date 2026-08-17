.quiz.hackerRank.sql.higherThan75Marks.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Higher Than 75 Marks";
    -1 "======================================";
    -1 "";
    -1 "Query the names of students in STUDENTS who scored higher than";
    -1 "75 marks, ordered by descending marks. If two students have the";
    -1 "same marks, keep the row that appears first in STUDENTS.";
    -1 "";
    -1 "Table: STUDENTS(ID;NAME;MARKS)";
    -1 "";
    -1 "Task:";
    -1 "- Return NAME where MARKS>75, ordered by MARKS descending";
    -1 "";
    -1 "Function Description:";
    -1 "higherThan75Marks takes no arguments - query the global STUDENTS";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, ordered by descending marks";
 };


/ Solution Info ===============================================
/ higherThan75Marks[]

higherThan75Marks:{[]
  exec NAME from `MARKS xdesc select from STUDENTS where MARKS>75
 };
/ =============================================================
