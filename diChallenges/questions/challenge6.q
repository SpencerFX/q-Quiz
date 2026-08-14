/ Question Info ===============================================
/ Summable Components

/ It can be useful to know how to break down a number - usually
/ this is done with factors, but instead, let's try it with
/ summable components. For a number, you can work out the
/ possible combinations of non-negative integers which sum to
/ that number. For example, these are the combinations of
/ three numbers which sum to 3:

/ 0 0 3
/ 0 1 2
/ 0 2 1
/ 0 3 0
/ 1 0 2
/ 1 1 1
/ 1 2 0
/ 2 0 1
/ 2 1 0
/ 3 0 0

/ The digit "1" occurs 9 times above. For your input, how many
/ times does the character "1" appear in all combinations
/ summing to that number?

/ Note the number "11" would be twice, "21" once, so 1 21 11
/ would be 4 times.

/ Task:
/ - Generate every ordered triple of non-negative integers
/   (a;b;c) with a+b+c = n
/ - Count every occurrence of the digit "1" across the decimal
/   representation of every number in every triple

/ Example:
/ n = 3

/ Combinations (10 total, listed above)

/ Result:
/ 9

/ Function Description:
/ sumOnesForN takes:
/   - n: input number

/ Returns:
/   - total count of the digit "1" across every number in
/     every ordered triple summing to n

/ Input Format:
/ - Single line containing the integer n

/ Constraints:
/ - 0 ≤ n

/ Notes:
/ - Multi-digit numbers can contribute more than one "1" -
/   "11" counts twice, "21" counts once
/ - Order matters: 0 1 2 and 0 2 1 are distinct combinations

/ Goal:
/ - Avoid materialising every full triple; count digit "1"
/   occurrences per component value directly
/ =============================================================


/ Solution Info ===============================================
/ sumOnesForN[3]

countOnes:{[n] sum "1"=string n};

sumOnesForN:{[n]
  as:til n+1;
  sum {[n;a]
    bs:til (n-a)+1;
    cs:(n-a)-bs;
    ((count bs)*countOnes[a])
      + (sum countOnes each bs)
      + (sum countOnes each cs)
   }[n;] each as
 }
/ =============================================================
