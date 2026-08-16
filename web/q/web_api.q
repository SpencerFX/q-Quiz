//====================================================================
//
// q-Quiz — web API
//
// IPC-friendly wrappers consumed by web/services.py over qpython.
// Depends on confirmCategory, .checker.ref.dict and .checker.grade,
// all defined by hackerRank/Solutions/checker.q, which is loaded
// before this file during .quiz.init[].
//
//====================================================================

/ medium/hard categories are still unfilled placeholder stubs (`a`/`b` with
/ no real question or solution behind them) - hide them from the list
/ until real content exists. Remove this filter once they're populated.
.web.listProblems:{[]
    cats:key .checker.ref.dict;
    easyCats:cats where {`easy=`$last "." vs string x} each cats;
    raze {[cat]
        parts:"." vs string cat;
        area:`$parts 2;
        difficulty:`$parts 3;
        names:key value cat;
        ([] problem:names; area:count[names]#area; difficulty:count[names]#difficulty)
     } each easyCats
 };


/ Each problem's statement only exists as -1 "..." print lines inside its
/ .info function (eg .quiz.hackerRank.algorithms.appleAndOrange.info) -
/ there's no returned value to fetch over IPC. Rather than rewriting every
/ .info function across the problem set, read the source file directly and
/ hand back the raw lines between "info:{" and its closing "};"; web/services.py
/ regexes out the -1 "..."; wrapper. Relies on every problem file following
/ that same layout (true for all current problems).
.web.problemInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    category:confirmCategory problemName;
    if[null category; '"Unknown problem"];
    difficulty:`$("." vs string category)3;
    areaFolder:$[(string category) like "*algorithms*"; "Algorithms"; "DataStructure"];
    path:`$":hackerRank/",areaFolder,"/",string[difficulty],"/",string[problemName],".q";
    lines:read0 path;
    startIdx:first where lines like "*info:{*";
    if[null startIdx; :()];
    tailLines:(startIdx+1) _ lines;
    endOffset:first where tailLines like "*};*";
    if[null endOffset; :()];
    endOffset#tailLines
 };


.web.judge:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    result:.checker.grade[problemName;func];
    st:.z.p;
    insert[`resultsHackerRank; (problemName;result`pass;enlist result`caseActual;enlist result`caseExpected;st;st;result`area;result`difficulty)];
    actualSummary:`$" | " sv string each result`caseActual;
    expectedSummary:`$" | " sv string each result`caseExpected;
    insert[`.quiz.history; (problemName;actualSummary;expectedSummary;result`pass;`HackerRank)];
    result
 };


/ Run only - literally evaluate whatever the user typed against the
/ live q process and hand back whatever it produces (or its error),
/ with no comparison to an expected answer and nothing recorded into
/ any results table / .quiz.history. Not wrapped into the problem's
/ own function signature or base input at all - this is a raw eval, so
/ arbitrary q (assignments, multi-statement code, `system` calls, etc)
/ all work exactly as they would typed at a q console. Shared by every
/ section's run* wrapper below (see the .web.runX:.web.runRaw aliases
/ further down this file).
.web.runRaw:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    actual:.[value;enlist codeStr;{"Error: ",x}];
    `problem`output!(problemName; $[10h=type actual; actual; @[{-3!x}; actual; {"(unable to display result)"}]])
 };

.web.runProblem:.web.runRaw;


/ .quiz.history also holds HackerRank/etc submissions, so anything
/ counting or numbering multiple-choice progress has to scope to just
/ the rows for whichever bank is currently active
/ (.quiz.currentType), not the whole shared table and not the other
/ multiple-choice bank's answered questions.
.web.mcHistory:{[] select from .quiz.history where questionType=.quiz.currentType};


/ Switch which multiple-choice bank is live. MultipleChoiceSyntax
/ swaps .quiz.bank to the already-loaded .quiz.bankSyntax in place;
/ MultipleChoice reloads the original banks fresh from disk - both
/ exactly as specified for this feature, then reshuffle per-question
/ answer order the same way .quiz.init[] does at boot. Resets
/ .quiz.current so a stale in-progress question from the bank being
/ left can't get graded against the new one.
.web.setQuizMode:{[mode]
    mode:$[-11h=type mode; mode; `$mode];
    if[not mode in `MultipleChoice`MultipleChoiceSyntax; '"Unknown quiz mode"];
    $[mode=`MultipleChoiceSyntax;
        [.quiz.bank:.quiz.bankSyntax; .quiz.shuffleBank each key .quiz.bank];
        [.quiz.loadBanks[]; .quiz.shuffleBank each key .quiz.bank]
    ];
    .quiz.currentType:mode;
    .quiz.current:`;
 };


/ Pick a random unanswered multiple-choice question, mark it current
/ (so .web.submitAnswer knows what it's grading) and return it as data
/ rather than printing it, unlike .quiz.ask.
.web.nextQuestion:{[]
    mcHistory:.web.mcHistory[];
    remaining:(key .quiz.bank) except mcHistory`question;
    if[0=count remaining; '"No unanswered questions remain."];
    name:first 1?remaining;
    .quiz.current:name;
    q:.quiz.bank name;
    `question`answers`number!(q`question; q`answers; 1+count mcHistory)
 };


/ Grade the currently active question (set by .web.nextQuestion) and
/ record it in .quiz.history, same as .quiz.answer, but return the
/ verdict instead of printing it.
.web.submitAnswer:{[choice]
    choice:$[-11h=type choice; choice; `$choice];
    if[null .quiz.current; '"No active question"];
    if[not choice in `a`b`c`d; '"Answer must be one of a, b, c or d"];
    q:.quiz.bank .quiz.current;
    correct:q`correct;
    isCorrect:choice=correct;
    insert[`.quiz.history; (.quiz.current;choice;correct;isCorrect;.quiz.currentType)];
    .quiz.current:`;
    remaining:(key .quiz.bank) except .web.mcHistory[]`question;
    `correct`correctAnswer`finished!(isCorrect;correct;0=count remaining)
 };


/ Overall multiple-choice score so far.
.web.score:{[]
    h:.web.mcHistory[];
    `correct`total!(sum h`result; count h)
 };


/ Full attempt-by-attempt breakdown (both MultipleChoice and HackerRank
/ rows) with running accuracy, for the results dashboard.
.web.results:{[] .quiz.results[]};


/ Correct-answer count per category (questionType), for the profile
/ page's badges box. 0! un-keys the grouped result into a plain table
/ (questionType;correctCount) so it decodes the same way every other
/ list endpoint does, instead of needing keyed-table handling on the
/ Python side.
.web.badgeCounts:{[] 0!select correctCount:sum result by questionType from .quiz.history};


/ Completion rate per section, for the results dashboard's completion
/ chart: distinct questions/problems ever answered correctly (from
/ .quiz.history) against that section's full catalog size, as a
/ percentage. Deliberately distinct-question based rather than
/ badgeCounts' cumulative correct-attempt count above - getting the
/ same HackerRank problem right on a third resubmission shouldn't move
/ this number, only newly-solved problems should. Sections with no
/ history rows yet (lj leaves completed null) fall back to 0 via 0^,
/ same trick handles the pct column when total is ever 0 (0%0 is 0n,
/ which 0^ also cleans up).
.web.completionRates:{[]
    solvedK:select completed:count distinct question by questionType from .quiz.history where result;
    totalTypes:`MultipleChoice`MultipleChoiceSyntax`HackerRank`Idioms`DiChallenge`Leetcode`QuantRank`Fundamentals;
    totalCounts:(
        count .quiz.bank;
        count .quiz.bankSyntax;
        count .web.listProblems[];
        count .web.listIdioms[];
        count .web.listDiChallenges[];
        count .web.listLeetcode[];
        count .web.listQuantRank[];
        count .web.listFundamentals[]
    );
    t:([] questionType:totalTypes; total:totalCounts);
    t:t lj solvedK;
    t:update completed:0^completed from t;
    update pct:0^100f*completed%total from t
 };


//====================================================================
//
// AquaQ Challenges (diChallenges) - same shape of wrappers as the
// HackerRank ones above, reusing confirmDiChallengeKind, .di.ref.dict
// and .checker.normalise (from hackerRank/Solutions/checker.q, loaded
// before diChallenges during .quiz.init[]). Returns a single-case
// "cases" array (caseNo/casePass/caseActual/caseExpected) so the same
// judge.js rendering code used for HackerRank works unchanged - there's
// only ever one input per diChallenges problem right now.
//====================================================================

.web.listDiChallenges:{[]
    t: raze {[kind]
        names:key value .di.ref.dict kind;
        ([] problem:names; area:count[names]#kind; difficulty:count[names]#`easy)
     } each key .di.ref.dict;
    / problems are named "challengeN" - sort by N numerically (not the
    / raze-over-kinds order above, and not string order, which would
    / put challenge10 before challenge2) so the default "All" view on
    / the AquaQ page reads challenge0 .. challenge20 top to bottom.
    challengeNum:{[p] "I"$(count["challenge"])_string p};
    t iasc challengeNum each t`problem
 };


/ diChallenges question files use plain "/ text" comments, not the
/ .info:{} + -1 "..."; pattern hackerRank/Algorithms files use, so this
/ can't reuse .web.problemInfoLines' parser - it grabs everything after
/ the "Question Info" header up to (excluding) "Solution Info".
.web.diChallengeInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    kind:confirmDiChallengeKind problemName;
    if[null kind; '"Unknown problem"];
    path:`$":diChallenges/questions/",string[kind],"/",string[problemName],".q";
    lines:read0 path;
    startIdx:first where lines like "*Question Info*";
    if[null startIdx; :()];
    afterStart:(startIdx+1) _ lines;
    endOffset:first where afterStart like "*Solution Info*";
    if[null endOffset; endOffset:count afterStart];
    endOffset#afterStart
 };


.web.judgeDiChallenge:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    kind:confirmDiChallengeKind problemName;
    if[null kind; '"Unknown problem"];
    input:.inputs.diChallenges.easy problemName;
    expected:(value .di.ref.dict kind) problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsDiChallenges; (problemName;pass;enlist actualN;enlist expectedN;st;st;kind;`easy)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`DiChallenge)];
    `problem`kind`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;kind;`easy;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runDiChallenge:.web.runRaw;


//====================================================================
//
// leetcode - same shape of wrappers as AquaQ Challenges above, reusing
// confirmLeetcodeDifficulty, .leet.input.dict / .leet.ref.dict and
// .checker.normalise (from hackerRank/Solutions/checker.q, loaded
// before leetcode during .quiz.init[]). Also a single-case "cases"
// array, same reason as AquaQ - one input per leetcode problem.
//====================================================================

.web.listLeetcode:{[]
    raze {[difficulty]
        names:key value .leet.ref.dict difficulty;
        ([] problem:names; area:count[names]#`leetcode; difficulty:count[names]#difficulty)
     } each key .leet.ref.dict
 };


/ leetcode question files use the same plain "/ text" comment style as
/ diChallenges (Question Info ... Solution Info), so this parses the
/ same way as .web.diChallengeInfoLines - just a different questions/
/ path shape (split by difficulty, not by kind) and filenames carry a
/ leading "<n>-" LeetCode problem number the problem name doesn't, so
/ the file is found by suffix match rather than built directly.
.web.leetcodeInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    difficulty:confirmLeetcodeDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    files:key `$":leetcode/questions/",string[difficulty],"/";
    match:first files where files like "*-",string[problemName],".q";
    path:`$":leetcode/questions/",string[difficulty],"/",string match;
    lines:read0 path;
    startIdx:first where lines like "*Question Info*";
    if[null startIdx; :()];
    afterStart:(startIdx+1) _ lines;
    endOffset:first where afterStart like "*Solution Info*";
    if[null endOffset; endOffset:count afterStart];
    endOffset#afterStart
 };


.web.judgeLeetcode:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    difficulty:confirmLeetcodeDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    input:(value .leet.input.dict difficulty) problemName;
    expected:(value .leet.ref.dict difficulty) problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsLeetcode; (problemName;pass;enlist actualN;enlist expectedN;st;st;difficulty)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`Leetcode)];
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;`leetcode;difficulty;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runLeetcode:.web.runRaw;


//====================================================================
//
// qIdioms - unlike hackerRank/AquaQ/leetcode, one question FILE covers
// an entire topic (22 topics, ~460 easy idioms total) with one
// .qidiom.<topic>.<name>:{[]} print-block per idiom inside it, so the
// "problem" identifier here can't just be the bare idiom name - five
// names (shape, depth, momentOfVector, polynomialWithRoots,
// moveBlanksToEnd) are reused across/within topics, and
// qIdioms/solutions/checker.q's own confirmIdiomCategory only ever
// resolves to the first match. Sidestep that by keying everything on
// "<topic>.<name>" instead (eg "arithmetic.sumAVector"), built and
// parsed here directly rather than going through confirmIdiomCategory
// or .idiom.ref.dict. Grades against .inputs.<topic>.easy / falling
// back to that dict's first entry for the handful of duplicate-key
// names (rank.depth/shape, polynomials.polynomialWithRoots/
// momentOfVector each have several differently-numbered variants
// upstream but only the first is addressable by plain dict indexing -
// pre-existing in the source data, not introduced here).
//====================================================================

.web.listIdioms:{[]
    raze {[topic]
        names:distinct key value `$".inputs.",string[topic],".easy";
        slugs:{[topic;n] `$string[topic],".",string n}[topic;] each names;
        ([] problem:slugs; area:count[names]#topic; difficulty:count[names]#`easy)
     } each topics
 };


.web.idiomTopicName:{[problemSlug]
    problemSlug:$[-11h=type problemSlug; problemSlug; `$problemSlug];
    parts:"." vs string problemSlug;
    if[2<>count parts; '"Unknown problem"];
    topic:`$parts 0;
    name:`$parts 1;
    if[not topic in topics; '"Unknown problem"];
    if[not name in key value `$".inputs.",string[topic],".easy"; '"Unknown problem"];
    `topic`name!(topic;name)
 };


/ qIdioms question files use the same "-1 "...";" print-line pattern as
/ hackerRank (parsed by web/services.py's _INFO_LINE regex), except the
/ Input:/Expected Output: lines build their text at print time via
/ "-3!" on the live input/solution dicts rather than a static string
/ literal, so the regex (which expects a line that's nothing but a
/ quoted literal) can't capture them - drop those two raw lines and
/ rebuild them as plain literals here instead.
.web.idiomInfoLines:{[problemSlug]
    tn:.web.idiomTopicName problemSlug;
    topic:tn`topic;
    name:tn`name;
    path:`$":qIdioms/questions/",string[topic],".q";
    lines:read0 path;
    marker:".qidiom.",string[topic],".",string[name],":{";
    startIdx:first where lines like "*",marker,"*";
    if[null startIdx; :()];
    tailLines:(startIdx+1) _ lines;
    endOffset:first where tailLines like "*};*";
    if[null endOffset; :()];
    rawLines:endOffset#tailLines;
    isDynamic:(rawLines like "*Input: *")|(rawLines like "*Expected Output: *");
    cleanLines:rawLines where not isDynamic;
    input:(value `$".inputs.",string[topic],".easy") name;
    expected:(value `$".solutions.",string[topic],".easy") name;
    escQ:{[s] ssr[s;"\"";"\\\""]};
    inputLine:"    -1 \"Input: ",escQ[-3!input],"\";";
    expectedLine:"    -1 \"Expected Output: ",escQ[-3!expected],"\";";
    cleanLines,(enlist inputLine),enlist expectedLine
 };


.web.judgeIdiom:{[problemSlug;codeStr]
    tn:.web.idiomTopicName problemSlug;
    topic:tn`topic;
    name:tn`name;
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    input:(value `$".inputs.",string[topic],".easy") name;
    expected:(value `$".solutions.",string[topic],".easy") name;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    problemSlug:$[-11h=type problemSlug; problemSlug; `$problemSlug];
    insert[`resultsIdioms; (problemSlug;pass;enlist actualN;enlist expectedN;st;st;topic;`easy)];
    insert[`.quiz.history; (problemSlug;actualN;expectedN;pass;`Idioms)];
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemSlug;topic;`easy;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runIdiom:.web.runRaw;


//====================================================================
//
// quantRank - all 5 problems live under .inputs.quant.probability.*
// (easy/medium/hard) regardless of which questions/ kind-subfolder
// (probability/, recursion/) the question file is physically filed
// under - see quantRank/solutions/checker.q for why. The "problem"
// identifier is the info function's namespace segment (eg
// noWomenAtTableA), which matches the inputs dict key; solutions.q
// was renamed to the same keys (see that file for why - it used to
// use the reference *function's* name instead, eg probNoWomen, which
// didn't match the inputs side at all).
//====================================================================

.web.listQuantRank:{[]
    raze {[difficulty]
        names:key value `$".inputs.quant.probability.",string difficulty;
        ([] problem:names; area:count[names]#`probability; difficulty:count[names]#difficulty)
     } each quantRankDifficulties
 };


/ quantRank question files use the same ".info:{}" + "-1 "...";" print
/ pattern as hackerRank (parsed the same way by web/services.py), but
/ one file's info function doesn't necessarily share the file's own
/ name (eg probabilityOfGame7.q defines ...quant.probability.game7.info)
/ and kind-subfolder placement doesn't track the data namespace either,
/ so the file has to be found by scanning for the marker text rather
/ than building the path directly.
.web.quantRankQuestionPath:{[problemName]
    marker:".quiz.hackerRank.quant.probability.",string[problemName],".info:{";
    kinds:key `:./quantRank/questions/;
    allPaths:raze {[kind]
        dir:":./quantRank/questions/",string[kind],"/";
        files:key hsym `$dir;
        {[dir;f] `$dir,string f}[dir;] each files
     } each kinds;
    matches:allPaths where {[marker;p] any (read0 p) like "*",marker,"*"}[marker;] each allPaths;
    if[not count matches; '"Unknown problem"];
    first matches
 };


.web.quantRankInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    path:.web.quantRankQuestionPath problemName;
    lines:read0 path;
    startIdx:first where lines like "*info:{*";
    if[null startIdx; :()];
    tailLines:(startIdx+1) _ lines;
    endOffset:first where tailLines like "*};*";
    if[null endOffset; :()];
    endOffset#tailLines
 };


.web.judgeQuantRank:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    difficulty:confirmQuantRankDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    input:(value `$".inputs.quant.probability.",string difficulty) problemName;
    expected:(value `$".solutions.quant.probability.",string difficulty) problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsQuantRank; (problemName;pass;enlist actualN;enlist expectedN;st;st;`probability;difficulty)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`QuantRank)];
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;`probability;difficulty;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runQuantRank:.web.runRaw;


//====================================================================
//
// Jobs - a flat, read-only listing (no grading, no per-job detail
// page) seeded from jobs/jobs.q. Filtering by country happens
// client-side in web/static/jobs.js against the full list, same as
// every other section's area/difficulty filter.
//====================================================================

.web.listJobs:{[] .jobs.data };


//====================================================================
//
// Leaderboard - a flat, read-only, hypothetical listing (no grading,
// no per-row detail page) seeded from leaderboard/leaderboard.q, same
// shape as Jobs above.
//====================================================================

.web.listLeaderboard:{[] .leaderboard.data };


//====================================================================
//
// fundamentals - unlike every other section, all three difficulty
// tiers here have real (not placeholder) content, so this exposes
// easy/medium/hard all at once rather than hiding medium/hard the
// way hackerRank/qIdioms do. Resolves across kind (overloads/qsql)
// AND difficulty via confirmFundamentalsCategory (fundamentals/
// solutions/checker.q, loaded before this file during .quiz.init[]).
//====================================================================

.web.listFundamentals:{[]
    raze raze {[kind]
        {[kind;diff]
            names:key value `$".inputs.",string[kind],".",string diff;
            ([] problem:names; area:count[names]#kind; difficulty:count[names]#diff)
         }[kind;] each fundamentalsDifficulties
     } each fundamentalsKinds
 };


/ fundamentals question files use the same ".info:{}" + "-1 "...";"
/ print pattern as hackerRank (parsed the same way by
/ web/services.py), one topic+difficulty file per kind
/ (fundamentals/questions/<kind>/<difficulty>.q) holding many
/ questions - found by scanning for ".<problemName>:{" rather than
/ building the exact namespace, since the auto-generated overloads
/ functions live under .fundamentals.overloads.* while qsql's (a typo
/ in the original scaffold) live under .fundamental.qsql.* - singular.
.web.fundamentalsInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    category:confirmFundamentalsCategory problemName;
    kind:category 0;
    difficulty:category 1;
    if[null kind; '"Unknown problem"];
    path:`$":fundamentals/questions/",string[kind],"/",string[difficulty],".q";
    lines:read0 path;
    marker:".",string[problemName],":{";
    startIdx:first where lines like "*",marker,"*";
    if[null startIdx; :()];
    tailLines:(startIdx+1) _ lines;
    endOffset:first where tailLines like "*};*";
    if[null endOffset; endOffset:count tailLines];
    endOffset#tailLines
 };


.web.judgeFundamentals:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    category:confirmFundamentalsCategory problemName;
    kind:category 0;
    difficulty:category 1;
    if[null kind; '"Unknown problem"];
    input:(value `$".inputs.",string[kind],".",string difficulty) problemName;
    expected:(value `$".solutions.",string[kind],".",string difficulty) problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normaliseFundamentals actual;
    expectedN:.checker.normaliseFundamentals expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsFundamentals; (problemName;pass;enlist actualN;enlist expectedN;st;st;kind;difficulty)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`Fundamentals)];
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;kind;difficulty;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runFundamentals:.web.runRaw;


//====================================================================
//
// Profile — a single local profile (no login), stored in q and
// persisted to ./profile/ so it survives a server restart. Guarded so
// re-loading this script (once per new web/qclient.py connection)
// doesn't clobber an already-initialised in-memory profile.
//
//====================================================================

.profile.defaultInfo:`name`tagline`email`phone`location`resumeFilename`photoFilename!("";"";"";"";"";"";"");

.profile.init:{[]
    .profile.info:@[get; `:./profile/info; {.profile.defaultInfo}];
    / backfills any default keys (eg photoFilename) missing from a profile/info
    / file saved before that key existed, without touching real values
    .profile.info:.profile.defaultInfo,.profile.info;
    .profile.experience:@[get; `:./profile/experience; {([] id:`long$(); company:(); title:(); startDate:(); endDate:(); location:(); description:())}];
    .profile.education:@[get; `:./profile/education; {([] id:`long$(); school:(); degree:(); startDate:(); endDate:())}];
    .profile.links:@[get; `:./profile/links; {([] id:`long$(); label:(); url:())}];
    .profile.skills:@[get; `:./profile/skills; {([] id:`long$(); skill:())}];
 };

if[(@[value; `.profile.info; {`NOTSET}])~`NOTSET; .profile.init[]];

.profile.save:{[]
    `:./profile/info set .profile.info;
    `:./profile/experience set .profile.experience;
    `:./profile/education set .profile.education;
    `:./profile/links set .profile.links;
    `:./profile/skills set .profile.skills;
 };

.profile.nextId:{[t] $[0=count t; 0; 1+max t`id]};

.web.profile.get:{[]
    .profile.info,`registered`experience`education`links`skills!(
        0<count .profile.info`name;
        .profile.experience;
        .profile.education;
        .profile.links;
        .profile.skills
    )
 };

.web.profile.register:{[name;tagline;email;phone;location]
    .profile.info:.profile.info,`name`tagline`email`phone`location!(name;tagline;email;phone;location);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.setResume:{[filename]
    .profile.info[`resumeFilename]:filename;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.setPhoto:{[filename]
    .profile.info[`photoFilename]:filename;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addExperience:{[company;title;startDate;endDate;location;description]
    id:.profile.nextId[.profile.experience];
    `.profile.experience insert (id;company;title;startDate;endDate;location;description);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeExperience:{[targetId]
    .profile.experience:delete from .profile.experience where id=targetId;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addEducation:{[school;degree;startDate;endDate]
    id:.profile.nextId[.profile.education];
    `.profile.education insert (id;school;degree;startDate;endDate);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeEducation:{[targetId]
    .profile.education:delete from .profile.education where id=targetId;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addLink:{[label;url]
    id:.profile.nextId[.profile.links];
    `.profile.links insert (id;label;url);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeLink:{[targetId]
    .profile.links:delete from .profile.links where id=targetId;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addSkill:{[skill]
    id:.profile.nextId[.profile.skills];
    `.profile.skills insert (id;skill);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeSkill:{[targetId]
    .profile.skills:delete from .profile.skills where id=targetId;
    .profile.save[];
    .web.profile.get[]
 };
//====================================================================
