/ Question Info ===============================================
/ Longest Palindromic Substring

/ Given a string s, return the longest palindromic substring.

/ A palindrome is a string that reads the same forward and backward.

/ Example 1:
/ Input: "babad"
/ Output: "bab" or "aba"

/ Example 2:
/ Input: "cbbd"
/ Output: "bb"

/ Function Description:
/ longestPalindrome takes:
/   - s: input string

/ Returns:
/   - longest palindromic substring

/ Constraints:
/ - 1 ≤ length of s ≤ 1000
/ - s consists of English letters

/ Goal:
/ - Find the longest substring that is a palindrome
/ - Prefer correctness over optimality (expand approach)
/ =============================================================


/ Solution Info ===============================================
/ longestPalindrome "babad"

longestPalindrome:{[s]
    subs:distinct {x@raze{{{y+til x}[x] each til y}[x[0];x[1]]} each a,'reverse a:1+til count x} s;
    palindromes:  subs where {x~reverse x}each subs;
    longestIdx:first idesc count each palindromes;
    palindromes[longestIdx]
 };
/ =============================================================