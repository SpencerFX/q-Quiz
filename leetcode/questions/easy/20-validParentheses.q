/ Question Info ===============================================
/ Valid Parentheses

/ Given a string containing just the characters
/ '(', ')', '{', '}', '[' and ']', determine if the input
/ string is valid.

/ A string is valid if:
/ - Every open bracket is closed by the same type of bracket
/ - Open brackets are closed in the correct order
/ - Every close bracket has a matching open bracket

/ Example 1:
/ Input: "()[]{}"
/ Output: true

/ Example 2:
/ Input: "(]"
/ Output: false

/ Example 3:
/ Input: "([)]"
/ Output: false
/ (wrong order - the '[' is closed before it should be)

/ Function Description:
/ isValid takes:
/   - s: string of bracket characters

/ Returns:
/   - boolean

/ Constraints:
/ - 1 ≤ length(s) ≤ 10^4
/ - s consists only of '(', ')', '{', '}', '[' and ']'

/ Notes:
/ - An empty stack at the end (all brackets matched) is
/   required for a valid string, not just "no mismatches seen"

/ Goal:
/ - Solve with a single pass using a stack
/ =============================================================


/ Solution Info ===============================================
/ isValid "()[]{}"

isValid:{[s]
  openChars:"([{";
  closeChars:")]}";
  matchOf:closeChars!openChars;
  step:{[matchOf;openChars;closeChars;acc;c]
    stack:acc 0;
    ok:acc 1;
    if[not ok; :acc];
    $[c in openChars;
      (stack,c;1b);
      c in closeChars;
      $[(0=count stack) or matchOf[c]<>last stack;
        (stack;0b);
        (-1_stack;1b)
       ];
      (stack;ok)
     ]
   }[matchOf;openChars;closeChars;;];
  final:step/[(();1b);s];
  (final 1)&0=count final 0
 }
/ =============================================================
