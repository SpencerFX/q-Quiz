//====================================================================
// HARD
//====================================================================

.fundamental.qsql.rollingVolatility:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Rolling Volatility";
    -1 "======================================";
    -1 "";
    -1 "Calculate rolling volatility using input: .inputs.qsql.hard.rollingVolatility";
    -1 "Input: ", -3!.inputs.qsql.hard`rollingVolatility;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`rollingVolatility
 };

.fundamental.qsql.leftJoin:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Left Join";
    -1 "======================================";
    -1 "";
    -1 "Perform a left join between tables using input: .inputs.qsql.hard.leftJoin";
    -1 "Input: ", -3!.inputs.qsql.hard`leftJoin;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`leftJoin
 };

.fundamental.qsql.asofJoin:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - As-Of Join";
    -1 "======================================";
    -1 "";
    -1 "Perform an as-of join between trades and quotes using input: .inputs.qsql.hard.asofJoin";
    -1 "Input: ", -3!.inputs.qsql.hard`asofJoin;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`asofJoin
 };

.fundamental.qsql.tradeToMidMarkout:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Trade To Mid Markout";
    -1 "======================================";
    -1 "";
    -1 "Calculate trade-to-mid markout using input: .inputs.qsql.hard.tradeToMidMarkout";
    -1 "Input: ", -3!.inputs.qsql.hard`tradeToMidMarkout;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`tradeToMidMarkout
 };

.fundamental.qsql.vwap:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - VWAP";
    -1 "======================================";
    -1 "";
    -1 "Calculate volume-weighted average price using input: .inputs.qsql.hard.vwap";
    -1 "Input: ", -3!.inputs.qsql.hard`vwap;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`vwap
 };

.fundamental.qsql.participationRate:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Participation Rate";
    -1 "======================================";
    -1 "";
    -1 "Calculate client participation rate using input: .inputs.qsql.hard.participationRate";
    -1 "Input: ", -3!.inputs.qsql.hard`participationRate;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`participationRate
 };

.fundamental.qsql.tradeClassification:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Trade Classification";
    -1 "======================================";
    -1 "";
    -1 "Classify trades and calculate signed distance using input: .inputs.qsql.hard.tradeClassification";
    -1 "Input: ", -3!.inputs.qsql.hard`tradeClassification;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`tradeClassification
 };

.fundamental.qsql.adverseSelection:{[]
    -1 "";
    -1 "======================================";
    -1 " qIdiom - QSQL - Adverse Selection";
    -1 "======================================";
    -1 "";
    -1 "Calculate adverse selection from trade markouts using input: .inputs.qsql.hard.adverseSelection";
    -1 "Input: ", -3!.inputs.qsql.hard`adverseSelection;
    -1 "Expected Output: ", -3!.solutions.qsql.hard`adverseSelection
 };