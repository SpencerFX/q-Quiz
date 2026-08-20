//====================================================================
// MEDIUM
//====================================================================

.fundamental.metaprogramming.buildTreeManually:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - Building A Tree By Hand";
    -1 "======================================";
    -1 "";
    -1 "Build a parse tree yourself as a plain (function;arg1;arg2) list - no call to parse needed - and eval it, using input: .inputs.metaprogramming.medium.buildTreeManually";
    -1 "Input: ", -3!.inputs.metaprogramming.medium`buildTreeManually;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.medium`buildTreeManually
 };

.fundamental.metaprogramming.swapOperatorInTree:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - Editing A Tree";
    -1 "======================================";
    -1 "";
    -1 "A parse tree is just a list, so functional amend (@[d;k;f;y]) works on it directly - replace a tree's operator (index 0) with a different one, then eval the edited tree, using input: .inputs.metaprogramming.medium.swapOperatorInTree";
    -1 "Input: ", -3!.inputs.metaprogramming.medium`swapOperatorInTree;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.medium`swapOperatorInTree
 };

.fundamental.metaprogramming.evalPartialTreeGivesProjection:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - A Partial Tree Is A Projection";
    -1 "======================================";
    -1 "";
    -1 "Eval a tree that's missing one argument (+;3) - the result is a projection you can then call with the missing value, using input: .inputs.metaprogramming.medium.evalPartialTreeGivesProjection";
    -1 "Input: ", -3!.inputs.metaprogramming.medium`evalPartialTreeGivesProjection;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.medium`evalPartialTreeGivesProjection
 };

.fundamental.metaprogramming.parseLambdaString:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - Parsing A Function Definition";
    -1 "======================================";
    -1 "";
    -1 "Parse a string containing a whole lambda definition, eval it to get a callable function back, then call it, using input: .inputs.metaprogramming.medium.parseLambdaString";
    -1 "Input: ", -3!.inputs.metaprogramming.medium`parseLambdaString;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.medium`parseLambdaString
 };
