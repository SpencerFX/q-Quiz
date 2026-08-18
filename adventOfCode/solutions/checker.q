//====================================================================
// adventOfCode — checker
//
// Flat, single-tier catalog (no easy/medium/hard split, no kind
// sub-folders) - one results table, and a plain problem-name ->
// solve-function-symbol dict. Used to (re)compute expected answers,
// not at judge time: .web.judgeAdventOfCode grades against the
// precomputed literal values in adventOfCode/solutions/adventOfCode.q,
// same as every other section.
//====================================================================

resultsAdventOfCode: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$());

.aoc.ref.dict: (!) . flip raze 2 cut
    (
        (`day01; `day01);
        (`day02; `day02);
        (`day03; `day03);
        (`day04; `day04);
        (`day05; `day05);
        (`day06; `day06);
        (`day07; `day07);
        (`day08; `day08)
    );
