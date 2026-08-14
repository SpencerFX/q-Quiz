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


/ .quiz.history also holds HackerRank submissions (questionType`HackerRank),
/ so anything counting or numbering multiple-choice progress has to scope
/ to just the MultipleChoice rows, not the whole shared table.
.web.mcHistory:{[] select from .quiz.history where questionType=`MultipleChoice};


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
    insert[`.quiz.history; (.quiz.current;choice;correct;isCorrect;`MultipleChoice)];
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
    raze {[kind]
        names:key value .di.ref.dict kind;
        ([] problem:names; area:count[names]#kind; difficulty:count[names]#`easy)
     } each key .di.ref.dict
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


//====================================================================
//
// Profile — a single local profile (no login), stored in q and
// persisted to ./profile/ so it survives a server restart. Guarded so
// re-loading this script (once per new web/qclient.py connection)
// doesn't clobber an already-initialised in-memory profile.
//
//====================================================================

.profile.defaultInfo:`name`tagline`email`phone`location`resumeFilename!("";"";"";"";"";"");

.profile.init:{[]
    .profile.info:@[get; `:./profile/info; {.profile.defaultInfo}];
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

.web.profile.addExperience:{[company;title;startDate;endDate;location;description]
    id:.profile.nextId[.profile.experience];
    `.profile.experience insert (id;company;title;startDate;endDate;location;description);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeExperience:{[id]
    .profile.experience:delete from .profile.experience where id=id;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addEducation:{[school;degree;startDate;endDate]
    id:.profile.nextId[.profile.education];
    `.profile.education insert (id;school;degree;startDate;endDate);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeEducation:{[id]
    .profile.education:delete from .profile.education where id=id;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addLink:{[label;url]
    id:.profile.nextId[.profile.links];
    `.profile.links insert (id;label;url);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeLink:{[id]
    .profile.links:delete from .profile.links where id=id;
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.addSkill:{[skill]
    id:.profile.nextId[.profile.skills];
    `.profile.skills insert (id;skill);
    .profile.save[];
    .web.profile.get[]
 };

.web.profile.removeSkill:{[id]
    .profile.skills:delete from .profile.skills where id=id;
    .profile.save[];
    .web.profile.get[]
 };
//====================================================================
