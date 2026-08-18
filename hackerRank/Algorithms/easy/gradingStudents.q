//====================================================================
// Grading Students
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.algorithms.gradingStudents.info[]
//====================================================================
.quiz.hackerRank.algorithms.gradingStudents.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Grading Students";
    -1 "";
    -1 "HackerLand University has the following grading policy:";
    -1 "";
    -1 "- Every student receives a grade in the inclusive range from 0 to 100";
    -1 "- Any grade less than 40 is a failing grade";
    -1 "";
    -1 "Sam is a professor at the university and likes to round each";
    -1 "student's grade according to these rules:";
    -1 "";
    -1 "- If the difference between the grade and the next multiple of 5";
    -1 "  is less than 3, round the grade up to the next multiple of 5";
    -1 "- If the grade is less than 38, no rounding occurs";
    -1 "";
    -1 "Task:";
    -1 "- Apply the rounding rules to each grade";
    -1 "- Return the updated list of grades";
    -1 "";
    -1 "Example:";
    -1 "grades = 73 67 38 33";
    -1 "";
    -1 "Process:";
    -1 "73 -> next multiple of 5 is 75 -> diff = 2 -> round -> 75";
    -1 "67 -> next multiple of 5 is 70 -> diff = 3 -> no round -> 67";
    -1 "38 -> next multiple of 5 is 40 -> diff = 2 -> round -> 40";
    -1 "33 -> less than 38 -> no round -> 33";
    -1 "";
    -1 "Result:";
    -1 "75 67 40 33";
    -1 "";
    -1 "Function Description:";
    -1 "gradingStudents takes:";
    -1 "  - grades: array of integers representing student grades";
    -1 "";
    -1 "Returns:";
    -1 "  - array of integers representing rounded grades";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: integer n (number of students)";
    -1 "- Next n lines: each line contains a single integer grade";
    -1 "";
    -1 "Output Format:";
    -1 "- Return the array of updated grades";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 60";
    -1 "- 0 <= grades[i] <= 100";
    -1 "";
    -1 "Notes:";
    -1 "- Rounding applies only if grade >= 38";
    -1 "- Find the next multiple of 5:";
    -1 "    next = grade + (5 - grade mod 5)";
    -1 "- If (next - grade) < 3 -> round up";
    -1 "- Otherwise -> keep original grade";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly apply rounding logic";
    -1 "- Handle edge cases around multiples of 5";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "grades:73 67 38 33;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ gradingStudents grades
gradingStudents:{[x]x + ((5 - x mod 5) * ((x>=38) & (5 - x mod 5) < 3))};
/ =============================================================


/ Solution Info (alternate) ====================================
/ Per-grade "each" with an explicit if/else, instead of one
/ vectorised arithmetic expression over the whole array.
/ gradingStudents2 grades
gradingStudents2:{[grades]
  {[g]
    diff:5 - g mod 5;
    $[(g>=38) and diff<3; g+diff; g]
   } each grades
 };
/ =============================================================
