/ Question Info ===============================================
/ T9 Decoder

/ Some people might remember T9 phone inputs, in which the
/ numbers 2 to 9 have associated letters, and 0 acts as a
/ space. Key 2 has "abc", 3 has "def" etc:

/   1   2   3
/      abc def

/   4   5   6
/  ghi jkl mno

/   7   8   9
/ pqrs tuv wxyz

/       0
/       _

/ Note that 0 is a space, not an underscore!

/ To get a letter you press the button a certain number of
/ times - pressing 2 once gives "a", twice gives "b".

/ The input is a list of number pairs: a key and the number of
/ times it has been pressed. For example, "7 3" would be "r".
/ What is the message this input produces?

/ Task:
/ - Decode a flat list of (key;presses) pairs into a message,
/   one letter per pair

/ Example:
/ xs = 7 3

/ decodeMessage[7 3]

/ Result:
/ "r"

/ Function Description:
/ decodeMessage takes:
/   - xs: flat list of integers, read two at a time as
/     (key; presses) pairs

/ Returns:
/   - decoded message string

/ Input Format:
/ - Single line containing the flat list of key/press pairs

/ Constraints:
/ - count xs is even and count xs ≥ 2
/ - key is in 0-9 (1 never appears - it has no letters)
/ - presses is a valid 1-based index into that key's letters
/   (1 for key 0, since it only maps to a space)

/ Notes:
/ - Key layout: 2 abc, 3 def, 4 ghi, 5 jkl, 6 mno, 7 pqrs,
/   8 tuv, 9 wxyz, 0 space
/ - Key 1 has no letters and should not appear in valid input

/ Goal:
/ - Solve for an arbitrary-length list of pairs, not just one
/ =============================================================


/ Solution Info ===============================================
/ decodeMessage[7 3]
/ decodeMessage[4 2 4 3 0 1 8 1 4 2 3 2 7 3 3 2]

keyMap:(0 1 2 3 4 5 6 7 8 9)!(enlist " ";"";"abc";"def";"ghi";"jkl";"mno";"pqrs";"tuv";"wxyz");

decodeKey:{[k;n] (keyMap k)[n-1] };

decodeMessage:{[xs]
  pairs:2 cut xs;
  raze {decodeKey . x} each pairs
 }
/ =============================================================
