/ Question Info ===============================================
/ Sparse Arrays

/ You are given a collection of input strings and a list of query strings.
/ For each query string, determine how many times it appears in the input list.
 
/ Task:
/ - Count the frequency of each query string in the input strings
/ - Return the results as an array of integers

/ Example:
/ strings = ["ab", "ab", "abc"]
/ queries = ["ab", "abc", "bc"]

/ Output:
/ [2, 1, 0]

/ Explanation:
/ - "ab" appears 2 times
/ - "abc" appears 1 time
/ - "bc" appears 0 times

/ Function Description:
/ matchingStrings takes:
/   - strings: array of input strings
/   - queries: array of query strings

/ Returns:
/   - array of integers representing counts for each query

/ Input Format:
/ - First line: integer n (number of input strings)
/ - Next n lines: each line contains a string
/ - Next line: integer q (number of queries)
/ - Next q lines: each line contains a query string

/ Constraints:
/ - 1 ≤ n, q ≤ 10^5
/ - Length of each string ≤ 20

/ Notes:
/ - Strings may repeat
/ - Queries may repeat
/ - Efficient counting is required (avoid nested loops)
/ - Consider using a frequency map / dictionary

/ Goal:
/ - Preprocess input strings
/ - Answer each query efficiently
/ =============================================================


/ Solution Info ===============================================
matchingStrings:{[s;q] 0^((count each group s) q)}

/ =============================================================

/ Input =======================================================
strs:("ab";"ab";"abc")
queries:("ab";"abc";"bc")
/ =============================================================
