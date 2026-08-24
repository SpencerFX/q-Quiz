//====================================================================
//
// q-Quiz
//
// Topic      : List Operations
// Difficulty : Hard
//
// Auto-generated from .inputs.listOperations.easy/medium/hard config.
// Each function prints the exercise header/description and the input
// for that question, pulled from the corresponding input and solution
// banks.
//
//====================================================================


//====================================================================
// HARD
//====================================================================

.fundamental.listOperations.cutChunks:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Cut";
    -1 "======================================";
    -1 "";
    -1 "Split a list into consecutive chunks of size N. Gotcha: N is the size of each chunk, not the number of chunks produced. Using input: .inputs.listOperations.hard.cutChunks";
    -1 "Input: ", -3!.inputs.listOperations.hard`cutChunks;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`cutChunks
 };

.fundamental.listOperations.sublistRange:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Sublist";
    -1 "======================================";
    -1 "";
    -1 "Extract a slice of a list given a starting index and a count of elements to take using input: .inputs.listOperations.hard.sublistRange";
    -1 "Input: ", -3!.inputs.listOperations.hard`sublistRange;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`sublistRange
 };

.fundamental.listOperations.nextAndPrev:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Next And Prev";
    -1 "======================================";
    -1 "";
    -1 "Shift a list by one position in each direction (next looks ahead, prev looks behind), each leaving a null at the edge it can't fill. Using input: .inputs.listOperations.hard.nextAndPrev";
    -1 "Input: ", -3!.inputs.listOperations.hard`nextAndPrev;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`nextAndPrev
 };

.fundamental.listOperations.xprevShift:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Xprev";
    -1 "======================================";
    -1 "";
    -1 "Shift a list back by N positions (a generalised prev), leaving nulls at the start using input: .inputs.listOperations.hard.xprevShift";
    -1 "Input: ", -3!.inputs.listOperations.hard`xprevShift;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`xprevShift
 };

.fundamental.listOperations.movingCount:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Mcount";
    -1 "======================================";
    -1 "";
    -1 "Compute a moving count of non-null values over a trailing window of size N using input: .inputs.listOperations.hard.movingCount";
    -1 "Input: ", -3!.inputs.listOperations.hard`movingCount;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`movingCount
 };

.fundamental.listOperations.fillsForward:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Fills";
    -1 "======================================";
    -1 "";
    -1 "Forward-fill nulls in a list with the most recent non-null value using input: .inputs.listOperations.hard.fillsForward";
    -1 "Input: ", -3!.inputs.listOperations.hard`fillsForward;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`fillsForward
 };

.fundamental.listOperations.svJoin:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Sv";
    -1 "======================================";
    -1 "";
    -1 "Join a list of strings into one string, using the given separator. Gotcha: a join-list made only of same-length strings (eg (\"a\";\"b\";\"c\")) collapses into one flat char vector at parse time instead of staying a list - this problem's own words are deliberately different lengths to avoid that trap. Using input: .inputs.listOperations.hard.svJoin";
    -1 "Input: ", -3!.inputs.listOperations.hard`svJoin;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`svJoin
 };

.fundamental.listOperations.vsSplit:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - List Operations - Vs";
    -1 "======================================";
    -1 "";
    -1 "Split a string into pieces wherever a separator appears - the inverse of sv. Using input: .inputs.listOperations.hard.vsSplit";
    -1 "Input: ", -3!.inputs.listOperations.hard`vsSplit;
    -1 "Expected Output: ", -3!.solutions.listOperations.hard`vsSplit
 };
