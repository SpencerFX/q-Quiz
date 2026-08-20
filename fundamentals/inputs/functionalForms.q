//====================================================================
// fundamentals — functional forms inputs
//
// Own dedicated fixtures, same pattern as
// fundamentals/inputs/joins.q and fundamentals/inputs/adverbs.q.
// Covers @ (index/amend) and . (apply/amend-by-path), then the
// functional forms of qsql itself: ? (select) and ! (update/delete).
//====================================================================

.forms.scores:`alice`bob`carol!85 92 78;

.forms.nested:`alice`bob!(`math`sci!85 90; `math`sci!70 75);

.forms.trades:([]
    time:09:30:00 09:31:00 09:32:00 09:33:00;
    sym:`AAPL`GOOG`AAPL`MSFT;
    price:100.0 200.0 101.0 300.0;
    size:10 3 8 4
 );

.inputs.functionalForms.easy:
    `indexAt`applyDot`amendAt`amendAtValue!(
        (.forms.scores; `bob);
        ({x+y}; (3;4));
        (.forms.scores; `bob);
        (.forms.scores; `bob)
    );

.inputs.functionalForms.medium:
    `dotAmendPath`dotAmendPathValue`dotAmendTableCell`funcDeleteColumn!(
        (.forms.nested; (`alice;`math));
        (.forms.nested; (`alice;`sci); 5);
        (enlist .forms.trades);
        (enlist .forms.trades)
    );

.inputs.functionalForms.hard:
    `funcSelectWhereBy`funcUpdateColumn`funcSelectAggBy!(
        (enlist .forms.trades);
        (enlist .forms.trades);
        (enlist .forms.trades)
    );
