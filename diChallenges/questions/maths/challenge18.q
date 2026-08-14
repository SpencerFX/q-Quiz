/ Question Info ===============================================
/ Nearest Palindromic Time

/ Some people say the best times in life are those among
/ friends or family. The actual best times however, are
/ palindromic:

/ 11:22:11

/ Your input is a list of times - for each time, how far away,
/ in seconds, is the nearest palindromic time, in hh:mm:ss
/ format? The answer is the sum of these differences.

/ For example, with input time:
/ 13:41:00

/ The nearest palindromic time is
/ 13:44:31

/ Which is 211 seconds away. Note that the nearest palindromic
/ time might be in the past - a time in the past is still a
/ positive number of seconds away.

/ Task:
/ - For each input time, find the closest time (earlier or
/   later in the day) whose hh:mm:ss digits read the same
/   forwards and backwards, and is itself a valid 24-hour clock
/   time
/ - Sum the absolute second-differences across all input times

/ Example:
/ times = enlist "13:41:00"

/ sumNearestPalindromeDist[times]

/ Nearest palindrome is 13:44:31, 211 seconds away

/ Result:
/ 211

/ Function Description:
/ sumNearestPalindromeDist takes:
/   - times: list of "hh:mm:ss" strings

/ Returns:
/   - sum, across all input times, of the number of seconds to
/     the nearest valid palindromic time

/ Input Format:
/ - One "hh:mm:ss" time per line (24-hour clock)

/ Constraints:
/ - Each input time is a valid 24-hour clock time
/ - 1 ≤ count times

/ Notes:
/ - A palindromic hh:mm:ss reads the same forwards and
/   backwards as a 6-digit string, e.g. "112211" for 11:22:11 -
/   this forces mm's two digits to match each other (mm is one
/   of 00,11,22,33,44,55) and ss to be hh's digits reversed
/ - Not every hour has a valid palindrome - if reversing hh's
/   digits gives a value of 60 or more, no palindrome exists for
/   that hour at all (e.g. hh=07 would need ss=70, which isn't a
/   real number of seconds), so the nearest one for a time deep
/   inside one of those hours can be more than an hour away
/ - Distance is a straight difference in seconds-of-day - it
/   does not wrap around midnight

/ Goal:
/ - Don't assume the nearest palindrome is always in the same
/   or an adjacent hour - search widely enough to be correct
/   even for times in an hour that has no palindrome of its own
/ =============================================================


/ Solution Info ===============================================
/ sumNearestPalindromeDist[enlist "13:41:00"]

parseTimeSecs:{[s] hh:"I"$2#s; mm:"I"$2#3_s; secs:"I"$6_s; (hh*3600)+(mm*60)+secs };

palindromeCandidates:{[]
  raw:raze {[hh]
    {[hh;mm]
      d1:hh div 10; d2:hh mod 10; secs:(d2*10)+d1;
      $[secs<60; (hh*3600)+(mm*60)+secs; 0N]
     }[hh;] each 0 11 22 33 44 55
   } each til 24;
  raw where not null raw
 };

nearestDist:{[cands;t] min abs cands-t };

sumNearestPalindromeDist:{[times]
  cands:palindromeCandidates[];
  sum nearestDist[cands;] each parseTimeSecs each times
 }
/ =============================================================
