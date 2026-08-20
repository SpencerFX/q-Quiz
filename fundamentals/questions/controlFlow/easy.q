//====================================================================
//
// fundamentals - Control Flow - Question Functions
//
// Auto-generated from .inputs.controlFlow.easy/medium/hard config.
// Each function prints the exercise header/description and the
// input for that question, pulled from the corresponding input and
// solution banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.controlFlow.doLoop:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - do";
    -1 "======================================";
    -1 "";
    -1 "Use do[n;stmt] to run a statement a fixed number of times, incrementing a counter, using input: .inputs.controlFlow.easy.doLoop";
    -1 "Input: ", -3!.inputs.controlFlow.easy`doLoop;
    -1 "Expected Output: ", -3!.solutions.controlFlow.easy`doLoop
 };

.fundamental.controlFlow.whileLoop:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - while";
    -1 "======================================";
    -1 "";
    -1 "Use while[cond;stmt] to sum 0 up to (but not including) n, using input: .inputs.controlFlow.easy.whileLoop";
    -1 "Input: ", -3!.inputs.controlFlow.easy`whileLoop;
    -1 "Expected Output: ", -3!.solutions.controlFlow.easy`whileLoop
 };

.fundamental.controlFlow.ifStatement:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - if";
    -1 "======================================";
    -1 "";
    -1 "Use if[cond;stmt] to conditionally set a value - unlike $, if has no built-in else branch, using input: .inputs.controlFlow.easy.ifStatement";
    -1 "Input: ", -3!.inputs.controlFlow.easy`ifStatement;
    -1 "Expected Output: ", -3!.solutions.controlFlow.easy`ifStatement
 };

.fundamental.controlFlow.ternaryCond:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - $[c;t;f]";
    -1 "======================================";
    -1 "";
    -1 "Use $[cond;trueVal;falseVal] to pick between two values based on a SCALAR condition, using input: .inputs.controlFlow.easy.ternaryCond";
    -1 "Input: ", -3!.inputs.controlFlow.easy`ternaryCond;
    -1 "Expected Output: ", -3!.solutions.controlFlow.easy`ternaryCond
 };
