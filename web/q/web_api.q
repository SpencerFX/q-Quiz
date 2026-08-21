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

//====================================================================
//
// Saved codepad content - the exact text a signed-in user last
// submitted for a given problem, so returning to that problem page
// later loads it back into the editor instead of the blank
// placeholder. Keyed (section;problem;user), so the same problem
// slug in two different sections (unlikely, but eg qIdioms slugs
// could theoretically collide with something else) never overwrites
// the wrong one. Anonymous submissions (.web.currentUser null) are
// silently not persisted - there's no stable identity to key them on.
//====================================================================

.web.savedCode:([section:`symbol$(); problem:`symbol$(); user:`symbol$()] code:(); ts:`timestamp$());

/ Called from every section's judge* function below, right alongside
/ the .quiz.history insert each of them already does.
.web.saveCode:{[section;problem;code]
    if[null .web.currentUser; :(::)];
    `.web.savedCode upsert (section;problem;.web.currentUser;code;.z.p);
 };

/ Called from every section's get_info (web/services.py) so the
/ problem page's one info-fetch-on-load also recovers any saved code,
/ instead of needing a second round trip. Unlike .web.saveCode above
/ (always called from q-side judge* functions with already-normalized
/ symbols), this is called directly from Python with plain strings, so
/ section/problem need normalizing here.
.web.getSavedCode:{[section;problem]
    if[null .web.currentUser; :""];
    section:$[-11h=type section; section; `$section];
    problem:$[-11h=type problem; problem; `$problem];
    k:(section;problem;.web.currentUser);
    if[not k in key .web.savedCode; :""];
    .web.savedCode[k]`code
 };


/ Per-problem progress status for a list page, from .quiz.history:
/ `solved (passed at least once), `attempted (submitted but never
/ passed) or `unattempted (no submission on record at all). Shared by
/ every section's list* function below so the problem list pages can
/ show progress at a glance instead of only on the Results dashboard.
.web.problemStatus:{[qtype;names]
    hist:select from .quiz.history where questionType=qtype;
    solved:distinct exec question from hist where result;
    attempted:distinct exec question from hist;
    {[solved;attempted;n] $[n in solved;`solved;n in attempted;`attempted;`unattempted]}[solved;attempted;] each names
 };

/ algorithms/dataStructures medium/hard categories are still unfilled
/ placeholder stubs (`a`/`b` with no real question or solution behind
/ them) - hide those from the list until real content exists. sql is
/ exempt since its medium tier has real problems; remove this filter
/ entirely once algorithms/dataStructures catch up.
.web.listProblems:{[]
    cats:key .checker.ref.dict;
    easyCats:cats where {(`easy=`$last "." vs string x) or (`sql=`$("." vs string x)2)} each cats;
    t:raze {[cat]
        parts:"." vs string cat;
        area:`$parts 2;
        difficulty:`$parts 3;
        names:key value cat;
        ([] problem:names; area:count[names]#area; difficulty:count[names]#difficulty)
     } each easyCats;
    update status:.web.problemStatus[`HackerRank;problem] from t
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
    areaFolder:$[
        (string category) like "*algorithms*"; "Algorithms";
        (string category) like "*sql*"; "SQL";
        "DataStructure"
    ];
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
    .web.saveCode[`HackerRank;problemName;codeStr];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    result:.checker.grade[problemName;func];
    st:.z.p;
    insert[`resultsHackerRank; (problemName;result`pass;enlist result`caseActual;enlist result`caseExpected;st;st;result`area;result`difficulty)];
    actualSummary:`$" | " sv string each result`caseActual;
    expectedSummary:`$" | " sv string each result`caseExpected;
    insert[`.quiz.history; (problemName;actualSummary;expectedSummary;result`pass;`HackerRank;.web.currentUser)];
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


/ Switch which multiple-choice bank is live. MultipleChoiceSyntax and
/ MultipleChoiceDebug swap .quiz.bank to the already-loaded
/ .quiz.bankSyntax/.quiz.bankDebug in place; MultipleChoice reloads
/ the original banks fresh from disk - both exactly as specified for
/ this feature, then reshuffle per-question answer order the same way
/ .quiz.init[] does at boot. Resets .quiz.current so a stale
/ in-progress question from the bank being left can't get graded
/ against the new one.
.web.setQuizMode:{[mode]
    mode:$[-11h=type mode; mode; `$mode];
    if[not mode in `MultipleChoice`MultipleChoiceSyntax`MultipleChoiceDebug; '"Unknown quiz mode"];
    $[mode=`MultipleChoiceSyntax;
        [.quiz.bank:.quiz.bankSyntax; .quiz.shuffleBank each key .quiz.bank];
    mode=`MultipleChoiceDebug;
        [.quiz.bank:.quiz.bankDebug; .quiz.shuffleBank each key .quiz.bank];
        [.quiz.loadBanks[]; .quiz.shuffleBank each key .quiz.bank]
    ];
    .quiz.currentType:mode;
    .quiz.current:`;
 };


/ When every answer choice for a question happens to be the same short
/ length (eg a "which punctuation does X" question with 1-char answer
/ choices - see banks/syntax/easy.q's `semicolon` question), q's list
/ builder silently conflates the 4 equal-length char vectors into one
/ flat char vector, so indexing the resulting answers dict by `a/`b/`c/`d
/ hands back a bare char ATOM instead of a 1-char string. qpython's
/ dict decoder can't handle a dict whose values collapsed to a flat
/ vector like that and errors out, so re-box every value as a proper
/ char vector before it goes anywhere near IPC - a no-op for every
/ question where q already kept the answers as separate strings.
.web.safeAnswers:{[d] (key d)!{$[10h=type x; x; enlist x]} each value d};

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
    `question`answers`number!(q`question; .web.safeAnswers q`answers; 1+count mcHistory)
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
    insert[`.quiz.history; (.quiz.current;choice;correct;isCorrect;.quiz.currentType;.web.currentUser)];
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
/ rows) with running accuracy, for the results dashboard. Scoped to
/ whoever is currently signed in (.web.currentUser, kept in sync with
/ the Flask session by web/qclient.py before every request) - empty
/ when nobody's signed in, rather than dumping every visitor's
/ combined history. Running stats (runningCorrect/percentCorrect) are
/ recomputed over just this user's rows, not .quiz.results[]'s global
/ ones, since "row 3 of everyone's history" isn't a meaningful
/ position once the rows shown are scoped to one person.
.web.results:{[]
    h:$[null .web.currentUser; 0#.quiz.history; select from .quiz.history where user=.web.currentUser];
    if[0=count h; :h];
    update runningCorrect:sums result, questionNo:1+til count h, percentCorrect:100f*(sums result)%(1+til count h), category:.quiz.questionCategory question from h
 };


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
    totalTypes:`MultipleChoice`MultipleChoiceSyntax`MultipleChoiceDebug`HackerRank`Idioms`DiChallenge`Leetcode`QuantRank`Fundamentals`Euler`AdventOfCode;
    totalCounts:(
        count .quiz.bank;
        count .quiz.bankSyntax;
        count .quiz.bankDebug;
        count .web.listProblems[];
        count .web.listIdioms[];
        count .web.listDiChallenges[];
        count .web.listLeetcode[];
        count .web.listQuantRank[];
        count .web.listFundamentals[];
        count .web.listEuler[];
        count .web.listAdventOfCode[]
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
    t:update status:.web.problemStatus[`DiChallenge;problem] from t;
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
    .web.saveCode[`DiChallenge;problemName;codeStr];
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
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`DiChallenge;.web.currentUser)];
    `problem`kind`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;kind;`easy;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runDiChallenge:.web.runRaw;


//====================================================================
//
// Project Euler - same shape of wrappers as AquaQ Challenges above,
// but flat (no kind sub-split): every problem lives directly in
// .inputs.euler.easy / .solutions.euler.easy, keyed by problem name.
//====================================================================

.web.listEuler:{[]
    names:key .inputs.euler.easy;
    t:([] problem:names; area:count[names]#`euler; difficulty:count[names]#`easy);
    t:update status:.web.problemStatus[`Euler;problem] from t;
    / problems are named "problemNNNN" - sort numerically so the list
    / reads problem0001 .. problem0008 top to bottom, same reasoning as
    / .web.listDiChallenges' challengeNum sort.
    problemNum:{[p] "I"$(-4)#string p};
    t iasc problemNum each t`problem
 };


/ Euler files start with a "/ PROBLEM N ===...===" header line, a few
/ "/"/"//" comment lines describing the problem, then close with a
/ lone "/ ===...===" rule before the code starts - reuse that existing
/ structure rather than adding diChallenges-style "Question Info"/
/ "Solution Info" markers, so the problem files stay exactly as given.
.web.eulerInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.euler.easy; '"Unknown problem"];
    path:`$":euler/questions/",string[problemName],".q";
    lines:read0 path;
    endIdx:first where lines like "/ ===*";
    if[null endIdx; :()];
    1_ endIdx#lines
 };


.web.judgeEuler:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.euler.easy; '"Unknown problem"];
    .web.saveCode[`Euler;problemName;codeStr];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    input:.inputs.euler.easy problemName;
    expected:.solutions.euler.easy problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsEuler; (problemName;pass;enlist actualN;enlist expectedN;st;st)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`Euler;.web.currentUser)];
    `problem`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runEuler:.web.runRaw;


//====================================================================
//
// Advent of Code - same shape of wrappers as Project Euler above:
// flat, single tier, every problem in .inputs.adventOfCode.easy /
// .solutions.adventOfCode.easy keyed by problem name. Every dayNN
// function is a single positional arg (the puzzle input as a list of
// strings) returning a 2-element (part1;part2) result.
//====================================================================

.web.listAdventOfCode:{[]
    names:key .inputs.adventOfCode.easy;
    t:([] problem:names; area:count[names]#`adventOfCode; difficulty:count[names]#`easy);
    update status:.web.problemStatus[`AdventOfCode;problem] from t
 };


/ Advent of Code files start with a "/ PUZZLE N ===...===" header
/ line, a few "/" comment lines describing the problem, then close
/ with a lone "/ ===...===" rule before the code starts - same
/ boundary convention as .web.eulerInfoLines.
.web.adventOfCodeInfoLines:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.adventOfCode.easy; '"Unknown problem"];
    path:`$":adventOfCode/questions/",string[problemName],".q";
    lines:read0 path;
    endIdx:first where lines like "/ ===*";
    if[null endIdx; :()];
    1_ endIdx#lines
 };


.web.judgeAdventOfCode:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.adventOfCode.easy; '"Unknown problem"];
    .web.saveCode[`AdventOfCode;problemName;codeStr];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    input:.inputs.adventOfCode.easy problemName;
    expected:.solutions.adventOfCode.easy problemName;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsAdventOfCode; (problemName;pass;enlist actualN;enlist expectedN;st;st)];
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`AdventOfCode;.web.currentUser)];
    `problem`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;pass;enlist 1;enlist pass;enlist actualN;enlist expectedN)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runAdventOfCode:.web.runRaw;


//====================================================================
//
// leetcode - same shape of wrappers as AquaQ Challenges above, reusing
// confirmLeetcodeDifficulty, .leet.input.dict / .leet.ref.dict and
// .checker.normalise (from hackerRank/Solutions/checker.q, loaded
// before leetcode during .quiz.init[]). Also a single-case "cases"
// array, same reason as AquaQ - one input per leetcode problem.
//====================================================================

.web.listLeetcode:{[]
    t:raze {[difficulty]
        names:key value .leet.ref.dict difficulty;
        ([] problem:names; area:count[names]#`leetcode; difficulty:count[names]#difficulty)
     } each key .leet.ref.dict;
    update status:.web.problemStatus[`Leetcode;problem] from t
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
    .web.saveCode[`Leetcode;problemName;codeStr];
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
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`Leetcode;.web.currentUser)];
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
    t:raze {[topic]
        names:distinct key value `$".inputs.",string[topic],".easy";
        slugs:{[topic;n] `$string[topic],".",string n}[topic;] each names;
        ([] problem:slugs; area:count[names]#topic; difficulty:count[names]#`easy)
     } each topics;
    update status:.web.problemStatus[`Idioms;problem] from t
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
    problemSlug:$[-11h=type problemSlug; problemSlug; `$problemSlug];
    tn:.web.idiomTopicName problemSlug;
    topic:tn`topic;
    name:tn`name;
    .web.saveCode[`Idioms;problemSlug;codeStr];
    func:@[value; codeStr; {'"Could not parse submission: ",x}];
    input:(value `$".inputs.",string[topic],".easy") name;
    expected:(value `$".solutions.",string[topic],".easy") name;
    actual:.[func;input;{"Error with ",x}];
    actualN:.checker.normalise actual;
    expectedN:.checker.normalise expected;
    pass:actualN=expectedN;
    st:.z.p;
    insert[`resultsIdioms; (problemSlug;pass;enlist actualN;enlist expectedN;st;st;topic;`easy)];
    insert[`.quiz.history; (problemSlug;actualN;expectedN;pass;`Idioms;.web.currentUser)];
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
    t:raze {[difficulty]
        names:key value `$".inputs.quant.probability.",string difficulty;
        ([] problem:names; area:count[names]#`probability; difficulty:count[names]#difficulty)
     } each quantRankDifficulties;
    update status:.web.problemStatus[`QuantRank;problem] from t
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
    .web.saveCode[`QuantRank;problemName;codeStr];
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
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`QuantRank;.web.currentUser)];
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
// Leaderboard - real standings derived from .quiz.history's user
// column (see .web.currentUser / web/qclient.py), not the fictional
// seed data leaderboard/leaderboard.q used to hold. Ranked by score
// (total correct submissions, repeats included) descending; "solved"
// is distinct correctly-answered questions, which can be lower than
// score if the same question was answered correctly more than once.
// Rows with no signed-in user attached are excluded entirely (they'd
// all collapse into one bogus "anonymous" entry otherwise). Always
// returns exactly 10 rows - if fewer than 10 real users have any
// history yet, the remaining places are padded with an empty handle
// and zeroed stats, which .web.leaderboard's caller (web/services.py)
// renders as dashes.
//====================================================================

.web.listLeaderboard:{[]
    hist:select from .quiz.history where not user=`;
    byUser:select score:sum result, solved:count distinct question where result, total:count i by user from hist;
    byUser:update accuracy:100f*score%total from byUser;
    t:`score xdesc 0!byUser;
    t:$[10<count t; 10#t; t];
    padCount:10-count t;
    padded:$[padCount>0;
        t,([] user:padCount#`; score:padCount#0; solved:padCount#0; total:padCount#0; accuracy:padCount#0f);
        t
     ];
    ranked:update place:1+til count padded from padded;
    select place, handle:user, score, solved, accuracy from ranked
 };


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
    t:raze raze {[kind]
        {[kind;diff]
            names:key value `$".inputs.",string[kind],".",string diff;
            ([] problem:names; area:count[names]#kind; difficulty:count[names]#diff)
         }[kind;] each fundamentalsDifficulties
     } each fundamentalsKinds;
    update status:.web.problemStatus[`Fundamentals;problem] from t
 };


/ Renders one value the way the q console would print it - an aligned
/ grid (header, dashes, rows) for tables/keyed tables via .Q.s, the
/ flat parse-syntax via -3! for everything else (scalars, lists,
/ dicts). \c (console width) is widened for the call and restored
/ after, so a table isn't cut short with ".." the way the default
/ 25x80 would. Used both for the per-problem Input:/Expected Output:
/ text (.web.renderInfoValue below) and for the actual/expected values
/ shown in a judge*'s per-case verdict - callers that need a table on
/ its own lines split this on "\n" themselves; this just returns text.
.web.renderPlainValue:{[v]
    isTable:(98h=type v) or 99h=type v;
    oldC:system "c";
    system "c 50 240";
    text:$[isTable; .Q.s v; -3!v];
    system "c ",(string oldC 0)," ",string oldC 1;
    ssr[text;"\r\n";"\n"]
 };


/ Wraps .web.renderPlainValue's text as "-1 "...";" source lines, one
/ per row, since each entry becomes its own printed line below and
/ web/services.py's regex matches one line at a time.
.web.renderInfoValue:{[label;v]
    isTable:(98h=type v) or 99h=type v;
    text:.web.renderPlainValue v;
    rows:"\n" vs text;
    rows:rows where 0<count each rows;
    / A table's grid gets the label on its own line, else the columns
    / would start indented under "Label: " while the dashes/rows below
    / don't - a plain (non-table) value stays on the same line as its
    / label, matching .web.idiomInfoLines' original one-line style.
    labelled:$[isTable; (enlist label,":"),rows; (enlist label,": ",first rows),1_rows];
    {"    -1 \"",ssr[x;"\"";"\\\""],"\";"} each labelled
 };


/ fundamentals question files use the same ".info:{}" + "-1 "...";"
/ print pattern as hackerRank (parsed the same way by
/ web/services.py), one topic+difficulty file per kind
/ (fundamentals/questions/<kind>/<difficulty>.q) holding many
/ questions - found by scanning for ".<problemName>:{" rather than
/ building the exact namespace, since the auto-generated overloads
/ functions live under .fundamentals.overloads.* while qsql's (a typo
/ in the original scaffold) live under .fundamental.qsql.* - singular.
/ Each question file also prints its own Input:/Expected Output: lines,
/ but builds them at print time via "-3!" on the live input/solution
/ dicts rather than a static string literal, so web/services.py's
/ regex (which expects a line that's nothing but a quoted literal)
/ silently drops them - same issue .web.idiomInfoLines has. Rebuilt
/ here via .web.renderInfoValue instead, so a qsql question whose
/ input/expected is a table renders as an actual grid rather than
/ -3!'s flat "+`a`b!(...)" functional notation.
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
    rawLines:endOffset#tailLines;
    isDynamic:(rawLines like "*Input: *")|(rawLines like "*Expected Output: *");
    cleanLines:rawLines where not isDynamic;
    / input is the dot-apply argument list (see .web.judgeFundamentals),
    / so a single-arg function's input is a 1-item list - unwrap that
    / common case to "Input:" rather than a needless "Input 1:".
    args:(value `$".inputs.",string[kind],".",string difficulty) problemName;
    expected:(value `$".solutions.",string[kind],".",string difficulty) problemName;
    n:count args;
    inputLines:raze {[n;i;a] .web.renderInfoValue[$[n=1;"Input";"Input ",string i+1];a]}[n]'[til n;args];
    expectedLines:.web.renderInfoValue["Expected Output";expected];
    cleanLines,inputLines,expectedLines
 };


.web.judgeFundamentals:{[problemName;codeStr]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    .web.saveCode[`Fundamentals;problemName;codeStr];
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
    insert[`.quiz.history; (problemName;actualN;expectedN;pass;`Fundamentals;.web.currentUser)];
    / actualN/expectedN (above) are the -3!-based canonical forms used
    / for the pass/fail check and for what's stored in history - the
    / verdict shown in the console uses .web.renderPlainValue instead,
    / so a table comes back as an actual grid rather than that flat
    / "+`a`b!(...)" notation.
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;kind;difficulty;pass;enlist 1;enlist pass;
            enlist .web.renderPlainValue actual;
            enlist .web.renderPlainValue expected)
 };


/ Run only - raw eval, see .web.runRaw above for why.
.web.runFundamentals:.web.runRaw;


//====================================================================
//
// Assessments - a 10-question mixed quiz (8 multiple choice from the
// chosen difficulty + 2 questions from a randomly picked coding
// section each), generated fresh every time one is started. The
// difficulty only governs the multiple-choice portion - qIdioms,
// AquaQ Challenges and HackerRank Problems have no medium/hard content
// today, so the 2 coding picks are drawn from each section's full
// catalog (across all its difficulties) rather than being restricted
// to match. Coding questions are graded by handing straight off to
// that section's own judge* function above, so a coding question
// inside an assessment is recorded exactly like a normal submission
// on that section's own page would be; MC answers are recorded into
// .quiz.history the same shape .web.submitAnswer uses. State is
// global/single-session, same pattern as .quiz.current / .quiz.history
// elsewhere in this app - starting a new assessment always replaces
// whatever assessment (if any) was previously in progress.
//====================================================================

.assessment.codingTypes:`Idioms`Fundamentals`DiChallenge`HackerRank`Leetcode`QuantRank;

.assessment.state:([] kind:`symbol$(); questionType:`symbol$(); problem:`symbol$());
.assessment.difficulty:`;
.assessment.idx:0;
.assessment.passed:`boolean$();

/ One row per completed assessment run, so the Results dashboard can
/ show assessment history separately from the individual question
/ attempts already recorded into .quiz.history by
/ .assessment.gradeMc/.assessment.gradeCoding - those two make each
/ question count toward the normal per-type accuracy/completion
/ stats, this table is what lets "Easy Assessment - 7/10" show up as
/ its own event instead of just blending into the general history.
/ runId is an explicit counter (not just .z.p) so a per-run detail
/ lookup has a stable key even if two runs somehow finish in the same
/ nanosecond.
.assessment.nextRunId:0;
.assessment.completedRuns:([] runId:`long$(); difficulty:`symbol$(); correct:`long$(); total:`long$(); ts:`timestamp$(); user:`symbol$());

/ Per-question breakdown backing each completedRuns row - one row per
/ question in that run, so clicking a run in the Results dashboard can
/ show exactly which questions were answered correctly/incorrectly.
.assessment.completedDetails:([] runId:`long$(); questionNo:`long$(); kind:`symbol$(); questionType:`symbol$(); problem:`symbol$(); correct:`boolean$());

/ The three difficulty-split MC banks merged back into one dict, keyed
/ by question name - built fresh each call (cheap) rather than reusing
/ the live .quiz.bank pointer, which .web.setQuizMode can have swapped
/ to .quiz.bankSyntax if a Syntax quiz was started more recently.
.assessment.mcBank:{[] .quiz.bankEasy,.quiz.bankMedium,.quiz.bankHard};

/ One random problem name for a coding questionType, drawn from that
/ section's full catalog (see file header above for why difficulty
/ isn't applied here).
.assessment.randomCoding:{[qtype]
    names:$[
        qtype=`Idioms; exec problem from .web.listIdioms[];
        qtype=`Fundamentals; exec problem from .web.listFundamentals[];
        qtype=`DiChallenge; exec problem from .web.listDiChallenges[];
        qtype=`HackerRank; exec problem from .web.listProblems[];
        qtype=`Leetcode; exec problem from .web.listLeetcode[];
        qtype=`QuantRank; exec problem from .web.listQuantRank[];
        '"Unknown coding type"
    ];
    first 1?names
 };

.assessment.finishedPayload:{[]
    `finished`total`correct!(1b;count .assessment.passed;sum .assessment.passed)
 };

/ Called exactly once, right when .web.assessment.submit's increment
/ pushes idx to the end of state - not from .web.assessment.current,
/ which is also called on every in-progress question and would
/ otherwise insert a duplicate row every time the page re-fetches
/ "where am I" after the run is already done.
.assessment.recordCompletion:{[]
    runId:.assessment.nextRunId;
    .assessment.nextRunId+:1;
    insert[`.assessment.completedRuns; (runId;.assessment.difficulty;sum .assessment.passed;count .assessment.passed;.z.p;.web.currentUser)];
    n:count .assessment.passed;
    insert[`.assessment.completedDetails;
        (n#runId;1+til n;.assessment.state`kind;.assessment.state`questionType;.assessment.state`problem;.assessment.passed)];
 };

/ Build a fresh 10-question sequence and hand back question 1 (via
/ .web.assessment.current, so the payload shape is identical either
/ way). 8 distinct MC questions (dealt, so no repeats) + 2 coding
/ picks (rolled, so the same section can come up twice, each still an
/ independently random problem within it).
.web.assessment.start:{[difficulty]
    difficulty:$[-11h=type difficulty; difficulty; `$difficulty];
    mcBank:$[
        difficulty=`easy; .quiz.bankEasy;
        difficulty=`medium; .quiz.bankMedium;
        difficulty=`hard; .quiz.bankHard;
        '"Unknown difficulty"
    ];
    mcNames:neg[8]?key mcBank;
    codingKinds:2?.assessment.codingTypes;
    codingProblems:.assessment.randomCoding each codingKinds;
    .assessment.state:([]
        kind:(8#`mc),2#`coding;
        questionType:(8#`MultipleChoice),codingKinds;
        problem:mcNames,codingProblems
    );
    .assessment.difficulty:difficulty;
    .assessment.idx:0;
    .assessment.passed:`boolean$();
    .web.assessment.current[]
 };

/ Describe the current question without advancing anything, so a page
/ reload mid-assessment can re-fetch where you are. MC questions carry
/ their text/answers inline (no separate info call needed, unlike the
/ coding sections which already have their own /info endpoints the
/ client reuses directly).
/ A bare [...] statement block isn't valid as a $[] branch value in q
/ (that syntax is only legal as the body of if/do/while or a function),
/ so the mc-only "add question/answers" step has to be its own lambda.
.assessment.withMcPayload:{[base;problem]
    q:.assessment.mcBank[] problem;
    base,`question`answers!(q`question;.web.safeAnswers q`answers)
 };

.web.assessment.current:{[]
    if[0=count .assessment.state; :.assessment.finishedPayload[]];
    if[.assessment.idx>=count .assessment.state; :.assessment.finishedPayload[]];
    row:.assessment.state .assessment.idx;
    base:`finished`index`total`difficulty`kind`questionType`problem!
        (0b;1+.assessment.idx;count .assessment.state;.assessment.difficulty;row`kind;row`questionType;row`problem);
    $[(row`kind)=`mc; .assessment.withMcPayload[base;row`problem]; base]
 };

.assessment.gradeMc:{[name;choice]
    choice:$[-11h=type choice; choice; `$choice];
    if[not choice in `a`b`c`d; '"Answer must be one of a, b, c or d"];
    correct:(.assessment.mcBank[] name)`correct;
    isCorrect:choice=correct;
    insert[`.quiz.history; (name;choice;correct;isCorrect;`MultipleChoice;.web.currentUser)];
    isCorrect
 };

.assessment.gradeCoding:{[qtype;problem;codeStr]
    result:$[
        qtype=`Idioms; .web.judgeIdiom[problem;codeStr];
        qtype=`Fundamentals; .web.judgeFundamentals[problem;codeStr];
        qtype=`DiChallenge; .web.judgeDiChallenge[problem;codeStr];
        qtype=`HackerRank; .web.judge[problem;codeStr];
        qtype=`Leetcode; .web.judgeLeetcode[problem;codeStr];
        qtype=`QuantRank; .web.judgeQuantRank[problem;codeStr];
        '"Unknown coding type"
    ];
    result`pass
 };

/ Grade whatever's currently active (an MC choice symbol or a coding
/ submission's code string), record it, advance to the next question
/ and hand back its payload - or the finished summary once question 10
/ has been graded.
.web.assessment.submit:{[answer]
    if[0=count .assessment.state; '"No assessment in progress"];
    if[.assessment.idx>=count .assessment.state; '"Assessment already finished"];
    row:.assessment.state .assessment.idx;
    pass:$[(row`kind)=`mc; .assessment.gradeMc[row`problem;answer]; .assessment.gradeCoding[row`questionType;row`problem;answer]];
    .assessment.passed,:pass;
    .assessment.idx+:1;
    if[.assessment.idx>=count .assessment.state; .assessment.recordCompletion[]];
    .web.assessment.current[]
 };

/ Most-recent-first, for the Results dashboard's assessment history -
/ scoped to whoever's signed in, same reasoning as .web.results above;
/ empty when nobody's signed in.
.web.assessmentHistory:{[]
    `ts xdesc $[null .web.currentUser; 0#.assessment.completedRuns; select from .assessment.completedRuns where user=.web.currentUser]
 };

/ Per-question breakdown for one completed run, in question order -
/ what the Results dashboard shows when a history row is clicked.
/ runId is cast rather than type-checked since it can arrive as any
/ IPC integer width depending on the client. Only returns rows for a
/ run owned by the current user, so a signed-in visitor can't page
/ through another user's run details by guessing/iterating runId even
/ though .web.assessmentHistory no longer lists them.
.web.assessmentDetail:{[runId]
    rid:`long$runId;
    ownRun:$[null .web.currentUser; 0b; 0<count select from .assessment.completedRuns where runId=rid, user=.web.currentUser];
    if[not ownRun; :0#select questionNo,kind,questionType,problem,correct from .assessment.completedDetails];
    `questionNo xasc select questionNo,kind,questionType,problem,correct from .assessment.completedDetails where runId=rid
 };


//====================================================================
//
// Test Cases - CPU time / space benchmarking for the six coding
// sections' own reference solutions (not user submissions), run
// against a few auto-scaled copies of the problem's base input so
// growth in time/space is visible - an empirical stand-in for Big-O
// since q has no static complexity analysis. Only 4 of the 6 sections
// have a reference SOLVING function stored anywhere in the workspace
// (HackerRank, leetcode, AquaQ Challenges and quantRank each define
// one as a bare global inside their question file); qIdioms and
// Fundamentals only ever stored precomputed expected *values* (see
// eg qIdioms/questions/arithmetic.q - .qidiom.arithmetic.sumAVector
// is a no-arg print function, not a solver), so those two sections
// report unavailable rather than fabricating a benchmark.
//
// The four working sections don't reliably name that function after
// the problem itself (eg leetcode's palindromeNumber problem defines
// isPalindromeNumber; quantRank's game7 defines probGame7; AquaQ's
// challenge0 defines decodeMessage after several private helpers) -
// so the function is found the same way a human would: every question
// file's "Solution Info" comment block includes a usage-example line
// like "/ twoSum[2 7 11 15; 9]" or "/* *probGame7[p]*" naming the
// actual entry point before its "[". .web.testCases.extractFuncName
// parses that line instead of assuming problemName is the function.
//====================================================================

.web.testCases.scaleFactors:1 10 100;

.web.testCases.notAvailable:{[reason] `available`reason`rows!(0b;reason;())};

/ Parse one comment line for a leading identifier and whether it's
/ followed (ignoring any immediately-following spaces) by ":" or "="
/ (an input-variable assignment, eg "milkByDay:1 5!1000 1000f" or
/ "grid = (3 4 5 1 3; ...)") or something else ("[", a space then a
/ value, end of line - an actual call, eg "solve[milkByDay;cerealByDay]"
/ or "isPalindromeNumber 121"). Left-trims the "/","*"," "
/ comment/markup characters off the front first; identifiers never
/ contain them.
.web.testCases.parseUsageLine:{[raw]
    leadIdx:first where not raw in "/* ";
    if[null leadIdx; :`ok`name!(0b;`)];
    content:leadIdx _ raw;
    identChars:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    isIdent:content in identChars;
    endIdx:first where not isIdent;
    name:$[null endIdx; content; endIdx#content];
    if[0=count name; :`ok`name!(0b;`)];
    rest:$[null endIdx; ""; endIdx _ content];
    nonSpaceIdx:first where not rest=" ";
    nextMeaningfulChar:$[null nonSpaceIdx; " "; rest nonSpaceIdx];
    `ok`name!((not nextMeaningfulChar in ":=");`$name)
 };

/ Scan lines (as returned by read0) for the "Solution Info" marker,
/ then read the function name off the first usage-example comment
/ line that looks like an actual call rather than an input-variable
/ setup line, searching the whole comment block that follows (up to
/ the first non-comment/non-blank line, ie where real code starts) -
/ AquaQ's more elaborate examples define a few input variables first
/ across several lines before the real call turns up further down
/ (see eg diChallenges/questions/stateMgmt/challenge8.q). Not every
/ section calls its function with bracket syntax either (monadic
/ calls are often bare "name arg"), and some bracketed calls have a
/ "[" inside a *string argument* before the real call
/ ("isValid "()[]{}""), which is why this parses each candidate line
/ properly (see .web.testCases.parseUsageLine) instead of just
/ hunting for the first "[" anywhere in the block.
.web.testCases.extractFuncName:{[lines]
    startIdx:first where lines like "*Solution Info*";
    if[null startIdx; :`];
    tail:(startIdx+1) _ lines;
    isCommentOrBlank:{(x like "/*") or 0=count x where not x=" "} each tail;
    endIdx:first where not isCommentOrBlank;
    scanLines:$[null endIdx; tail; endIdx#tail];
    nonBlank:scanLines where {0<count x where not x=" "} each scanLines;
    if[0=count nonBlank; :`];
    parsed:.web.testCases.parseUsageLine each nonBlank;
    validNames:(parsed where parsed[;`ok])[;`name];
    validNames:validNames where not validNames=`;
    $[0=count validNames; `; first validNames]
 };

/ Unlike the other three sections below, HackerRank problem files use
/ an .info:{} function for their question text rather than a "/
/ Question Info" ... "/ Solution Info" comment block, so there's no
/ marker to scan for here - but its solution function is reliably
/ named exactly after the problem (confirmed across the full easy
/ catalog), so the problem name itself is the function name.
.web.testCases.hackerRankFuncName:{[problemName] problemName };

.web.testCases.leetcodeFuncName:{[problemName;difficulty]
    files:key `$":leetcode/questions/",string[difficulty],"/";
    match:first files where files like "*-",string[problemName],".q";
    path:`$":leetcode/questions/",string[difficulty],"/",string match;
    .web.testCases.extractFuncName read0 path
 };

.web.testCases.diChallengeFuncName:{[problemName;kind]
    path:`$":diChallenges/questions/",string[kind],"/",string[problemName],".q";
    .web.testCases.extractFuncName read0 path
 };

/ No comment-scanning needed here (unlike the funcName helpers above) -
/ every euler problem's solve function is deterministically named
/ ".<problemName>.solve" by euler/scripts/init.q's namespaced load, so
/ the qualified name can just be built directly.
.web.testCases.eulerFuncName:{[problemName] `$".",string[problemName],".solve" };

/ Every Advent of Code problem's function is named exactly after the
/ problem itself (day01, day02, ...), same reasoning as
/ .web.testCases.hackerRankFuncName.
.web.testCases.adventOfCodeFuncName:{[problemName] problemName };

.web.testCases.quantRankFuncName:{[problemName]
    path:.web.quantRankQuestionPath problemName;
    .web.testCases.extractFuncName read0 path
 };

/ How "big" a (possibly nested/multi-arg) input is - sums vector
/ lengths recursively, counting atoms/dicts/tables as 1 each. Purely
/ informational (shown alongside each timed row), not used for scaling
/ itself.
.web.testCases.inputSize:{[x]
    $[
        0h=type x; sum .web.testCases.inputSize each x;
        (type x) within 1 19h; count x;
        1
    ]
 };

/ Generic, not problem-aware, best-effort input scaler: any vector
/ found (at any depth) gets repeated end-to-end to roughly `factor`
/ times its original length; atoms, dicts, tables and empty lists pass
/ through unchanged. This can't preserve every problem's domain
/ invariants (eg appleAndOrange needs its apples/oranges arrays the
/ same length as each other, which this happens to keep, but plenty
/ of other problems have constraints this has no way to know about) -
/ a scaled run that errors is reported as such rather than aborting
/ the other tiers, see .web.testCases.runOne.
.web.testCases.scaleInput:{[factor;x]
    $[
        factor=1; x;
        0h=type x; .web.testCases.scaleInput[factor;] each x;
        ((type x) within 1 19h) and 0<count x; raze factor#enlist x;
        x
    ]
 };

/ Time + space one call, the same two numbers a console \ts reports,
/ computed programmatically: wall-clock delta around the call, and the
/ change in q's own memory usage (.Q.w[]`used) - \ts's space figure is
/ this same delta under the hood. .Q.gc[] first so unrelated garbage
/ from earlier runs doesn't inflate the space reading. Errors (very
/ possible given how blunt scaleInput is) are caught and flagged
/ rather than left to blow up the whole test-case run; the error
/ handler writes to a fully-qualified global instead of a local var
/ since q lambdas don't close over an enclosing function's locals the
/ way eg JS does, so a plain local flag wouldn't actually get set by
/ the inner handler.
.web.testCases.runOne:{[func;input]
    .Q.gc[];
    startBytes:.Q.w[]`used;
    .web.testCases.errFlag:0b;
    st:.z.p;
    actual:.[func;input;{.web.testCases.errFlag:1b; x}];
    et:.z.p;
    endBytes:.Q.w[]`used;
    `timeMs`spaceBytes`errored`message!
        ((`long$et-st)%1000000; endBytes-startBytes; .web.testCases.errFlag; $[.web.testCases.errFlag; actual; ""])
 };

.web.testCases.run:{[func;baseInput]
    results:{[func;baseInput;factor]
        scaled:.web.testCases.scaleInput[factor;baseInput];
        r:.web.testCases.runOne[func;scaled];
        `scale`inputSize`timeMs`spaceBytes`errored`message!
            (factor;.web.testCases.inputSize scaled;r`timeMs;r`spaceBytes;r`errored;r`message)
     }[func;baseInput;] each .web.testCases.scaleFactors;
    ([] scale:results[;`scale]; inputSize:results[;`inputSize]; timeMs:results[;`timeMs];
        spaceBytes:results[;`spaceBytes]; errored:results[;`errored]; message:results[;`message])
 };

.web.testCases.forProblem:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    category:confirmCategory problemName;
    if[null category; '"Unknown problem"];
    funcName:.web.testCases.hackerRankFuncName problemName;
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:(value category) problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forDiChallenge:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    kind:confirmDiChallengeKind problemName;
    if[null kind; '"Unknown problem"];
    funcName:.web.testCases.diChallengeFuncName[problemName;kind];
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:.inputs.diChallenges.easy problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forEuler:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.euler.easy; '"Unknown problem"];
    funcName:.web.testCases.eulerFuncName problemName;
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:.inputs.euler.easy problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forAdventOfCode:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    if[not problemName in key .inputs.adventOfCode.easy; '"Unknown problem"];
    funcName:.web.testCases.adventOfCodeFuncName problemName;
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:.inputs.adventOfCode.easy problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forLeetcode:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    difficulty:confirmLeetcodeDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    funcName:.web.testCases.leetcodeFuncName[problemName;difficulty];
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:(value .leet.input.dict difficulty) problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forIdiom:{[problemSlug]
    .web.testCases.notAvailable["qIdioms stores each idiom's expected output as precomputed data, not a callable solving function - there's nothing to benchmark here."]
 };

.web.testCases.forQuantRank:{[problemName]
    problemName:$[-11h=type problemName; problemName; `$problemName];
    difficulty:confirmQuantRankDifficulty problemName;
    if[null difficulty; '"Unknown problem"];
    funcName:.web.testCases.quantRankFuncName problemName;
    func:@[value; funcName; {(::)}];
    if[100h<>type func; :.web.testCases.notAvailable["No reference function could be located for this problem"]];
    input:(value `$".inputs.quant.probability.",string difficulty) problemName;
    `available`reason`rows!(1b;"";.web.testCases.run[func;input])
 };

.web.testCases.forFundamentals:{[problemName]
    .web.testCases.notAvailable["Fundamentals stores each question's expected output as precomputed data, not a callable solving function - there's nothing to benchmark here."]
 };


//====================================================================
//
// Profile — a single local profile (no login), stored in q and
// persisted to ./profile/ so it survives a server restart. Guarded so
// re-loading this script (once per new web/qclient.py connection)
// doesn't clobber an already-initialised in-memory profile.
//
//====================================================================

.profile.defaultInfo:`name`tagline`email`phone`location`resumeFilename`photoFilename`leaderboardHandle!("";"";"";"";"";"";"";"");

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

/ Distinct from .profile.info's name field - this is what the
/ Google sign-in flow (web/app.py's api_auth_google) prefers over the
/ Google account's own display name when set, so the leaderboard shows
/ whatever name the profile owner has chosen rather than whatever
/ Google happens to call them.
.web.profile.setLeaderboardHandle:{[handle]
    .profile.info[`leaderboardHandle]:handle;
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
