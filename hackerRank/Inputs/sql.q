//====================================================================
// hackerRank/Inputs/sql.q
//
// Every SQL problem's function is niladic ({[] ...}) - it queries the
// global tables from hackerRank/data/tables.q directly rather than
// taking arguments. The input registered per problem is `enlist ()`,
// not bare `()` - .checker.grade wraps whatever's registered here in
// one more `enlist` before handing it to .[func;input;errFn], and
// .[f;();e] does NOT correctly niladic-call f (it signals a genuine
// 'type error) the way .[f;enlist ();e] does, so the extra enlist
// here is what makes the wrapped form come out right on the other end.
//====================================================================

.inputs.sql.easy: (!) . flip raze 2 cut
    (
        (`revisingSelectQueryI; enlist ());
        (`revisingSelectQueryII; enlist ());
        (`selectAll; enlist ());
        (`selectById; enlist ());
        (`japaneseCitiesAttributes; enlist ());
        (`japaneseCitiesNames; enlist ());
        (`revisingAggregationsCount; enlist ());
        (`revisingAggregationsSum; enlist ());
        (`revisingAggregationsAvg; enlist ());
        (`averagePopulation; enlist ());
        (`japanPopulation; enlist ());
        (`populationDensityDifference; enlist ());
        (`weatherStation1; enlist ());
        (`weatherStation2; enlist ());
        (`weatherStation3; enlist ());
        (`weatherStation4; enlist ());
        (`weatherStation5; enlist ());
        (`weatherStation6; enlist ());
        (`weatherStation7; enlist ());
        (`weatherStation8; enlist ());
        (`weatherStation9; enlist ());
        (`weatherStation10; enlist ());
        (`weatherStation11; enlist ());
        (`weatherStation12; enlist ());
        (`weatherStation13; enlist ());
        (`weatherStation14; enlist ());
        (`weatherStation15; enlist ());
        (`weatherStation16; enlist ());
        (`weatherStation17; enlist ());
        (`higherThan75Marks; enlist ());
        (`employeeNames; enlist ());
        (`employeeSalaries; enlist ());
        (`typeOfTriangle; enlist ());
        (`theBlunder; enlist ());
        (`topEarners; enlist ())
    );

.inputs.sql.medium: (!) . flip raze 2 cut
    (
        (`thePads; enlist ());
        (`binaryTreeNodes; enlist ());
        (`newCompanies; enlist ());
        (`weatherStation18; enlist ());
        (`weatherStation19; enlist ())
    );
