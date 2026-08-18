/ Question Info ===============================================
/ Solo Bingo

/ After watching approximately 15 minutes of daytime
/ television, you're overcome with the irresistible urge to
/ play bingo. You decide to play alone to hide your shame at
/ being seduced by ads on TV, and start with the US standard
/ game, using the 5x5 number grid below:

/ 6  17 34 50 68
/ 10 21 45 53 66
/ 5  25 36 52 69
/ 14 30 33 54 63
/ 15 23 41 51 62

/ In this game, you win when you get all the numbers in a row,
/ column or diagonal. So for example, if the numbers
/ 10 5 21 45 53 70 66 4 were called, your game would be over as
/ soon as 66 was called - the game is ended in 7 turns, because
/ you are the only player.

/ The input attached is a list of called number sequences. What
/ is the sum of the amount of numbers it takes in each row to
/ end the game? If the above input was repeated 4 times, the
/ answer would be 28.

/ Task:
/ - For each call sequence, find the fewest calls needed before
/   some row, column, or diagonal of the fixed grid is fully
/   covered by the calls made so far
/ - Sum that turn count across every sequence in the input

/ Example:
/ games = enlist (10 5 21 45 53 70 66 4)

/ turnsToWin[10 5 21 45 53 70 66 4]

/ Row "10 21 45 53 66" is complete the instant 66 is called,
/ which is the 7th number in the sequence

/ Result:
/ 7 (or 28 if that same sequence is used for 4 separate games)

/ Function Description:
/ sumTurnsToWin takes:
/   - games: list of call sequences, one per independent game

/ Returns:
/   - sum, across all games, of the number of calls needed
/     before that game's grid has a complete row, column, or
/     diagonal

/ Input Format:
/ - One call sequence per line

/ Constraints:
/ - The grid is always the fixed 5x5 grid shown above
/ - Every sequence eventually completes at least one line
/ - Extra numbers may be called after the game is already won -
/   they don't affect the result

/ Notes:
/ - There are 12 winning lines on a 5x5 grid: 5 rows, 5
/   columns, and the 2 diagonals
/ - A line wins as soon as all 5 of its numbers have appeared
/   among the calls so far, not necessarily in any particular
/   order relative to each other
/ - The turn count is 1-based - it's how many numbers had been
/   called (not the index of the winning number)

/ Goal:
/ - Solve for any call sequence against the fixed grid, not
/   just the 8-number example
/ =============================================================


/ Solution Info ===============================================
/ turnsToWin[10 5 21 45 53 70 66 4]
/ sumTurnsToWin[4#enlist 10 5 21 45 53 70 66 4]

grid:(6 17 34 50 68;10 21 45 53 66;5 25 36 52 69;14 30 33 54 63;15 23 41 51 62);

mainDiag:{grid[x;x]} each til 5;
antiDiag:{grid[x;4-x]} each til 5;
lines:grid,(flip grid),(enlist mainDiag),(enlist antiDiag);

turnsToWin:{[calls]
  ts:1+til count calls;
  wins:{[calls;lines;t] any {[line;c] all line in c}[;t#calls] each lines}[calls;lines;] each ts;
  first ts where wins
 };

sumTurnsToWin:{[games] sum turnsToWin each games }
/ =============================================================
