//====================================================================
// leetcode — medium inputs
//
// One case per problem, taken from the worked example already given
// in each question file's "Solution Info" usage line.
//
// Keyed by the question filename's title slug (eg
// longestSubstringWithoutRepeatingCharacters), not the reference
// function's name inside the file (lengthOfLongestSubstring) - the
// two only happen to match for addTwoNumbers. web_api.q's
// .web.leetcodeInfoLines looks the question file up by this same
// slug, so problem identity has to track the filename, not whatever
// the canonical solution function is called.
//====================================================================

.inputs.leetcode.medium: (!) . flip raze 2 cut
    (
        (`addTwoNumbers; (2 4 3; 5 6 4));
        (`longestSubstringWithoutRepeatingCharacters; enlist "abcabcbb");
        (`longestPalindromicSubstring; enlist "babad");
        (`zigzagConversion; ("PAYPALISHIRING"; 3));
        (`reverseInteger; enlist 123);
        (`containerWithMostWater; enlist 1 8 6 2 5 4 8 3 7);
        (`integerToRoman; enlist 1994);
        (`threeSum; enlist -1 0 1 2 -1 -4);
        (`letterCombinationsOfAPhoneNumber; enlist "23")
    );
