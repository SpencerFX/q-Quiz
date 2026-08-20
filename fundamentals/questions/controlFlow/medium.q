//====================================================================
// MEDIUM
//====================================================================

.fundamental.controlFlow.caseMultiBranch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - $ As A Case Statement";
    -1 "======================================";
    -1 "";
    -1 "Use $[c1;r1;c2;r2;...;default] with more than one condition to classify a number as zero, negative, or positive, using input: .inputs.controlFlow.medium.caseMultiBranch";
    -1 "Input: ", -3!.inputs.controlFlow.medium`caseMultiBranch;
    -1 "Expected Output: ", -3!.solutions.controlFlow.medium`caseMultiBranch
 };

.fundamental.controlFlow.vectorConditional:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - ?[c;t;f]";
    -1 "======================================";
    -1 "";
    -1 "Use ?[cond;t;f] with a VECTOR condition to pick element-by-element between two values across a whole list at once, using input: .inputs.controlFlow.medium.vectorConditional";
    -1 "Input: ", -3!.inputs.controlFlow.medium`vectorConditional;
    -1 "Expected Output: ", -3!.solutions.controlFlow.medium`vectorConditional
 };

.fundamental.controlFlow.doLoopBuildList:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - do Building A List";
    -1 "======================================";
    -1 "";
    -1 "Use do[n;stmt] with in-place append (,:) to grow a list across n iterations, using input: .inputs.controlFlow.medium.doLoopBuildList";
    -1 "Input: ", -3!.inputs.controlFlow.medium`doLoopBuildList;
    -1 "Expected Output: ", -3!.solutions.controlFlow.medium`doLoopBuildList
 };

.fundamental.controlFlow.whileLoopBuildList:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Control Flow - while Building A List";
    -1 "======================================";
    -1 "";
    -1 "Use while[cond;stmt] to build a list of squares 0*0 up to (n-1)*(n-1), using input: .inputs.controlFlow.medium.whileLoopBuildList";
    -1 "Input: ", -3!.inputs.controlFlow.medium`whileLoopBuildList;
    -1 "Expected Output: ", -3!.solutions.controlFlow.medium`whileLoopBuildList
 };
