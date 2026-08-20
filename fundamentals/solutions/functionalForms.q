//====================================================================
// fundamentals — functional forms solutions
//
// Expected output per problem, computed directly (see
// fundamentals/solutions/joins.q / adverbs.q for the same reasoning -
// no risk of a typo'd expected value diverging from what the
// reference expression actually produces).
//====================================================================

.solutions.functionalForms.easy:
    `indexAt`applyDot`amendAt`amendAtValue!(
        (.forms.scores@`bob);
        ({x+y} . (3;4));
        (@[.forms.scores;`bob;{x+1}]);
        (@[.forms.scores;`bob;+;10])
    );

.solutions.functionalForms.medium:
    `dotAmendPath`dotAmendPathValue`dotAmendTableCell`funcDeleteColumn!(
        (.[.forms.nested;(`alice;`math);{x+1}]);
        (.[.forms.nested;(`alice;`sci);+;5]);
        (.[.forms.trades;(0;`price);+;10]);
        (![.forms.trades;();0b;enlist`price])
    );

.solutions.functionalForms.hard:
    `funcSelectWhereBy`funcUpdateColumn`funcSelectAggBy!(
        (?[.forms.trades;enlist(>;`size;5);(enlist`sym)!enlist`sym;(enlist`avgPrice)!enlist(avg;`price)]);
        (![.forms.trades;enlist(=;`sym;enlist`AAPL);0b;(enlist`notional)!enlist(*;`price;`size)]);
        (?[.forms.trades;enlist(>;`price;100);(enlist`sym)!enlist`sym;(enlist`totalSize)!enlist(sum;`size)])
    );
