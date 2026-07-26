/Question Info ===============================================
/
Apple and Orange

Sam's house has an apple tree and an orange tree that yield fruit.

- The house is located between points s and t (inclusive)
- The apple tree is located at point a
- The orange tree is located at point b

When a fruit falls from its tree, it lands d units away from its tree.

- Apples fall at distances given in array apples
- Oranges fall at distances given in array oranges

Task:
- Determine how many apples and oranges land on Sam's house

Example:
s = 7, t = 11
a = 5, b = 15
apples = -2 2 1
oranges = 5 -6

Apple land positions:
5 + (-2) = 3
5 + 2 = 7
5 + 1 = 6

→ Apples on house (7 to 11): 1

Orange land positions:
15 + 5 = 20
15 + (-6) = 9

→ Oranges on house (7 to 11): 1

Result:
1
1

Function Description:
countApplesAndOranges takes:
  - s: integer (start of house range)
  - t: integer (end of house range)
  - a: integer (position of apple tree)
  - b: integer (position of orange tree)
  - apples: array of integers (distances apples fall)
  - oranges: array of integers (distances oranges fall)

Returns:
  - None (prints two integers on separate lines)

Input Format:
- First line: two integers s and t
- Second line: two integers a and b
- Third line: two integers m and n (counts of apples and oranges)
- Fourth line: m space-separated integers (apples distances)
- Fifth line: n space-separated integers (oranges distances)

Output Format:
- First line: number of apples on the house
- Second line: number of oranges on the house

Constraints:
- 1 ≤ s < t ≤ 10^5
- 1 ≤ a < b ≤ 10^5
- 1 ≤ m, n ≤ 10^5
- -10^5 ≤ apples[i], oranges[i] ≤ 10^5

Notes:
- Final position of fruit:
    applePosition = a + apples[i]
    orangePosition = b + oranges[i]
- Count how many fall within range [s, t]
- Inclusive bounds: s ≤ position ≤ t

Goal:
- Correctly compute landing positions
- Efficiently count fruits within the house range
\
/=============================================================


/ Input Info ==================================================
/s:7; 
/t:11;
/a:5; 
/b:15;
/apples:-2 2 1;
/oranges:5 -6;
/ =============================================================


/ Solution Info ===============================================
/appleAndOrange[s;t;a;b;apples;oranges]
appleAndOrange:{[s;t;a;b;apples;oranges]
  applePos:a + apples;
  orangePos:b + oranges;
  appleHits:sum ((applePos>=s) & (applePos<=t));
  orangeHits:sum ((orangePos>=s) & (orangePos<=t));
  (appleHits; orangeHits)
 };
/ =============================================================