/ Question Info ===============================================
/ Longest Common Prefix

/ Given a list of strings, find the longest string that is a
/ prefix of every string in the list.

/ Task:
/ - Find the longest common leading substring shared by every
/   string in the input
/ - If there is none, return the empty string

/ Example 1:
/ Input: ["flower", "flow", "flight"]
/ Output: "fl"

/ Example 2:
/ Input: ["dog", "racecar", "car"]
/ Output: ""
/ (no common prefix at all)

/ Function Description:
/ longestCommonPrefix takes:
/   - strs: list of strings

/ Returns:
/   - the longest shared prefix (string, possibly empty)

/ Constraints:
/ - 1 ≤ count strs ≤ 200
/ - 0 ≤ length of each string ≤ 200

/ Notes:
/ - The prefix only needs to match up to the length of the
/   shortest string in the list

/ Goal:
/ - Compare column-by-column rather than string-by-string
/ =============================================================


/ Solution Info ===============================================
/ longestCommonPrefix ("flower";"flow";"flight")

longestCommonPrefix:{[strs]
  if[0=count strs; :""];
  minLen:min count each strs;
  if[minLen=0; :""];
  trimmed:{y#x}[;minLen] each strs;
  columns:flip trimmed;
  matches:{all x=first x} each columns;
  prefixLen:$[all matches; minLen; first where not matches];
  prefixLen#first strs
 }
/ =============================================================
