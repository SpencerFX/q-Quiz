/ Question Info ===============================================
/ Milk And Cereal

/ While out shopping, you realise you're not sure how much milk
/ and cereal you have in the house. What you do have however is
/ a handy terminal session (preferably running kdb+, but other
/ languages are acceptable), and a csv of milk and cereal
/ purchases (in ml and g, respectively), which you've updated
/ every time you've been shopping in the last while.

/ Once per day, if you have enough of both, you use 100ml of
/ milk and 100g of cereal. Milk always expires on the 5th day
/ after you buy it, after you use it that morning, and you
/ always use your oldest unexpired milk to avoid waste. You
/ always buy new milk after breakfast, and cereal before
/ breakfast (i.e. never use milk as soon as you get it, but you
/ can use cereal as soon as you get it if you already have
/ milk).

/ For example, if on day 1 you buy 1000ml of milk and 1000g of
/ cereal, and then on day 5 you buy 1000ml of milk, your milk
/ and cereal up to day six would look like this:

/ day milk cereal
/ ---------------
/ 1   1000 1000
/ 2   900  900
/ 3   800  800
/ 4   700  700
/ 5   1600 600
/ 6   1000 500

/ On days 1, 2, 3, and 4, you use 100g each of milk and cereal,
/ without any new milk or cereal coming in. On day 5, you have
/ breakfast as normal and later get your 1000g of milk. On day
/ 6, you use 100g of your oldest milk and none of your newest
/ milk, then throw the old milk away, leaving you with 1000g of
/ milk, while cereal has steadily reduced to 500g.

/ It's currently one day after the last date in your input -
/ what's the sum of your remaining milk and cereal?

/ Task:
/ - Replay every day from day 1 up to (and including) one day
/   after the last purchase date
/ - Each day: add today's cereal purchase, consume 100ml milk
/   and 100g cereal together if both are available, add today's
/   milk purchase (only usable from tomorrow), then discard
/   whatever remains of the batch bought exactly 5 days ago
/ - Return the sum of the final milk and cereal totals

/ Example:
/ milkByDay = day 1 -> 1000, day 5 -> 1000
/ cerealByDay = day 1 -> 1000

/ solve[milkByDay;cerealByDay]

/ Daily milk/cereal totals (see table above), ending on day 6
/ (one day after the last input date, day 5):
/ milk 1000, cereal 500

/ Result:
/ 1500

/ Function Description:
/ solve takes:
/   - milkByDay: dictionary of purchase day -> ml of milk
/     bought that day (from the input csv)
/   - cerealByDay: dictionary of purchase day -> g of cereal
/     bought that day (from the input csv)

/ Returns:
/   - sum of remaining milk and cereal one day after the last
/     purchase date in the input

/ Input Format:
/ - CSV of milk and cereal purchases, one row per purchase,
/   with a date, an amount, and whether it's milk (ml) or
/   cereal (g)

/ Constraints:
/ - Day numbers are positive integers
/ - Amounts are non-negative

/ Notes:
/ - Cereal never expires - only milk does
/ - "Enough of both" means the day's use only happens if both
/   milk and cereal are at least 100 that morning - there's no
/   partial use
/ - A milk batch bought on day d is usable on mornings
/   d+1 .. d+5 inclusive, then discarded regardless of how much
/   is left in it

/ Goal:
/ - Solve for an arbitrary purchase history, not just the
/   6-day example
/ =============================================================


/ Solution Info ===============================================
/ milkByDay:1 5!1000 1000f
/ cerealByDay:enlist[1]!enlist 1000f
/ solve[milkByDay;cerealByDay]

fifoDeduct:{[amounts;need]
  r:{[acc;a]
      rem:acc`rem;
      take:rem & a;
      newAmt:a-take;
      `rem`amts!(rem-take; acc[`amts],newAmt)
    }/[`rem`amts!(need;`float$());amounts];
  r`amts
 };

processDay:{[state;d]
  cereal:state`cereal;
  milk:state`milk;

  cereal+:0f^state[`cerealByDay] d;

  availMilk:sum value milk;

  if[(availMilk>=100) & (cereal>=100);
    cereal-:100;
    days:asc key milk;
    newAmts:fifoDeduct[milk days;100];
    milk:days!newAmts;
   ];

  todaysMilk:0f^state[`milkByDay] d;
  if[todaysMilk>0; milk[d]:todaysMilk];

  expireDay:d-5;
  if[expireDay in key milk; milk:expireDay _ milk];

  state[`cereal]:cereal;
  state[`milk]:milk;
  state
 };

solve:{[milkByDay;cerealByDay]
  lastDay:max raze (key milkByDay; key cerealByDay);
  days:1+til lastDay+1;
  initState:`cereal`milk`milkByDay`cerealByDay!(0f;(`long$())!`float$();milkByDay;cerealByDay);
  finalState:processDay/[initState;days];
  finalState[`cereal] + sum value finalState[`milk]
 }
/ =============================================================
