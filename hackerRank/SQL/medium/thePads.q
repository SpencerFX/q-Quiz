.quiz.hackerRank.sql.thePads.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - The PADS";
    -1 "======================================";
    -1 "";
    -1 "Generate the following two result sets from OCCUPATIONS:";
    -1 "";
    -1 "1) A list of \"Name(FirstLetterOfOccupation)\", eg Samantha(A)";
    -1 "   for an Actor, ordered alphabetically by NAME. If more than";
    -1 "   one person has the same name, they should still appear once";
    -1 "   per row (OCCUPATIONS has one row per person).";
    -1 "2) A count of each occupation, formatted as \"There are a total";
    -1 "   of N <occupation>s.\" (lowercased, pluralised), sorted";
    -1 "   alphabetically by occupation.";
    -1 "";
    -1 "Table: OCCUPATIONS(NAME;OCCUPATION)";
    -1 "";
    -1 "Task:";
    -1 "- Return block 1 followed by block 2, in the order described";
    -1 "  above";
    -1 "";
    -1 "Function Description:";
    -1 "thePads takes no arguments - query the global OCCUPATIONS table";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings: one \"Name(Letter)\" line per person, then";
    -1 "  one \"There are a total of N <occupation>s.\" line per distinct";
    -1 "  occupation";
 };


/ Solution Info ===============================================
/ thePads[]

thePads:{[]
  people:`NAME xasc select from OCCUPATIONS;
  nameLines:{[row] (string row`NAME),"(",(1#string row`OCCUPATION),")"} each people;
  occs:asc distinct exec OCCUPATION from OCCUPATIONS;
  countLines:{[occ] "There are a total of ",(string count select from OCCUPATIONS where OCCUPATION=occ)," ",(lower string occ),"s."} each occs;
  nameLines,countLines
 };
/ =============================================================
