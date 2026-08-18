/ Question Info ===============================================
/ Not-Quite-Blackjack

/ Imagine the thrill of the casino, right there in your
/ terminal.

/ Magnificent.

/ Today, we're playing the most sedate games of not-quite-
/ blackjack of which you could conceive. Your input is a set of
/ decks of cards, shuffled together. Draw from this deck, in
/ order, one card at a time. Any time you hit a total card
/ value of 21, you win! Any time you go over 21 you lose. In
/ either case, once a game is done, immediately start again
/ with the next card, and repeat until there are no cards left.

/ It's important to note while playing you can consider aces to
/ be 11 or 1 at any time, while 2 to 10 have their face value
/ and Jack, Queen and King are worth 10.

/ An example play is below
/ input: 3 A K 9 A 7 4 9
/ Draw a 3: current total 3
/ Draw an ace: current total 4 or 14
/ Draw a King: current total 14 or 24
/ Draw a 9: current total 23 or 33
/ This is a loss. Start again with the next card:
/ Draw an ace: current total 1 or 11
/ Draw a 7: current total 8 or 18
/ Draw a 4: current total 12 or 22
/ Draw a 9: current total 21 or 31
/ This is a win!

/ So for this input, you win one game. How many games do you
/ win with the input for this challenge?

/ Task:
/ - Draw cards one at a time from the (already shuffled) deck,
/   keeping every possible running total given each ace so far
/   could independently be worth 1 or 11
/ - As soon as 21 is one of the possible totals, that's a win,
/   and the next game starts fresh on the next card
/ - As soon as every possible total exceeds 21, that's a loss,
/   and the next game starts fresh on the next card
/ - Otherwise keep drawing into the same game
/ - Count the total number of wins across the whole input

/ Example:
/ cards = "3" "A" "K" "9" "A" "7" "4" "9"

/ countWins[cards]

/ 3,A,K,9 busts (min possible total 23) - a loss. A,7,4,9 hits
/ exactly 21 - a win.

/ Result:
/ 1

/ Function Description:
/ countWins takes:
/   - cards: list of card-rank strings in draw order ("2".."10",
/     "J", "Q", "K", "A")

/ Returns:
/   - number of games won across the whole sequence

/ Input Format:
/ - One shuffled sequence of card ranks

/ Constraints:
/ - Every card is a valid rank: "2"-"10", "J", "Q", "K", or "A"
/ - 1 ≤ count cards

/ Notes:
/ - A game can span any number of cards - it only ends on a
/   win or a loss, never on a fixed count
/ - Multiple aces in the same game are each independently 1 or
/   11 - track every distinct achievable total, not just a
/   single best-guess soft/hard pair
/ - If the deck runs out mid-game without a win or bust, that
/   partial game contributes no win (nothing to do here but
/   stop - the loop simply ends)

/ Goal:
/ - Solve for any shuffled sequence length, not just the
/   8-card example above
/ =============================================================


/ Solution Info ===============================================
/ countWins[("3";"A";"K";"9";"A";"7";"4";"9")]

cardValue:{[c]
  $[c="A"; 1 11;
    c in ("K";"J";"Q"); enlist 10;
    enlist "I"$c]
 };

countWins:{[cards]
  wins:0;
  totals:enlist 0;
  i:0;
  n:count cards;
  while[i<n;
    c:cards i;
    vals:cardValue[c];
    newTotals:distinct raze totals +/: vals;
    $[21 in newTotals;
      [wins+:1; totals:enlist 0];
      $[21<min newTotals;
        totals:enlist 0;
        totals:newTotals
       ]
     ];
    i+:1
   ];
  wins
 }
/ =============================================================
