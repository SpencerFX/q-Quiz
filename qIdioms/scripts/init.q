/ Function to load in all files
loadAllIdiomInputs:{[]
    filesInputs:key `:./qIdioms/inputs/;
    {system"l ./qIdioms/inputs/",string x} each filesInputs;
 };

loadAllIdiomSolutions:{[]
    filesSolutions:key `:./qIdioms/solutions/;
    {system"l ./qIdioms/solutions/",string x} each filesSolutions;
 };

loadAllIdiomQuestions:{[]
    filesQuestions:key `:./qIdioms/questions/;
    {system"l ./qIdioms/questions/",string x} each filesQuestions;
 };

initQIdioms:{[]
    system"l ./qIdioms/scripts/phrases.q";
    loadAllIdiomInputs[];
    loadAllIdiomSolutions[];
    loadAllIdiomQuestions[];
 };