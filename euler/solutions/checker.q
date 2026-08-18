//====================================================================
// euler — checker
//
// Euler problems are flat (no listOps/maths/... kind split the way
// diChallenges has), so this is simpler than
// diChallenges/solutions/checker.q - one results table, and a plain
// problem-name -> qualified-solve-function-symbol dict. Used to
// (re)compute expected answers, not at judge time: .web.judgeEuler
// grades against the precomputed literal values in
// euler/solutions/euler.q, same as every other section.
//====================================================================

resultsEuler: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$());

.euler.ref.dict: (!) . flip raze 2 cut
    (
        (`problem0001; `.problem0001.solve);
        (`problem0002; `.problem0002.solve);
        (`problem0003; `.problem0003.solve);
        (`problem0004; `.problem0004.solve);
        (`problem0005; `.problem0005.solve);
        (`problem0006; `.problem0006.solve);
        (`problem0007; `.problem0007.solve);
        (`problem0008; `.problem0008.solve)
    );
