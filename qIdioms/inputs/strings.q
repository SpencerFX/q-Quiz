.inputs.strings.easy: (!) . flip raze 2 cut
    (
    (`alphabeticLess;("a";"b"));
    (`alphabeticGreater;("a";"b"));
    (`removeBlanks;enlist " bcde bc");
    (`removeTrailingBlanks;enlist "trailing blanks    ");
    (`removeLeadingBlanks;enlist "  phrase 267  ");
    (`removeLeadingTrailingBlanks;enlist "   abcd e  fg   ");
    (`collapseMultipleBlanks;enlist "a    b       c    d");
    (`moveBlanksToEnd;enlist "sign if i cant");
    (`rightJustify;enlist "trailing blanks   ");
    (`centerText;("1234567890";16));
    (`insertSpaces;enlist "wider");
    (`conditionalText;enlist 0b);
    (`removeLeadingZeros;enlist "00002345600345000");
    (`removePunctuation;("oh! no, stop it. you will?";",;:.!?"));
    (`firstWord;enlist "twas brillig and the slith")
    );

.inputs.strings.medium: (!) . flip raze 2 cut
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

.inputs.strings.hard: (!) . flip raze 2 cut
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