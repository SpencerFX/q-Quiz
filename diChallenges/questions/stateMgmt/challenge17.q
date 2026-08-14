/ Question Info ===============================================
/ National Shame Streak

/ It's the world cup! National glory is at stake! But who has
/ accrued the most national shame?

/ We'll define shame as days on a goalless streak - any
/ national team who plays an international game and finishes
/ without scoring is in a state of shame, starting that day.
/ The shame ends the day they score a goal in another
/ international game. Your input is a list of international
/ football matches going back to November 1872, and ending
/ 2018.06.24. Which nation has the longest closed goalless
/ streak, across which dates? Any goalless streak currently
/ running shouldn't be counted, and the answer should be
/ presented as:
/ team startdate enddate

/ with dates in YYYYMMDD format. The answer is case-sensitive!

/ For example, slightly reformatted results for three teams are
/ like so:

/ team       date       score
/ ---------------------------
/ Somaliland 1900.01.01 1
/ Formosa    1900.01.01 0
/ Genoa      1900.01.01 1
/ Genoa      1900.01.02 0
/ Somaliland 1900.01.03 0
/ Genoa      1900.01.03 0
/ Genoa      1900.01.06 0
/ Genoa      1901.01.21 1
/ Somaliland 1902.01.01 1

/ The longest streak here is Somaliland, so the answer would be
/ Somaliland 19000103 19020101

/ Task:
/ - For each team, walk their matches in date order; a scoreless
/   result (score=0) opens a streak on that date if one isn't
/   already open, and a scoring result (score>0) closes any
/   currently open streak on that date
/ - Among every streak that actually closed (ignore any team's
/   streak still open at the end of the data), find the one
/   spanning the most calendar days from start to end
/ - Report it as "team startdate enddate"

/ Example:
/ matches = the 9 rows above (team, date, score)

/ findLongestShame[matches]

/ Somaliland: goalless 1900.01.03, scores again 1902.01.01 ->
/ closed streak of ~2 years
/ Genoa: goalless 1900.01.02, scores again 1901.01.21 -> closed
/ streak of ~1 year (shorter, not picked)
/ Formosa: goalless 1900.01.01, never plays again -> streak
/ never closes, excluded entirely

/ Result:
/ "Somaliland 19000103 19020101"

/ Function Description:
/ findLongestShame takes:
/   - matches: table with columns team, date, score - one row
/     per international match result for that team

/ Returns:
/   - "team startdate enddate" string for the longest closed
/     goalless streak across every team, dates as YYYYMMDD

/ Input Format:
/ - Table/CSV of match results: team, date, score

/ Constraints:
/ - Multiple teams may have matches on the same date
/ - A team may have several matches on record; results for a
/   given team should be processed in date order
/ - There is a unique longest closed streak in the real input

/ Notes:
/ - A streak's start date is the FIRST goalless match after the
/   team was last not-in-shame, not the most recent one -
/   further goalless matches while already in shame don't move
/   the start date
/ - Team names are case-sensitive in the output
/ - "Longest" is measured in calendar days between start and
/   end date, not number of goalless matches

/ Goal:
/ - Solve for any number of teams/matches, not just the
/   3-team, 9-row example above
/ =============================================================


/ Solution Info ===============================================
/ matches:([] team:`Somaliland`Formosa`Genoa`Genoa`Somaliland`Genoa`Genoa`Genoa`Somaliland;
/             date:1900.01.01 1900.01.01 1900.01.01 1900.01.02 1900.01.03 1900.01.03 1900.01.06 1901.01.21 1902.01.01;
/             score:1 0 1 0 0 0 0 1 1)
/ findLongestShame[matches]

streaksForTeam:{[t]
  t:`date xasc t;
  n:count t;
  result:();
  streakStart:0Nd;
  i:0;
  while[i<n;
    d:t[`date] i;
    s:t[`score] i;
    $[s>0;
      $[not null streakStart; [result,:enlist (streakStart;d); streakStart:0Nd]; []];
      $[null streakStart; streakStart:d; []]
     ];
    i+:1
   ];
  result
 };

fmtDate:{[d] (string d) except "." };

findLongestShame:{[matches]
  teams:distinct matches`team;
  allStreaks:raze {[matches;teamSym]
    tm:select from matches where team=teamSym;
    streaks:streaksForTeam[tm];
    {[teamSym;x] (teamSym;x 0;x 1)}[teamSym;] each streaks
   }[matches;] each teams;
  durations:{[x] `long$(x 2)-x 1} each allStreaks;
  best:first allStreaks where durations=max durations;
  " " sv (string best 0; fmtDate best 1; fmtDate best 2)
 }
/ =============================================================
