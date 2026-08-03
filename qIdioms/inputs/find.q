.inputs.find.easy: (!) . flip raze 2 cut
    (
        (`findCharactersInString; (" abcdefgh"; "faded head"));
        (`findCharactersMissing; (" abcdefgh"; "deaf adder"));
        (`findRowsInList; (("cow";"sheep";"cat";"dog"); ("cat";"cow";"cat";"dog";"sheep")));
        (`findFlagsBoolean; enlist 010101b);
        (`findFlagsInteger; enlist 0 1 0 1 0 1);
        (`findAllOccurrencesList; ("abcdefgab"; "afc*"));
        (`findAllOccurrencesAtom; ("abcdeabc"; "a"));
        (`findAllOccurrencesStrings; (("apple";"banana";"orange";"pear"); ("banana";"apple";"cherry")));
        (`firstOccurrenceCharacters; ("banana dream"; "band"));
        (`firstOccurrenceCharactersLong; ("banana dream"; "bandana"));
        (`firstOccurrenceInteger; (3 0 4 3 1 4 4 3 3 1; 4));
        (`firstOccurrenceMaximum; enlist 5 3 7 0 5 7 2);
        (`firstOccurrenceMinimum; enlist 5 3 7 0 5 7 2);
        (`firstCircularOccurrence; (6 6 0 0 8 9 8 1 0 2 9 4 6 3 5; 0 6 5; 9));
        (`lastOccurrenceInteger; (3 0 4 3 1 4 4 3 3 1; 4));
        (`lastOccurrenceVector; (3 0 4 3 1 4 4 3 3 1; 4 0));
        (`lastOccurrenceFromRear; (8 4 9 1 5 7; 8 2 3 4 9 5 7 1 10 6 8 2));
        (`distinctItemsString; enlist "ajhajhja");
        (`distinctItemsList; enlist ("banana";"pear";"apple";"cherry";"apple";"orange";"pear"));
        (`firstDifferingItem; (3 1 4 1 6 0; 3 1 4 1 5 9));
        (`itemsNotInList; (2 3 4 5 6 7 8 9 10 11; 2 3 5 7 11));
        (`consecutiveRepeatedItems; enlist "aaabccccdeee");
        (`rowsOfMatrixInMatrix; ((flip 3 8#"abcdefgh"); (flip 3 4#"afmc")));
        (`itemsOfMatrixInArray; ((2 3#5 1 2 2 0 3); (2 2 1 7 3;1 4 0 6 4;6 7 6 3 8;4 8 0 1 0)));
        (`rowsInCorrespondingRows; (1+3 4#til 12; (1 0 3 0;0 6 0 8;9 0 0 12)));
        (`firstBlank; enlist "ab c d");
        (`firstBlankEach; enlist ("ab c d";" a bc";"abcd "));
        (`lastNonBlank; enlist "blanks at end   ");
        (`lastNonBlankEach; enlist ("love's not ";"time's fool ";"though rosy "));
        (`substringSearch; ("XX"; "XabcugjXXjyXXXkmhixXX12"));
        (`blankRows; enlist flip 5 6#"a bc d");
        (`rowsStartingWithCharacters; (("abcd";"efgh";"ijkl";"mnop"); "ai"))
    );

.inputs.algorithms.medium: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );

.inputs.algorithms.hard: (!) . flip raze 2 cut
    (
        (`a; `);
        (`b; `)
    );