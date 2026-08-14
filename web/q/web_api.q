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
