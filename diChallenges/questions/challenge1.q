/ Question Info ===============================================
/ Colour Hex Conversion

/ Setting a colour attribute on your webpage can be much more
/ interesting than it appears - HTML/CSS will take any string
/ and convert it into a hexadecimal representation for use in
/ a webpage. For instance, text with tag:

/ body bgcolor="kdb4life"

/ produces a nice blue colour.

/ The conversion process happens like so:
/ - Set the string's non-hexadecimal characters to 0.
/ - Pad the string length to the next multiple of 3.
/ - Split the result into 3 equal sections.
/ - The first two digits of each remaining section are the
/   hex components.

/ Above, "kdb4life" as an input string becomes 0d40fe.

/ Task:
/ - Convert an input string into its six-character colour
/   hex output using the process described above

/ Example:
/ s = "kdb4life"

/ Non-hex chars zeroed:  "0db400fe"
/ Padded to multiple of 3: "0db400fe0"
/ Split into 3 sections:  "0db" "400" "fe0"
/ First two digits each:  "0d" "40" "fe"

/ Result:
/ "0d40fe"

/ Function Description:
/ colourHex takes:
/   - s: input string

/ Returns:
/   - six-character colour hex string

/ Input Format:
/ - Single line containing the input string

/ Constraints:
/ - 1 ≤ count s
/ - Hex characters are 0-9 and a-f (case-insensitive)

/ Notes:
/ - "Non-hexadecimal" means any character not in 0-9a-f
/ - Padding characters count as non-hexadecimal (i.e. 0)

/ Goal:
/ - Solve without hardcoding the padding/section logic to a
/   fixed input length
/ =============================================================


/ Solution Info ===============================================
/ colourHex["kdb4life"]

colourHex:{[s]
  s:$[-10h=type s; enlist s; s];
  hexChars:"0123456789abcdef";
  s:lower s;
  s:{$[x in y; x; "0"]}[;hexChars] each s;

  pad:mod[3 - mod[count s;3]; 3];
  s,:pad#"0";

  secLen:(count s) div 3;
  sections:secLen cut s;

  raze 2#'sections
 }
/ =============================================================
