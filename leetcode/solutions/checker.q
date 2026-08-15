//====================================================================
// leetcode — checker
//
// leetcode's inputs/solutions are split by difficulty
// (.inputs.leetcode.easy/medium/hard, .solutions.leetcode.easy/
// medium/hard) rather than by kind, so this mirrors
// hackerRank/Solutions/checker.q's category-lookup shape rather than
// diChallenges/solutions/checker.q's kind-lookup shape. Kept as its
// own .leet.ref.dict / .leet.input.dict rather than folding into
// hackerRank's .checker.ref.dict, so the two problem sets can never
// collide on a problem name. Reuses .checker.normalise (defined in
// hackerRank/Solutions/checker.q, loaded before leetcode during
// .quiz.init[]) so equality is judged the same way across all three
// sections.
//====================================================================

/ Table to store results in memory
resultsLeetcode: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); difficulty:`$());

leetcodeDifficulties:`easy`medium`hard;

/ difficulty symbol -> fully-qualified path to that difficulty's inputs / solutions dict
.leet.input.dict: leetcodeDifficulties!{` sv `.inputs.leetcode,x} each leetcodeDifficulties;
.leet.ref.dict: leetcodeDifficulties!{` sv `.solutions.leetcode,x} each leetcodeDifficulties;

confirmLeetcodeDifficulty:{[problemName]
    mapDict: (key .leet.input.dict)!{x in key value y}[problemName;] each value .leet.input.dict;
    first where mapDict = 1b
 };

/ Run a problem's single case against a candidate function, without
/ printing or recording anything. Shared by the console checker and
/ the web judge (web/q/web_api.q) so both grade the same way.
.checker.gradeLeetcode:{[problemName;func]
    difficulty:confirmLeetcodeDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    input:(value .leet.input.dict difficulty) problemName;
    expected:(value .leet.ref.dict difficulty) problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    `problem`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;difficulty;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };

/ Function to check for success
checkLeet:{[problemName; function]
    st:.z.p;
    result:.checker.gradeLeetcode[problemName;function];
    $[result`pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    insert[`resultsLeetcode; (problemName; result`pass; result`caseActual; result`caseExpected; st; et; result`difficulty)];
    insert[`.quiz.history; (problemName; first result`caseActual; first result`caseExpected; result`pass; `Leetcode)];
 };

/ checkLeet[`twoSum; twoSum]
/ checkLeet[`addTwoNumbers; addTwoNumbers]
/ checkLeet[`longestSubstringWithoutRepeatingCharacters; lengthOfLongestSubstring]
/ checkLeet[`longestPalindromicSubstring; longestPalindrome]
/ checkLeet[`zigzagConversion; convertZigZag]
/ checkLeet[`medianOfTwoSortedArrays; findMedianSortedArrays]
