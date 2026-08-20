//====================================================================
// HARD
//====================================================================

.fundamental.joins.asofJoinQuotes:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - As-Of Join";
    -1 "======================================";
    -1 "";
    -1 "As-of join trades to quotes, attaching each trade's most recent bid/ask at or before its own time using input: .inputs.joins.hard.asofJoinQuotes";
    -1 "Input: ", -3!.inputs.joins.hard`asofJoinQuotes;
    -1 "Expected Output: ", -3!.solutions.joins.hard`asofJoinQuotes
 };

.fundamental.joins.windowJoinMidRange:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - Window Join";
    -1 "======================================";
    -1 "";
    -1 "Window-join trades to quotes, attaching the min bid and max ask seen in the 45 seconds up to and including each trade's time using input: .inputs.joins.hard.windowJoinMidRange";
    -1 "Input: ", -3!.inputs.joins.hard`windowJoinMidRange;
    -1 "Expected Output: ", -3!.solutions.joins.hard`windowJoinMidRange
 };

.fundamental.joins.asofJoinNoMatchFill:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Joins - As-Of Join With No-Match Fill";
    -1 "======================================";
    -1 "";
    -1 "As-of join trades to quotes, then fill any trade with no earlier quote (bid/ask both null) with 0 using input: .inputs.joins.hard.asofJoinNoMatchFill";
    -1 "Input: ", -3!.inputs.joins.hard`asofJoinNoMatchFill;
    -1 "Expected Output: ", -3!.solutions.joins.hard`asofJoinNoMatchFill
 };
