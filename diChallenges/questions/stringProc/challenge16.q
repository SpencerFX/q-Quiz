/ Question Info ===============================================
/ ASCII Art Kerning

/ Nothing is more exciting than a bracing bout of typography.

/ Like most people, I am commonly unable to sleep because of
/ the knowledge that some letters around me are poorly spaced.
/ Today, this problem will be remedied for the equally-common
/ occurence of ascii art words. An alphabet of these words is
/ found here.

/ Kerning is the process of correctly spacing letter pairs to
/ make use of the white-space surrounding each letter. For
/ example, if I was joining the letters L and T together from
/ the above alphabet and putting a space between them, without
/ kerning, it would look like this:

/ #..... #####
/ #........#..
/ #........#..
/ #........#..
/ #........#..
/ ######...#..

/ All that wasted space between the top of the L and the top of
/ the T is frankly offensive. The rule that should be used to
/ join these together is to move the letters closer together
/ until the nearest horizontal points between them are
/ separated by a single space (filled with dots in this case to
/ show spacing). For example, the L and T following this rule
/ would look like:

/ #....#####
/ #......#..
/ #......#..
/ #......#..
/ #......#..
/ ######.#..

/ The T has been moved closer to the L until there is only one
/ space between them at the closest point, and there is no
/ overlap.

/ After drawing a box around this resulting combination of
/ letters which just encompasses all the "#", we can see there
/ are 51 spaces before applying kerning, and 39 after.
/ Subsequent letters would be joined onto this "LT" combination
/ in exactly the same way, following the single-space rule, and
/ treating the LT as a single character - for example "LTA"
/ would use some of the space under the right edge of the T,
/ and would end up looking like:

/ #....#####.##..
/ #......#..#..#.
/ #......#.#....#
/ #......#.######
/ #......#.#....#
/ ######.#.#....#

/ Using a total of 53 spaces.

/ Convert your input string into the appropriate ASCII
/ characters in the above link, and join them together while
/ applying the kerning rule - what is the total number of empty
/ spaces in the resulting set of strings?

/ Task:
/ - For each input word, look up each letter's ASCII-art glyph
/   and join them left to right, kerning each new letter onto
/   the combined shape so far: slide it left until the closest
/   approach between its ink and the existing shape's ink is
/   exactly one blank column, with no row actually overlapping
/ - Count the blank cells in the tight bounding box of the
/   result, and sum that count across every word in the input

/ Example:
/ alphabet contains at least L, T, A as shown above
/ words = "LT" "LTA"

/ sumEmptySpaces[alphabet;("LT";"LTA")]

/ "LT" kerns to 39 blank cells, "LTA" kerns to 53

/ Result:
/ 92

/ Function Description:
/ sumEmptySpaces takes:
/   - alphabet: dictionary mapping each character to its glyph
/     (a list of equal-length strings, one per row)
/   - words: list of words to render and kern

/ Returns:
/   - sum, across all words, of the blank-cell count in each
/     word's fully kerned bounding box

/ Input Format:
/ - The ASCII-art alphabet (from the referenced link)
/ - One word per line

/ Constraints:
/ - Every character in every word has an entry in the alphabet
/ - All glyphs in the alphabet share the same row count
/ - 1 ≤ count words, 1 ≤ count of each word

/ Notes:
/ - "Closest approach separated by a single space" means: for
/   every row, look at the gap between the rightmost ink of the
/   shape built so far and the leftmost ink of the next letter
/   in that row; the smallest such gap across all rows must be
/   exactly 1, and no row may have ink colliding (a gap < 1)
/ - After the second letter is placed, later letters kern
/   against the combined shape's silhouette, not just the
/   previous single letter - this is why "LTA" tucks the A in
/   under the T rather than leaving the L's outline untouched
/ - The bounding box is only ever as wide as the ink requires -
/   it never includes extra padding beyond the rightmost "#"

/ Goal:
/ - Solve for any word length and any alphabet passed in, not
/   just the two/three-letter examples above
/ =============================================================


/ Solution Info ===============================================
/ alphabet uses only L, T, A here since that's all the problem
/ text itself provides pixel data for - swap in the full
/ alphabet from the referenced link for real use
/ Lg:("#.....";"#.....";"#.....";"#.....";"#.....";"######")
/ Tg:("#####";"..#..";"..#..";"..#..";"..#..";"..#..")
/ Ag:("..##..";".#..#.";"#....#";"######";"#....#";"#....#")
/ alphabet:("L";"T";"A")!(Lg;Tg;Ag)
/ sumEmptySpaces[alphabet;("LT";"LTA")]

rightMost:{[row] i:where row="#"; $[0=count i; -1; last i] };
leftMost:{[row] i:where row="#"; $[0=count i; 0W; first i] };

combineChar:{[lc;rch] $[lc="#"; "#"; rch] };

combineCol:{[l;r;off;c]
  lc:$[c<count l; l c; "."];
  rc:c-off;
  rch:$[(rc>=0) and rc<count r; r rc; "."];
  combineChar[lc;rch]
 };

combineRow:{[l;r;off;nw] combineCol[l;r;off;] each til nw };

kernAppend:{[left;right]
  leftW:count first left;
  rightW:count first right;
  lr:rightMost each left;
  rl:leftMost each right;
  valid:(lr>=0) & (rl<0W);
  offs:(lr-rl)+2;
  off:max offs where valid;
  nw:leftW|off+rightW;
  combineRow[;;off;nw] .' flip (left;right)
 };

kernGlyphs:{[glyphs]
  combined:first glyphs;
  i:1;
  n:count glyphs;
  while[i<n; combined:kernAppend[combined;glyphs i]; i+:1];
  combined
 };

kernWord:{[alphabet;word]
  word:$[-10h=type word; enlist word; word];
  kernGlyphs alphabet each word
 };

blanks:{[g] sum sum each g<>\:"#" };

sumEmptySpaces:{[alphabet;words] sum {[alphabet;w] blanks kernWord[alphabet;w]}[alphabet;] each words }
/ =============================================================
