.solutions.text.easy: (!) . flip raze 2 cut
    (
    (`leftJustifyFields; "ab   cde  fghi j    ");
    (`rightJustifyFields; "   ab  cde fghi    j");
    (`collapseDuplicateCharacters; "bcbceekl");
    (`commaSeparatedList; "Swift,Austen,Dickens");
    (`rowsStartingWith; ("sit";"sin"));
    (`rowsDifferentFrom; 1101b);
    (`frameCharacterMatrix; ("------";"|abcd|";"|efgh|";"|ijkl|";"|mnop|";"------"));
    (`insertStarsAfterEquals; "abc=*****,d=*****,fgh=*****");
    (`matrixFromFlaggedParts; ("each";"word";"in  ";"a   ";"row "));
    (`removeDuplicateRows; ("abc";"def";"ghi";"jkl"));
    (`collapseWhitespace; "a bc def g");
    (`removeBlankRows; ("aaa";"bbb";"ccc"));
    (`removeLeadingBlankRows; ("eee";"ddd";"   ";"ccc";"bbb";"aaa"));
    (`removeTrailingBlankRows; ("aaaaa";"bbbbb";"ccccc";"     ";"ddddd";"eeeee"));
    (`removeBlankColumns; ("xh ";"xh ";"xhi";"xhi"));
    (`removeLeadingBlankColumns; ("ed cha";"ed cha";"ed cha"));
    (`removeTrailingBlankColumns; ("abc de";"abc de";"abc de"));
    (`appendEmptyRow; ("ab";"cd";"ef";"  "));
    (`insertEmptyRow; ("ab";"cd";"  ";"ef"))
    );

.solutions.text.medium: (!) . flip raze 2 cut
    (
    (`quotedCsvFromMatrix; "\"Jonathan Swift\",\"Jane Austen\",\"Charles Dickens\"");
    (`collapseBlankRowsMatrix; ("aaa";"   ";"bbb";"ccc";"   ";"ddd";"eee";"fff";"   ";"ggg"));
    (`collapseBlankColumnsMatrix; ("a b c d";"a b c d";"a b c d"));
    (`flaggedWordsToMatrix; ("each";"word";"in  ";"a   ";"row "));
    (`insertStarsLarge; "field1=********field2=********field3=********")
    );

.solutions.text.hard: (!) . flip raze 2 cut
    (
    (`complexWhitespaceCleanup; ("abc def";"abc def";"abc def";"abc def";"abc def";"abc def"));
    (`mixedAlignmentPipeline; ("abcd  ";"ef    ";"ghijk ";"lmn   ";"op    "));
    (`largeDuplicateRowRemoval; ("one";"two";"three";"four";"five"));
    (`multipleInsertRows; ("ab";"  ";"cd";"ef";"  ";"gh"));
    (`csvQuotedTrimmed; "\"Alice\",\"Bob\",\"Charlie\",\"Diana\"")
    );