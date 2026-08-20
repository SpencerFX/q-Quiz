//====================================================================
//
// fundamentals - Joins - Question Functions
//
// Auto-generated from .inputs.joins.easy/medium/hard config. Each
// function prints the exercise header/description and the input for
// that question, pulled from the corresponding input and solution
// banks.
//
//====================================================================


//====================================================================
// EASY
//====================================================================

.fundamental.joins.leftJoinBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Left Join";
    -1 "======================================";
    -1 "";
    -1 "Left-join a trades table to a sym-keyed sector reference table using input: .inputs.joins.easy.leftJoinBasic";
    -1 "Input: ", -3!.inputs.joins.easy`leftJoinBasic;
    -1 "Expected Output: ", -3!.solutions.joins.easy`leftJoinBasic
 };

.fundamental.joins.innerJoinBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Inner Join";
    -1 "======================================";
    -1 "";
    -1 "Inner-join a trades table to a sym-keyed desks reference table (which is missing one sym) using input: .inputs.joins.easy.innerJoinBasic";
    -1 "Input: ", -3!.inputs.joins.easy`innerJoinBasic;
    -1 "Expected Output: ", -3!.solutions.joins.easy`innerJoinBasic
 };

.fundamental.joins.exceptJoinBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Except Join";
    -1 "======================================";
    -1 "";
    -1 "Keep only the trades whose sym has no match in the desks reference table using input: .inputs.joins.easy.exceptJoinBasic";
    -1 "Input: ", -3!.inputs.joins.easy`exceptJoinBasic;
    -1 "Expected Output: ", -3!.solutions.joins.easy`exceptJoinBasic
 };

.fundamental.joins.unionJoinBasic:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Union Join";
    -1 "======================================";
    -1 "";
    -1 "Combine a morning and an afternoon trades table into one using input: .inputs.joins.easy.unionJoinBasic";
    -1 "Input: ", -3!.inputs.joins.easy`unionJoinBasic;
    -1 "Expected Output: ", -3!.solutions.joins.easy`unionJoinBasic
 };
