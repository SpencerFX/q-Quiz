/ Function to load in all files
loadAllAlgorithms:{[]
    filesEasy:key `:./hackerRank/Algorithms/easy/;
    filesMedium:key `:./hackerRank/Algorithms/medium/;
    filesHard:key `:./hackerRank/Algorithms/hard/;
    {system"l ./hackerRank/Algorithms/easy/", x}each string filesEasy;
    {system"l ./hackerRank/Algorithms/medium/", x}each string filesMedium;
    {system"l ./hackerRank/Algorithms/hard/", x}each string filesHard;
 };

loadAllDataStructure:{[]
    filesEasyDS:key `:./hackerRank/DataStructure/easy/;
    filesMediumDS:key `:./hackerRank/DataStructure/medium/;
    filesHardDS:key `:./hackerRank/DataStructure/hard/;
    {system"l ./hackerRank/DataStructure/easy/", x}each string filesEasyDS;
    {system"l ./hackerRank/DataStructure/medium/", x}each string filesMediumDS;
    {system"l ./hackerRank/DataStructure/hard/", x}each string filesHardDS;
 };

loadAllInputs:{[]
    filesInputs:key `:./hackerRank/Inputs/;
    {system"l ./hackerRank/Inputs/",string x} each filesInputs;
 };

loadAllSolutions:{[]
    filesSolutions:key `:./hackerRank/Solutions/;
    {system"l ./hackerRank/Solutions/",string x} each filesSolutions;
 };

/ Function to test all solution functions
testAllFuncsEasy:{
    filesEasyString:string each key `:./hackerRank/Algorithms/easy/;
    filesEasyDsString:string each key `:./hackerRank/DataStructure/easy/;
    funcsToTestAl:`$-2_'filesEasyString;
    funcsToTestDS:`$-2_'filesEasyDsString;
    {checker[x;get x]}each funcsToTestAl;
    {checker[x;get x]}each funcsToTestDS;
 };

initHackerRank:{[]
    loadAllAlgorithms[];
    loadAllDataStructure[];
    loadAllInputs[];
    loadAllSolutions[];
 };