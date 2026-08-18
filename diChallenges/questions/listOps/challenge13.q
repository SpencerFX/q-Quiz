/ Question Info ===============================================
/ Best Run Length

/ Run Length Encoding is a basic form of lossless compression -
/ an array of data, or a subset of the array, can be converted
/ into a smaller subset (a run) which repeats some number of
/ times (a length). For example:

/ "ABCABCABCABCABC"

/ could become:

/ 5 "ABC"

/ Here, 15 characters have been converted into an integer and 3
/ characters.

/ Your input contains a list of strings - they each contain a
/ repeated sequence like the one above, however there are some
/ extra characters on the beginning and end. Once these
/ characters have been removed, what is the sum of the counts
/ of the most repeated blocks in each string?

/ For example:
/ "AAAAAAB"

/ could be broken down into 2 counts of "AAA", 3 counts of "AA"
/ or 6 counts of "A" - thus "A" is the most-repeated block and
/ the answer for this string is 6. If your entire input
/ consisted of two copies of this string, the challenge answer
/ would be 12.

/ Task:
/ - For each input string, find whichever contiguous substring
/   can be expressed as some block repeated the most times
/   (this automatically strips any non-repeating characters at
/   the start/end, since including them would break the
/   periodicity)
/ - Sum that best repeat count across every string in the input

/ Example:
/ strs = "AAAAAAB" "AAAAAAB"

/ sumBestCounts[strs]

/ Each string's best decomposition is "A" repeated 6 times (the
/ trailing "B" isn't part of any valid repeat, so it's the
/ "extra character" that gets excluded)

/ Result:
/ 12

/ Function Description:
/ sumBestCounts takes:
/   - strs: list of strings

/ Returns:
/   - sum, across all strings, of the highest repeat count
/     achievable by any (block;count) decomposition of any
/     contiguous substring of that string

/ Input Format:
/ - One string per line

/ Constraints:
/ - 1 ≤ count strs
/ - each string is non-empty

/ Notes:
/ - "Most repeated" means highest count, which corresponds to
/   the smallest valid block for the best substring found -
/   e.g. "AAAAAA" is 2 counts of "AAA" or 6 counts of "A"; 6
/   wins
/ - The extra characters are only ever at the very start and/or
/   end - once removed, what's left is an exact whole-number
/   repetition of some block, same as the "ABCABC..." example
/ - A string with no real repeated block anywhere still has a
/   trivial answer of 1 (itself, once)

/ Goal:
/ - Brute force over substrings/divisors is fine for
/   quiz-sized strings; no need to hand-optimise for very long
/   inputs
/ =============================================================


/ Solution Info ===============================================
/ bestBlockCount["ABCABCABCABCABC"]
/ bestBlockCount["AAAAAAB"]
/ sumBestCounts[("AAAAAAB";"AAAAAAB")]

bestBlockCount:{[s]
  n:count s;
  results:raze raze {[s;n;i]
    {[s;i;j]
      sub:s i+til (j-i)+1;
      L:count sub;
      ds:1+where 0=L mod 1+til L;
      {[sub;L;d]
        cnt:L div d;
        blk:d#sub;
        $[sub~raze cnt#enlist blk; cnt; 0]
       }[sub;L;] each ds
     }[s;i;] each i+til n-i
   }[s;n;] each til n;
  max results
 };

sumBestCounts:{[strs] sum bestBlockCount each strs }
/ =============================================================
