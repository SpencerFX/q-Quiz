# qIdioms Verification Report

Consolidated findings from an independent verification pass over all 22 `qIdioms` topics (~510 real idiom entries checked; the `medium`/`hard` tiers in every topic are unfilled placeholder stubs and were skipped).

For each idiom, its one-line description (in `qIdioms/questions/<topic>.q`) was used to independently derive the correct answer, which was then compared against the recorded value in `qIdioms/solutions/<topic>.q` for the corresponding input in `qIdioms/inputs/<topic>.q`.

## Systemic issues (affect many idioms at once)

1. **Space-separated boolean literals don't parse as vectors in q.** Something like `"0 0 1 1 1b"` collapses to a scalar/garbage instead of a 5-element boolean vector — it needs to be written compactly with no spaces (e.g. `10111b`). This corrupted **8 idioms in `flags`**, plus `temporal.isLeapYear`, `tests.quickMembership`, and `text.matrixFromFlaggedParts`'s input. The same bug is also present in two out-of-scope medium entries (`temporal.leapYearVector`, `text.flaggedWordsToMatrix`) — worth a global grep across all input files for space-separated digit runs followed by `b"`.
2. **`partsItems`: 23 of 35 solutions are just unmodified copies of their own input** — not computed answers at all (e.g. `itemsFromFlags`'s "solution" is literally the input pair, unfiltered). This is the single biggest gap found.
3. **`polynomials`: duplicate dict keys.** `polynomialWithRoots` is defined 4 times and `momentOfVector` twice in both inputs and solutions; q dict lookup only keeps the first, so indexed access to examples 2–4 returns empty/garbled data even though the underlying values are all mathematically correct.

## Confirmed value/logic bugs, by topic

- **arithmetic**: `vectorNegative`, `numericArrayNegative` — both pair each value with its negation instead of just negating (wrong shape entirely).
- **castingAndRepresentation**: `numbersFromTextMatrix` — two values swapped/wrong.
- **find**: `itemsNotInList` — wrong composite set (includes items that should be excluded, omits ones that shouldn't).
- **flags**: `flagPositiveIntegers` (computed against sorted input, not original order), `anyFlagsFalse` (implements `any(x)` instead of `any(not x)`), plus the 8 corrupted-literal ones below.
- **format**: `indexingPlottingCharacters` — stored value is an unrelated caption string, not computed output.
- **math**: `fibonacciNumbers` (returns 12 values for n=10), `nodeMatrixFromConnectionMatrix`/`connectionMatrixFromNodeMatrix` (correctly computed but cross-assigned/swapped with each other).
- **matrixes**: `firstColumnAsMatrix` (flattened, loses matrix shape the description asks for), `shurSum`/`shurProduct` (inputs are non-conformable shapes; stored values don't derive from either operand).
- **miscellaneous**: `removeEveryNth` (wrong items removed), `removeEverySecond` (inverted — keeps evens, drops odds), `removeLeadingTrailing` (drops an extra internal zero), `selectWhereZero` (implements a totally different operation than described).
- **polynomials**: `exponentialFitCoefficients` (B coefficient wrong by the log-linear fit method), `evaluateAscendingPolynomial` (coefficients read in descending order, contradicting its own name).
- **rank**: `depth` (stored = unchanged input), `oneRowMatrix`/`oneColumnMatrix` (never actually converted to matrix form), `increaseRankFromVector` (unchanged/wrong).
- **shape**: `emptyVectorBoolean`/`emptyVectorFloat` (extra unwanted enlist wrap), `fillToLength` (repeats last char instead of cycling the vector), `allAxes` (returns axis indices instead of axis sizes).
- **sort**: `sortRowsOnColumn`, `classifyByRank` — inputs use unseeded random generation (`30?100`), so the recorded solution can never be reproduced or verified against a fresh load.
- **statistics**: `weightedAverage` — divides by `sum(v)` instead of `sum(w)`.
- **text**: `insertEmptyRow` — off-by-one (inserts after the target index instead of before).

### flags — full detail (10 problems of 41 idioms)

| idiom | computed | stored | reason |
|---|---|---|---|
| `invertZerosAfterFirstOne` | `0011111b` | corrupted scalar (long atom `0`) | boolean literal written with spaces (`"0 0 1 1 1 1 1b"`) — q parses space-separated digits + trailing `b` as garbage, not a vector; must be compact (`"0011111b"`) |
| `invertOnesAfterFirstOne` | `001000b` | corrupted scalar `0` | same space+`b` literal bug |
| `invertZerosAfterFirstZero` | `101111b` | corrupted scalar `0` | same space+`b` literal bug |
| `invertOnesAfterFirstZero` | `1100000b` | corrupted scalar `1` | same space+`b` literal bug |
| `smearOnesBetweenPairs` | `0111101110110b` | corrupted scalar `0` | same space+`b` literal bug |
| `invertFieldsBetweenPairs` | `010000110b` | corrupted scalar `0` | same space+`b` literal bug |
| `invertAllButFirstInGroup` | `0010001001b` | corrupted scalar `0` | same space+`b` literal bug |
| `firstGroupOfOnes` | `0001100b` | corrupted scalar `0` | same space+`b` literal bug |
| `flagPositiveIntegers` | `1110110b` | `0011111b` | solution was computed against the SORTED input, not original order |
| `anyFlagsFalse` | `1b` | `0b` | description says "any flag is unset" (`any not x`); stored value is plain `any(x)` instead |

All 8 corrupted ones: the digits embedded in the source text are the correct intended values (confirmed by independent computation) — the file's literal syntax is what's broken (q requires `101b`, not `1 0 1b`).

### format — full detail (1 problem of 14 idioms)

`indexingPlottingCharacters` — computed: unclear (should be plot/index chars over 1..1200); stored: `"distribution of primes to 1200"`. The stored value is a caption/title string, not actual computed characters — looks like content copied from elsewhere.

### math — full detail (2 confirmed bugs + 1 swap bug, of 23 idioms)

- `fibonacciNumbers` — computed: `1 1 2 3 5 8 13 21 34 55` (10 values); stored: `0 1 1 2 3 5 8 13 21 34 55 89` (12 values). Input is n=10 ("first n Fibonacci numbers") but stored has 12 elements, not 10.
- `nodeMatrixFromConnectionMatrix` / `connectionMatrixFromNodeMatrix` — swapped pair. Each idiom's input+solution correctly implements the OTHER idiom's name: `nodeMatrixFromConnectionMatrix`'s input is already a node-incidence matrix and its solution is a connection-list (i.e. it computes `connectionMatrixFromNodeMatrix`); `connectionMatrixFromNodeMatrix`'s input is a connection-list and its solution is the node-incidence matrix (i.e. it computes `nodeMatrixFromConnectionMatrix`). Individually each computation is correct, just mislabeled/cross-assigned.

## Verified correct

**geometry** and **indexes** (all idioms), and the large majority across every other topic — **strings** (15/15), **execution** (7/7), **finance** (19/19), most of **arithmetic** (26/28), **tests** (20/21), **text** (18/19), **sort** (19/21 excluding the two unseeded ones), **statistics** (15/16), and most of **rank**/**shape**/**matrixes**/**miscellaneous**/**math**/**polynomials** beyond what's listed above.

## Unresolved — needs human judgment, not clearly a bug

- **`find.itemsOfMatrixInArray`**: many plausible interpretations were tried and none reproduced the stored output. Worth a closer look by whoever wrote it originally.
- **`geometry.greatCircleDistance`**: no formula/axis-order combination (lat/lon order, law-of-cosines vs haversine) reproduced the stored `0.7371511506399156` exactly — not confident enough to flag as wrong.
- **`geometry.contourLevels`**: stored answer is a single scalar (`-100`) despite the description saying "levels" (plural); plausibly should be a full sequence, but not confident enough in the exact intended formula to flag as wrong.

## Ambiguities (not flagged as bugs, human judgment calls)

- **`finance.roundNearestEvenInteger`**: description says "(banker's rounding)" but the stored solution actually implements "round to the literal nearest even integer" (e.g. 0.9→0, 3.1→4), not true round-half-to-even tie-breaking — that correct banker's behavior is what the separate `roundHalfToEven` idiom implements instead. Internally consistent across all 6 test values, so likely an intentional (if confusingly labeled) distinct idiom rather than a bug.
- **`math.maximumSeparation`**: stored value (4) matches "count of elements strictly between first/last occurrence," not raw index difference (5) — both are defensible readings of "separation."
- **`math.rangeUnion`**: stored solution merges touching integer ranges (e.g. 8-10 and 11-12 → 8-12), a defensible integer-adjacency convention; a strict overlap-only merge gives 3 ranges instead of 2.
- **`format.numberOfDecimalsMaximum`** / **`math.quadraticSolution`** / **`math.setUnion`**: only element-order or scalar-type differences on inherently unordered results (sets/roots/decimal-cap) — verified equal in content, not flagged.
- **`tests.rangesMatch`** and **`tests.itemsInCommon`**: descriptions are compatible with either a set-based boolean answer (which the stored `1b` matches) or a full common-items list.
- **`tests.ascendingOrder`**: treats "ascending" as non-decreasing (allows ties), consistent with the stored answer.
- **`matrixes.hilbertMatrix`** and **`polynomials.bestLinearFitCoefficients`/`bestLinearFitPredictedValues`/`exponentialFitPredictedValues`**: match to displayed precision but fail exact tolerant-match — consistent with solutions having been authored from q's default 7-significant-figure console display rather than full-precision values, not a real computational bug.
- **`rank.increaseRankFromVector`**: stored output is just the 2nd argument unchanged, ignoring the array argument entirely and showing no rank increase — the exact intended transform is somewhat ambiguous, but "no change" contradicts the description either way.
- **`miscellaneous.selectXorY`**: depends on an unstated convention for which list flag=1 picks from; stored solution is internally consistent with one reasonable reading.

No missing `(!) .` dict-cast prefix issue was found in `geometry`/`indexes`/`math` input or solution files — all three load as proper dictionaries.
