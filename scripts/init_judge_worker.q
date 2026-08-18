//=============================================================
// scripts/init_judge_worker.q
//
// Judge-worker boot (see docker/judge-worker.Dockerfile and
// k8s/judge-worker/): loads ONLY the grading infrastructure for the 8
// coding sections - no .quiz.history/live state, no MC quiz banks, no
// jobs/leaderboard/profile data. This is the one new q file this
// sketch needed - everything else in the Kubernetes/Docker piece is
// Python or config, per your steer on the autosave/supervisor work.
//
// web/q/web_api.q still loads in full for its .web.judgeX functions -
// the MC-quiz/assessment/profile/jobs functions it also defines are
// simply never called here (q doesn't evaluate a function body's
// dependencies until the function is actually invoked, so their
// absence is harmless as long as nothing calls them).
//
// .quiz.history/.web.currentUser are stubbed (not loaded from
// scripts/init.q, which pulls in everything else too) purely so the
// existing .web.judgeX functions' own insert[`.quiz.history;...] call
// has something to write into without erroring - that insert is
// thrown away here. Recording a real result into q-core's actual
// .quiz.history is a separate call the web tier still needs to make;
// that wiring isn't part of this sketch (see k8s/README.md).
//=============================================================
.quiz.history:([]
    question:`symbol$();
    input:`symbol$();
    correct:`symbol$();
    result:`boolean$();
    questionType:`symbol$();
    user:`symbol$()
 );
.web.currentUser:`;

.judgeWorker.init:{
    -1 "";
    -1 "======================================";
    -1 " Initialising q-Quiz judge-worker";
    -1 "======================================";

    system "l ./hackerRank/scripts/init.q";
    system "l ./qIdioms/scripts/init.q";
    system "l ./diChallenges/scripts/init.q";
    system "l ./leetcode/scripts/init.q";
    system "l ./quantRank/scripts/init.q";
    system "l ./fundamentals/scripts/init.q";
    system "l ./euler/scripts/init.q";
    system "l ./adventOfCode/scripts/init.q";

    initHackerRank[];
    initQIdioms[];
    initDiChallenges[];
    initLeetcode[];
    initQuantRank[];
    initFundamentals[];
    initEuler[];
    initAdventOfCode[];

    system "l ./web/q/web_api.q";

    -1 "Judge-worker ready.";
 };

.judgeWorker.init[];
