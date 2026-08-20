//====================================================================
// MEDIUM
//====================================================================

.fundamental.joins.leftJoinMultiKey:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Left Join (Multi-Key)";
    -1 "======================================";
    -1 "";
    -1 "Left-join trades to a limits table keyed on both sym AND desk using input: .inputs.joins.medium.leftJoinMultiKey";
    -1 "Input: ", -3!.inputs.joins.medium`leftJoinMultiKey;
    -1 "Expected Output: ", -3!.solutions.joins.medium`leftJoinMultiKey
 };

.fundamental.joins.unionJoinMismatchedColumns:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Union Join (Mismatched Columns)";
    -1 "======================================";
    -1 "";
    -1 "Union-join two trades tables where only one has a venue column using input: .inputs.joins.medium.unionJoinMismatchedColumns";
    -1 "Input: ", -3!.inputs.joins.medium`unionJoinMismatchedColumns;
    -1 "Expected Output: ", -3!.solutions.joins.medium`unionJoinMismatchedColumns
 };

.fundamental.joins.leftJoinDefaultFill:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Left Join With Default Fill";
    -1 "======================================";
    -1 "";
    -1 "Left-join trades to desks, then fill any unmatched desk with `Unassigned using input: .inputs.joins.medium.leftJoinDefaultFill";
    -1 "Input: ", -3!.inputs.joins.medium`leftJoinDefaultFill;
    -1 "Expected Output: ", -3!.solutions.joins.medium`leftJoinDefaultFill
 };

.fundamental.joins.innerJoinAggregate:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Inner Join Then Aggregate";
    -1 "======================================";
    -1 "";
    -1 "Inner-join trades to desks, then sum size by desk (dropping any sym with no matching desk first) using input: .inputs.joins.medium.innerJoinAggregate";
    -1 "Input: ", -3!.inputs.joins.medium`innerJoinAggregate;
    -1 "Expected Output: ", -3!.solutions.joins.medium`innerJoinAggregate
 };
