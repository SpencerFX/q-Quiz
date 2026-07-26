/Question Info ===============================================
/
Grading Students

HackerLand University has the following grading policy:

- Every student receives a grade in the inclusive range from 0 to 100
- Any grade less than 40 is a failing grade

Sam is a professor at the university and likes to round each
student's grade according to these rules:

- If the difference between the grade and the next multiple of 5
  is less than 3, round the grade up to the next multiple of 5
- If the grade is less than 38, no rounding occurs

Task:
- Apply the rounding rules to each grade
- Return the updated list of grades

Example:
grades = 73 67 38 33

Process:
73 → next multiple of 5 is 75 → diff = 2 → round → 75
67 → next multiple of 5 is 70 → diff = 3 → no round → 67
38 → next multiple of 5 is 40 → diff = 2 → round → 40
33 → less than 38 → no round → 33

Result:
75 67 40 33

Function Description:
gradingStudents takes:
  - grades: array of integers representing student grades

Returns:
  - array of integers representing rounded grades

Input Format:
- First line: integer n (number of students)
- Next n lines: each line contains a single integer grade

Output Format:
- Return the array of updated grades

Constraints:
- 1 ≤ n ≤ 60
- 0 ≤ grades[i] ≤ 100

Notes:
- Rounding applies only if grade ≥ 38
- Find the next multiple of 5:
    next = grade + (5 - grade mod 5)
- If (next - grade) < 3 → round up
- Otherwise → keep original grade

Goal:
- Correctly apply rounding logic
- Handle edge cases around multiples of 5
\
/=============================================================


/ Input Info ==================================================
input: 73 67 38 33;
/ =============================================================


/ Solution Info ===============================================
/ gradingStudents input
gradingStudents:{[x]x + ((5 - x mod 5) * ((x>=38) & (5 - x mod 5) < 3))};
/ =============================================================