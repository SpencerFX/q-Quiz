/ Question Info ===============================================
/ Longest Substring Without Repeating Characters

/ Given a string s, find the length of the longest
/ substring without repeating characters.

/ A substring is a contiguous sequence of characters
/ within the string.

/ Task:
/ - Identify substrings with all unique characters
/ - Return the length of the longest such substring

/ Example 1:
/ s = "abcabcbb"

/ Substrings without repeats:
/ "abc" → length 3
/ "bca" → length 3
/ "cab" → length 3

/ Result:
/ 3

/ Example 2:
/ s = "bbbbb"

/ Substrings:
/ "b" → length 1

/ Result:
/ 1

/ Example 3:
/ s = "pwwkew"

/ Substrings:
/ "wke" → length 3

/ Result:
/ 3

/ Function Description:
/ lengthOfLongestSubstring takes:
/   - s: string (char list)

/ Returns:
/   - integer representing max substring length

/ Input Format:
/ - Single string s

/ Constraints:
/ - 0 ≤ count s ≤ 5 * 10^4
/ - s consists of ASCII characters

/ Notes:
/ - Substring must be contiguous
/ - Characters cannot repeat within substring
/ - Order matters

/ Goal:
/ - Solve efficiently in O(n) time
/ - Avoid checking all substrings (O(n^2))
/ =============================================================

/ Solution Info ===============================================
/ lengthOfLongestSubstring "abcabcbb"
/ lengthOfLongestSubstring "bbbb"
lengthOfLongestSubstring:{[s]
  / substring generator
  subs:distinct {x@raze{{{y+til x}[x] each til y}[x[0];x[1]]} each a,'reverse a:1+til count x} s;

  / keep only substrings with all unique characters
  valid:subs where (count each distinct each subs) = count each subs;
  
  / return maximum length
  max count each valid
 };
/ =============================================================