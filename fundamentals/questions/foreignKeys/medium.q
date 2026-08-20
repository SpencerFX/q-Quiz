//====================================================================
// MEDIUM
//====================================================================

.fundamental.foreignKeys.dotNotationInSelect:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Dot-Notation In select";
    -1 "======================================";
    -1 "";
    -1 "Use fkCol.otherCol inside a select clause to pull a column from the referenced table - this only works inside qsql, not as a bare expression, using input: .inputs.foreignKeys.medium.dotNotationInSelect";
    -1 "Input: ", -3!.inputs.foreignKeys.medium`dotNotationInSelect;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.medium`dotNotationInSelect
 };

.fundamental.foreignKeys.fkEquivalentToLeftJoin:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Same As A Left Join";
    -1 "======================================";
    -1 "";
    -1 "Select a foreign key's dot-chased column - the result is exactly what a left join against the referenced table would produce, using input: .inputs.foreignKeys.medium.fkEquivalentToLeftJoin";
    -1 "Input: ", -3!.inputs.foreignKeys.medium`fkEquivalentToLeftJoin;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.medium`fkEquivalentToLeftJoin
 };

.fundamental.foreignKeys.fkInWhereClause:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Filtering On A Foreign Key";
    -1 "======================================";
    -1 "";
    -1 "Use fkCol.otherCol inside a where clause to filter on a column from the referenced table, using input: .inputs.foreignKeys.medium.fkInWhereClause";
    -1 "Input: ", -3!.inputs.foreignKeys.medium`fkInWhereClause;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.medium`fkInWhereClause
 };

.fundamental.foreignKeys.fkInAggregateBy:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Foreign Keys - Grouping By A Foreign Key";
    -1 "======================================";
    -1 "";
    -1 "Use fkCol.otherCol as a by-clause grouping key to aggregate by a column from the referenced table, using input: .inputs.foreignKeys.medium.fkInAggregateBy";
    -1 "Input: ", -3!.inputs.foreignKeys.medium`fkInAggregateBy;
    -1 "Expected Output: ", -3!.solutions.foreignKeys.medium`fkInAggregateBy
 };
