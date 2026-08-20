//====================================================================
// HARD
//====================================================================

.fundamental.metaprogramming.dynamicOperatorDispatch:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - Dynamic Operator Dispatch";
    -1 "======================================";
    -1 "";
    -1 "Look an operator up by name from a name-to-function dict, build a tree with it, and eval - choosing the operation to run at runtime rather than hardcoding it, using input: .inputs.metaprogramming.hard.dynamicOperatorDispatch";
    -1 "Input: ", -3!.inputs.metaprogramming.hard`dynamicOperatorDispatch;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.hard`dynamicOperatorDispatch
 };

.fundamental.metaprogramming.composeTreeFragments:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - Composing Tree Fragments";
    -1 "======================================";
    -1 "";
    -1 "Take two separate parse trees and splice them together as the arguments of a third tree, then eval the whole thing at once, using input: .inputs.metaprogramming.hard.composeTreeFragments";
    -1 "Input: ", -3!.inputs.metaprogramming.hard`composeTreeFragments;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.hard`composeTreeFragments
 };

.fundamental.metaprogramming.dynamicFunctionalSelectTree:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Metaprogramming - A Functional Select As A Tree";
    -1 "======================================";
    -1 "";
    -1 "Build a functional-select tree (?;t;c;b;a) around a dynamically-chosen filter value and run it with value - eval does NOT handle a ? tree (it signals a type error), which is why this uses value instead - using input: .inputs.metaprogramming.hard.dynamicFunctionalSelectTree";
    -1 "Input: ", -3!.inputs.metaprogramming.hard`dynamicFunctionalSelectTree;
    -1 "Expected Output: ", -3!.solutions.metaprogramming.hard`dynamicFunctionalSelectTree
 };
