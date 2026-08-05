.solutions.text.easy: (!) . flip raze 2 cut
    (
    (`leftJustifyFields;enlist "ab   cde  fghi j    ");
    (`rightJustifyFields;enlist "   ab  cde fghi    j");
    (`collapseDuplicateCharacters;enlist "bcbceekl");
    (`commaSeparatedList;enlist "Swift,Austen,Dickens");
    (`rowsStartingWith;enlist ("sit";"sin"));
    (`rowsDifferentFrom;enlist 1101b);
    (`frameCharacterMatrix;enlist ("------";"|abcd|";"|efgh|";"|ijkl|";"|mnop|";"------"));
    (`insertStarsAfterEquals;enlist "abc=*****,d=*****,fgh=*****");
    (`matrixFromFlaggedParts;enlist ("each";"word";"in  ";"a   ";"row "));
    (`removeDuplicateRows;enlist ("abc";"def";"ghi";"jkl"));
    (`collapseWhitespace;enlist "a bc def g");
    (`removeBlankRows;enlist ("aaa";"bbb";"ccc"));
    (`removeLeadingBlankRows;enlist ("eee";"ddd";"   ";"ccc";"bbb";"aaa"));
    (`removeTrailingBlankRows;enlist ("aaaaa";"bbbbb";"ccccc";"     ";"ddddd";"eeeee"));
    (`removeBlankColumns;enlist ("xh ";"xh ";"xhi";"xhi"));
    (`removeLeadingBlankColumns;enlist ("ed cha";"ed cha";"ed cha"));
    (`removeTrailingBlankColumns;enlist ("abc de";"abc de";"abc de"));
    (`appendEmptyRow;enlist ("ab";"cd";"ef";"  "));
    (`insertEmptyRow;enlist ("ab";"cd";"  ";"ef"))
    );

.solutions.text.medium: (!) . flip raze 2 cut
    (
    (`quotedCsvFromMatrix;enlist "\"Jonathan Swift\",\"Jane Austen\",\"Charles Dickens\"");
    (`collapseBlankRowsMatrix;enlist ("aaa";"   ";"bbb";"ccc";"   ";"ddd";"eee";"fff";"   ";"ggg"));
    (`collapseBlankColumnsMatrix;enlist ("a b c d";"a b c d";"a b c d"));
    (`flaggedWordsToMatrix;enlist ("each";"word";"in  ";"a   ";"row "));
    (`insertStarsLarge;enlist "field1=********field2=********field3=********")
    );

.solutions.text.hard: (!) . flip raze 2 cut
    (
    (`complexWhitespaceCleanup;enlist ("abc def";"abc def";"abc def";"abc def";"abc def";"abc def"));
    (`mixedAlignmentPipeline;enlist ("abcd  ";"ef    ";"ghijk ";"lmn   ";"op    "));
    (`largeDuplicateRowRemoval;enlist ("one";"two";"three";"four";"five"));
    (`multipleInsertRows;enlist ("ab";"  ";"cd";"ef";"  ";"gh"));
    (`csvQuotedTrimmed;enlist "\"Alice\",\"Bob\",\"Charlie\",\"Diana\"")
    );