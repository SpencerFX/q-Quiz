/ Function to load in all files
loadAllEasyAlgorithms:{[dir]
    system"cd ,"dir;
    filesEasy:key `:./Algorithms/easy/;
    filesMedium:key `:./Algorithms/medium/;
    filesHard:key `:./Algorithms/hard/;
    {system"l ./Algorithms/easy/", x}each string filesEasy;
 };

loadAllEasyDataStructure:{[dir]
    system"cd ,"dir;
    filesEasyDS:key `:./DataStructure/easy/;
    filesMediumDS:key `:./Algorithms/medium/;
    filesHardDS:key `:./Algorithms/hard/;
    {system"l ./DataStructure/easy/", x}each string filesEasyDS;
 };

/ Function to test all solution functions
testAllFuncsEasy:{
    filesEasyString:string each key `:./Algorithms/easy/;
    filesEasyDsString:string each key `:./DataStructure/easy/;
    funcsToTestAl:`$-2_'filesEasyString;
    funcsToTestDS:`$-2_'filesEasyDsString;
    {checker[x;get x]}each funcsToTestAl;
    {checker[x;get x]}each funcsToTestDS;
 };