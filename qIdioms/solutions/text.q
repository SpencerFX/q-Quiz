.solutions.text.easy: (!) . flip raze 2 cut
    (
    (`leftJustifyFields;("abcdefghij";2 3 4 1;5));
    (`rightJustifyFields;("abcdefghij";2 3 4 1;5));
    (`collapseDuplicateCharacters;("bccbceekl";"c"));
    (`commaSeparatedList;enlist ("Swift";"Austen";"Dickens"));
    (`rowsStartingWith;(("sit";"sat";"sin";"tin");"si"));
    (`rowsDifferentFrom;(("aaa";"bbb";"ooo";"pop");"o"));
    (`frameCharacterMatrix;enlist 4 4#"abcdefghijklmnop");
    (`insertStarsAfterEquals;("abc=,d=,fgh=";5));
    (`matrixFromFlaggedParts;("eachwordinarow";1 0 0 0 1 0 0 0 1 0 1 1 0 0b));
    (`removeDuplicateRows;enlist ("abc";"def";"abc";"ghi";"jkl";"abc";"ghi";"abc"));
    (`collapseWhitespace;enlist "a bc  def    g");
    (`removeBlankRows;enlist ("aaa";"bbb";"   ";"ccc";"   "));
    (`removeLeadingBlankRows;enlist reverse flip 3 9#"abc de   ");
    (`removeTrailingBlankRows;enlist flip 5 9#"abc de   ");
    (`removeBlankColumns;enlist flip 4 4#"xxxx    hhhh  ii");
    (`removeLeadingBlankColumns;enlist 3 9#"   ed cha");
    (`removeTrailingBlankColumns;enlist 3 9#"abc de   ");
    (`appendEmptyRow;enlist ("ab";"cd";"ef"));
    (`insertEmptyRow;(("ab";"cd";"ef");1))
    );

.solutions.text.medium: (!) . flip raze 2 cut
    (
    (`quotedCsvFromMatrix;enlist ("Jonathan Swift ";"Jane Austen    ";"Charles Dickens"));
    (`collapseBlankRowsMatrix;enlist 3#'"aaa   bbbccc   dddeeefff    ggg");
    (`collapseBlankColumnsMatrix;enlist 3 9#"a b c   d");
    (`flaggedWordsToMatrix;("eachwordinarow";1 0 0 0 1 0 0 0 1 0 1 1 0 0b));
    (`insertStarsLarge;("field1=field2=field3=";8))
    );

.solutions.text.hard: (!) . flip raze 2 cut
    (
    (`complexWhitespaceCleanup;enlist flip 6 12#"abc   def   ");
    (`mixedAlignmentPipeline;("abcdefghijklmnop";4 2 5 3 2;6));
    (`largeDuplicateRowRemoval;enlist ("one";"two";"one";"three";"four";"two";"three";"five";"one"));
    (`multipleInsertRows;(("ab";"cd";"ef";"gh");1 3));
    (`csvQuotedTrimmed;enlist ("  Alice   ";" Bob";"Charlie   ";"  Diana"))
    );