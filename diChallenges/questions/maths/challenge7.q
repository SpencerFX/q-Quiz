/ Question Info ===============================================
/ Table Tennis Elo

/ Elo is a method of tracking historical performance and
/ estimating the chances of future success in head-to-head
/ matchups - it was made for chess, but can be applied to lots
/ of sports and video games. We'll use it here to see who's
/ been performing best in a display of god-like athleticism:
/ the AquaQ table tennis tournament.

/ The way Elo works is by comparing the expected win rate of
/ two head-to-head competitors, calculated for player a with:
/ Ea = 1 / (1 + 10^((Rb-Ra)/400))

/ Here, Ra and Rb are the ratings of teams a and b - which
/ start at 1200 and are modified with:
/ Ri' = Ri + 20(1-Ei)

/ where Ri is the old ranking, and Ri' is the updated ranking
/ for the winning team - 20(1-Ei) is the amount of points the
/ winner gains and the loser loses. For example, if Ra is 1400
/ and Rb is 1200, a has an expected win rate of around 0.75
/ over b, and if a wins, Ra gains, and Rb loses, about 5 points
/ each. Conversely if b wins, b gains and a loses about 15
/ points.

/ This dependency on the point ratings ensures that an expected
/ result doesn't change points distribution too much, but an
/ unexpected result causes a larger points swing.

/ To answer this challenge, take the input csv of table tennis
/ games, and find the difference between the best and worst
/ Elo in the final standings. You'll need to work out who won
/ in each game and update their rating after every match. When
/ calculating the final value, use only the integer part of the
/ highest and lowest values, e.g.

/ 1500.89-913.1

/ becomes

/ 1500-913

/ Task:
/ - Starting every player at a rating of 1200, replay the games
/   in chronological order, updating both players' ratings
/   after each one
/ - Once every game has been played, take the integer part of
/   the highest and lowest final ratings and return their
/   difference

/ Example:
/ Single-match illustration from the rules above, Ra=1400,
/ Rb=1200:

/ Ea ~= 0.76
/ a wins  -> Ra +~5, Rb -~5
/ b wins  -> Rb +~15, Ra -~15

/ Truncation:
/ 1500.89-913.1 -> 1500-913

/ Function Description:
/ eloDiff takes:
/   - games: list of (winner;loser) symbol pairs, one per
/     match, in the order the games were played - this is the
/     csv of results reduced to just who beat whom each row

/ Returns:
/   - difference between the integer parts of the highest and
/     lowest final Elo ratings

/ Input Format:
/ - CSV of table tennis games, one match per row, in play
/   order, from which the winner and loser of each row can be
/   determined

/ Constraints:
/ - Every player starts at a rating of 1200
/ - 1 ≤ count games

/ Notes:
/ - The same 20(1-Ei) swing applies to both players in a match
/   - the winner gains it, the loser loses it
/ - "Integer part" means truncate towards zero, not round -
/   1500.89 becomes 1500, not 1501
/ - A player can appear in later games after not playing for a
/   while - their rating simply carries over from their last
/   match

/ Goal:
/ - Process the games with a single fold, carrying the ratings
/   dictionary forward from match to match
/ =============================================================


/ Solution Info ===============================================
/ eloDiff[(`a`b;`b`a;`a`b;`a`b)]

ensurePlayer:{[ratings;p] $[p in key ratings; ratings; ratings,(enlist p)!enlist 1200f] };

playGame:{[ratings;game]
  w:game 0; l:game 1;
  ratings:ensurePlayer[ratings;w];
  ratings:ensurePlayer[ratings;l];
  rw:ratings w; rl:ratings l;
  e:1 % 1 + 10 xexp ((rl-rw)%400);
  d:20*(1-e);
  ratings[w]+:d;
  ratings[l]-:d;
  ratings
 };

eloDiff:{[games]
  finalRatings:playGame/[(`symbol$())!`float$(); games];
  vals:value finalRatings;
  (floor max vals) - (floor min vals)
 }
/ =============================================================
