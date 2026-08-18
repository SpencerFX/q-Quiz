.quiz.hackerRank.sql.typeOfTriangle.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - Type of Triangle";
    -1 "======================================";
    -1 "";
    -1 "Each row of TRIANGLES gives the lengths of three sides of a";
    -1 "triangle. Classify each row as Equilateral (all sides equal),";
    -1 "Isosceles (exactly two sides equal), Scalene (all sides";
    -1 "different, but a valid triangle), or Not A Triangle (the";
    -1 "triangle inequality fails).";
    -1 "";
    -1 "Table: TRIANGLES(A;B;C)";
    -1 "";
    -1 "Task:";
    -1 "- Classify every row, in row order";
    -1 "";
    -1 "Function Description:";
    -1 "typeOfTriangle takes no arguments - query the global TRIANGLES";
    -1 "table directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A symbol list, one classification per row, in row order";
 };


/ Solution Info ===============================================
/ typeOfTriangle[]

typeOfTriangle:{[]
  classify:{[a;b;c]
    valid:(a+b>c) and (a+c>b) and (b+c>a);
    abEqual:a=b;
    bcEqual:b=c;
    acEqual:a=c;
    $[
      not valid; `$"Not A Triangle";
      abEqual and bcEqual; `Equilateral;
      abEqual or bcEqual or acEqual; `Isosceles;
      `Scalene
    ]
   };
  classify'[exec A from TRIANGLES;exec B from TRIANGLES;exec C from TRIANGLES]
 };
/ =============================================================
