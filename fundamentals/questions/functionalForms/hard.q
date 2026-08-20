//====================================================================
// HARD
//====================================================================

.fundamental.functionalForms.funcSelectWhereBy:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Functional Select";
    -1 "======================================";
    -1 "";
    -1 "Use the functional form of select (?[t;c;b;a]) to compute avg price by sym where size>5, equivalent to select avg price by sym from t where size>5, using input: .inputs.functionalForms.hard.funcSelectWhereBy";
    -1 "Input: ", -3!.inputs.functionalForms.hard`funcSelectWhereBy;
    -1 "Expected Output: ", -3!.solutions.functionalForms.hard`funcSelectWhereBy
 };

.fundamental.functionalForms.funcUpdateColumn:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Functional Update";
    -1 "======================================";
    -1 "";
    -1 "Use the functional form of update (![t;c;b;a]) to add a notional:price*size column only where sym=`AAPL, equivalent to update notional:price*size from t where sym=`AAPL, using input: .inputs.functionalForms.hard.funcUpdateColumn";
    -1 "Input: ", -3!.inputs.functionalForms.hard`funcUpdateColumn;
    -1 "Expected Output: ", -3!.solutions.functionalForms.hard`funcUpdateColumn
 };

.fundamental.functionalForms.funcSelectAggBy:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Functional Forms - Functional Select (Aggregate + By)";
    -1 "======================================";
    -1 "";
    -1 "Use the functional form of select to compute total size by sym where price>100, equivalent to select sum size by sym from t where price>100, using input: .inputs.functionalForms.hard.funcSelectAggBy";
    -1 "Input: ", -3!.inputs.functionalForms.hard`funcSelectAggBy;
    -1 "Expected Output: ", -3!.solutions.functionalForms.hard`funcSelectAggBy
 };
