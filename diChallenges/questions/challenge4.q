/ Question Info ===============================================
/ Sum Of Coprimes

/ Co-primes, while not being the most exciting thing in the
/ world, are extremely useful for cryptography (among other
/ things). Numbers are co-prime if they don't share any common
/ factors above 1.

/ For example, 15 and 8 are not prime, but have factors of
/ 3 5 and 2 4 respectively, and so are co-prime. 15 and 9 are
/ not co-prime, since they share a factor of 3.

/ For your input number, what is the sum of the positive
/ co-primes of that number which are less than that number?

/ For example, the coprimes of 15 are
/ 1 2 4 7 8 11 13 14

/ If your input was 15, the answer would be 60.

/ Task:
/ - Find every positive integer less than n that shares no
/   common factor greater than 1 with n
/ - Sum those values

/ Example:
/ n = 15

/ Coprimes: 1 2 4 7 8 11 13 14

/ Result:
/ 60

/ Function Description:
/ sumCoprimes takes:
/   - n: input number

/ Returns:
/   - sum of the positive integers less than n that are
/     coprime with n

/ Input Format:
/ - Single line containing the integer n

/ Constraints:
/ - 1 ≤ n

/ Notes:
/ - Two numbers are coprime if their greatest common divisor
/   is 1 - neither number needs to be prime itself
/ - n=1 has no positive integers below it, so the sum is 0

/ Goal:
/ - Solve without a hardcoded factor/prime lookup table
/ =============================================================


/ Solution Info ===============================================
/ sumCoprimes[15]

gcd:{[a;b] $[b=0;a;.z.s[b;a mod b]] };

sumCoprimes:{[n]
  cands:1+til n-1;
  sum cands where 1=gcd[n;] each cands
 }
/ =============================================================
