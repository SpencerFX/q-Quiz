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

/ Sample data (CITY, STATION, ...) backing hackerRank/SQL/ - every SQL
/ problem's function is niladic and queries these tables as globals,
/ so this has to load before anything tries to call one, though not
/ necessarily before the SQL/ files themselves are loaded (a function
/ body isn't evaluated until it's called).
loadHackerRankData:{[]
    system "l ./hackerRank/data/tables.q";
 };

/ Mirrors loadAllAlgorithms/loadAllDataStructure - hard/ is currently
/ empty (no hard-difficulty SQL problems yet), key on an empty folder
/ just yields an empty list so the each below is a no-op for it.
loadAllSQL:{[]
    filesEasySQL:key `:./hackerRank/SQL/easy/;
    filesMediumSQL:key `:./hackerRank/SQL/medium/;
    filesHardSQL:key `:./hackerRank/SQL/hard/;
    {system"l ./hackerRank/SQL/easy/", x}each string filesEasySQL;
    {system"l ./hackerRank/SQL/medium/", x}each string filesMediumSQL;
    {system"l ./hackerRank/SQL/hard/", x}each string filesHardSQL;
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
    loadHackerRankData[];
    loadAllAlgorithms[];
    loadAllDataStructure[];
    loadAllSQL[];
    loadAllInputs[];
    loadAllSolutions[];
 };