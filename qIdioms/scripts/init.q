/ Function to load in all files
loadAllInputs:{[]
    filesInputs:key `:./qIdioms/inputs/;
    {system"l ./qIdioms/inputs/",string x} each filesInputs;
 };

loadAllSolutions:{[]
    filesSolutions:key `:./qIdioms/solutions/;
    {system"l ./qIdioms/solutions/",string x} each filesSolutions;
 };

loadAllQuestions:{[]
    filesQuestions:key `:./qIdioms/questions/;
    {system"l ./qIdioms/questions/",string x} each filesQuestions;
 };

initHackerRank:{[]
    system"l ./qIdioms/scripts/phrases.q";
    loadAllInputs[];
    loadAllSolutions[];
    loadAllQuestions[];
 };