/ Question Info ===============================================
/ Matching Dice Faces

/ In front of you are two dice. You know the numbers on the
/ front, left, and top faces of each. Through your exquisite
/ knowledge of dice trivia, you are also aware the numbers on
/ opposite faces of a die add up to 7. The faces are like so:

/ Dice 1:
/   Front: 1
/   Left:  2
/   Top: 3

/ Dice 2:
/   Front: 1
/   Left:  3
/   Top: 2

/ You're provided with a series of directions - up (U), down
/ (D), left (L), or right (R), to spin the current front face
/ of each dice. If you spin the dice in the same direction at
/ each step of the input "LRDLU", the front faces after each of
/ these five instructions would be:

/ Ins. Dice1 Dice2
/ 0     5     4
/ 1     1     1
/ 2     3     2
/ 3     5     4
/ 4     1     1

/ Above, it's clear the front faces match after instruction
/ indices 1 and 4 (starting from 0).

/ After spinning the dice according to your input instructions,
/ what is the sum of the indices where the front faces match?
/ For the example above the answer would be 5, since the dice
/ show a pair of ones after instruction 1 and instruction 4.

/ Task:
/ - Track each die's front face after every instruction
/ - Sum the (0-based) instruction indices where both dice show
/   the same front face

/ Example:
/ dice1 = front 1, left 2, top 3
/ dice2 = front 1, left 3, top 2
/ instr = "LRDLU"

/ Dice1 fronts: 5 1 3 5 1
/ Dice2 fronts: 4 1 2 4 1
/ Matching indices: 1 4

/ Result:
/ 5

/ Function Description:
/ sumMatchingIndices takes:
/   - f1;l1;t1: front, left, top of dice 1
/   - f2;l2;t2: front, left, top of dice 2
/   - instr: string of U/D/L/R instructions applied to both
/     dice at each step

/ Returns:
/   - sum of the instruction indices where the two dice have
/     matching front faces

/ Input Format:
/ - Front, left, top of dice 1
/ - Front, left, top of dice 2
/ - Single line containing the instruction string

/ Constraints:
/ - 1 ≤ count instr
/ - instr only contains the characters U, D, L and R
/ - front/left/top values are a valid die face triple, each
/   in 1-6, with no face equal to its own opposite (7-face)

/ Notes:
/ - Opposite faces always sum to 7, so back = 7-front,
/   right = 7-left, bottom = 7-top
/ - U/D pivot the front/top/back/bottom faces (left/right
/   unchanged); L/R pivot the front/left/back/right faces
/   (top/bottom unchanged)

/ Goal:
/ - Solve with a single scan per die over the instructions
/ =============================================================


/ Solution Info ===============================================
/ sumMatchingIndices[1;2;3;1;3;2;"LRDLU"]

initDie:{[f;l;t] `F`Ba`T`Bo`L`R!(f;7-f;t;7-t;l;7-l) };

rollFn:{[d;dir]
  $[dir="U"; `F`Ba`T`Bo`L`R!(d`Bo;d`T;d`F;d`Ba;d`L;d`R);
    dir="D"; `F`Ba`T`Bo`L`R!(d`T;d`Bo;d`Ba;d`F;d`L;d`R);
    dir="L"; `F`Ba`T`Bo`L`R!(d`R;d`L;d`T;d`Bo;d`F;d`Ba);
    dir="R"; `F`Ba`T`Bo`L`R!(d`L;d`R;d`T;d`Bo;d`Ba;d`F);
    d]
 };

frontSeq:{[f;l;t;instr] {x`F} each rollFn\[initDie[f;l;t];instr] };

sumMatchingIndices:{[f1;l1;t1;f2;l2;t2;instr]
  s1:frontSeq[f1;l1;t1;instr];
  s2:frontSeq[f2;l2;t2;instr];
  sum where s1=s2
 }
/ =============================================================
