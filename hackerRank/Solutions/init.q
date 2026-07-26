/ Function to load in all files
loadAllEasyAlgorithms:{[dir]
    system"cd ,"dir;
    filesEasy:key `:./hackerRank/Algorithms/easy/;
    filesMedium:key `:./hackerRank/Algorithms/medium/;
    filesHard:key `:./hackerRank/Algorithms/hard/;
    {system"l ./hackerRank/Algorithms/easy/", x}each string filesEasy;
    system"l ./hackerRank/Inputs/algorithms.q";
    system"l ./hackerRank/Solutions/algorithms.q";
 };

loadAllEasyDataStructure:{[dir]
    system"cd ,"dir;
    filesEasyDS:key `:./hackerRank/DataStructure/easy/;
    filesMediumDS:key `:./hackerRank/DataStructure/medium/;
    filesHardDS:key `:./hackerRank/DataStructure/hard/;
    {system"l ./hackerRank/DataStructure/easy/", x}each string filesEasyDS;
    system"l ./hackerRank/Inputs/dataStructures.q";
    system"l ./hackerRank/Solutions/dataStructures.q";
 };

/ Function to test all solution functions
testAllFuncsEasy:{
    system"l ./hackerRank/Solutions/checker.q";
    filesEasyString:string each key `:./hackerRank/Algorithms/easy/;
    filesEasyDsString:string each key `:./hackerRank/DataStructure/easy/;
    funcsToTestAl:`$-2_'filesEasyString;
    funcsToTestDS:`$-2_'filesEasyDsString;
    {checker[x;get x]}each funcsToTestAl;
    {checker[x;get x]}each funcsToTestDS;
 };