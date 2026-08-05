.solutions.strings.easy: (!). flip raze 2 cut
    (
    (`alphabeticLess;1b);
    (`alphabeticGreater;0b);
    (`removeBlanks;"bcdebc");
    (`removeTrailingBlanks;"trailing blanks");
    (`removeLeadingBlanks;"phrase 267  ");
    (`removeLeadingTrailingBlanks;"abcd e  fg");
    (`collapseMultipleBlanks;"a b c d");
    (`moveBlanksToEnd;"significant   ");
    (`rightJustify;"   trailing blanks");
    (`centerText;"   1234567890   ");
    (`insertSpaces;"w i d e r");
    (`conditionalText;"incorrect");
    (`removeLeadingZeros;"2345600345000");
    (`removePunctuation;"oh no stop it you will");
    (`firstWord;"twas")
    );

.solutions.strings.medium: (!) . flip raze 2 cut
    (
    (`wordOrdinal;("ordinal of word in x pointed at by y";26));
    (`findSubstring;("st";"indexes of start of string x in string y"));
    (`findFirstSubstring;("st";"index of first occurrence of string x in string y"));
    (`locateQuotedRegions;enlist "The \"quick\" brown fox jumps over the \"lazy\" dog.");
    (`extractQuotedText;enlist "The \"quick\" brown fox jumps over the \"lazy\" dog.");
    (`parenthesesDepth;enlist "a(b((c)de)f)g(h)");
    (`insertBlankAfterFlags;(10100100b;"abcdefgh"));
    (`insertVariableBlanks;("Thequickbrownfox.";2 7 12 16;2 3 4 5));
    (`spreadFlaggedHeads;("abcdef";110010b))
    );

.solutions.strings.hard: (!) . flip raze 2 cut
    (
    (`alphabetOrdering;enlist .Q.a);
    (`trimComplexWhitespace;enlist "   The   quick    brown   fox   ");
    (`nestedQuoteExtraction;enlist "\"one\" and \"two\" and \"three\"");
    (`multipleSubstringSearch;("ana";"banananana"));
    (`complexParenthesesDepth;enlist "((a(b)c)((d)e(f(g))))");
    (`justifyParagraph;("The quick brown fox";40));
    (`insertRepeatedBlanks;("Thequickbrownfox.";1 4 9 14;1 2 3 4));
    (`spreadMultipleFlags;("abcdefghijk";10010001001b))
    );