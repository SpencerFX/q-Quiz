/ Question Info ===============================================
/ Full Precision Product

/ It's 2022 and, due to a hiring mishap, the 2007 head of the
/ Zimbabwean central bank is now running the entire UK economy,
/ and inflation has been stuck at 1000000% for the last 4
/ years. AquaQ is still the best kdb consultancy in the land,
/ but this year we're going to need to start regularly handling
/ numbers greater than nine quintillion pounds.

/ To help prepare your mind (and body), enter the product of
/ all numbers in your input (while keeping full precision!) in
/ the box below.

/ For example input:
/ 2
/ 4
/ 8

/ A function and answer would look like:
/ f[(2;4;8)]
/ 64

/ Task:
/ - Multiply every number in the input together
/ - Keep exact, full precision - the product can comfortably
/   exceed the ~9.22 quintillion ceiling of a 64-bit long, so
/   native long multiplication is not safe to use directly

/ Example:
/ xs = 2 4 8

/ bigProduct[(2;4;8)]

/ Result:
/ "64"

/ Function Description:
/ bigProduct takes:
/   - xs: list of non-negative integers

/ Returns:
/   - exact product of every number in xs, as a decimal string
/     (a plain numeric type can't hold the full result once it
/     grows past 64 bits)

/ Input Format:
/ - One number per line

/ Constraints:
/ - 1 ≤ count xs
/ - each individual input value fits in a 64-bit long - it is
/   only the product that can overflow

/ Notes:
/ - Multiply via long multiplication on the decimal digits
/   directly (schoolbook grade-school multiplication), carrying
/   between digit positions, rather than relying on any
/   built-in fixed-width numeric type for the product itself

/ Goal:
/ - Verify correctness against a case that would silently
/   overflow a 64-bit long, not just small examples like 2 4 8
/ =============================================================


/ Solution Info ===============================================
/ bigProduct[(2;4;8)]
/ bigProduct[(99999999999;99999999999;99999999999)]

digitsLSF:{[n] reverse "I"$'string n };

stripLeadingZeros:{[digs] while[(1<count digs) and 0=last digs; digs:-1_digs]; digs };

bigMulPair:{[a;b]
  m:count a; n:count b;
  prod:{[prod;i;a;b;n] prod[i+til n]+:a[i]*b; prod}[;;a;b;n]/[(m+n)#0;til m];
  st:{[st;x] c:st`c; v:x+c; `c`d!(v div 10; (st`d),v mod 10)}/[`c`d!(0;`long$());prod];
  digs:st`d;
  c:st`c;
  while[c>0; digs,:c mod 10; c:c div 10];
  stripLeadingZeros digs
 };

digitsToStr:{[digs] "" sv string reverse digs };

bigProduct:{[xs] digitsToStr bigMulPair/[digitsLSF each xs] }
/ =============================================================
