/ Table to store results in memory
resultsHackerRank: ([] problem:`symbol$(); pass:`boolean$(); actual:(); expected:(); startTime:`timestamp$(); endTime:`timestamp$(); category:`$(); difficulty:`$());

/ Normalise a value the same way regardless of whether it came from a
/ submission or a reference solution, so equality is well-defined.
/ Always returns a symbol atom: count-1 values (eg a single-digit answer
/ like "5") take the `$string x branch, but string on a length-1 vector
/ comes back nested, so `$ over it yields a length-1 symbol *list* rather
/ than an atom - unwrap that so every case's result has a uniform shape
/ (the original single-case checker masked this same quirk with min min).
/ Genuinely nested results (eg 3Sum's list of triplets) are type 0h and
/ used to blow up inside "sv" below - string on a nested list doesn't
/ come back as a flat list of strings, so sv had nothing valid to join.
/ Recursing per-element first (each sublist normalises down to its own
/ flat string) before joining fixes that without touching the atom/flat
/ vector path at all, which is the only path every other section's
/ problems have ever exercised.
.checker.normaliseStr:{[x]
    $[0h=type x; " " sv .checker.normaliseStr each x; $[1<count x; " " sv string x; string x]]
 };

.checker.normalise:{[x]
    y:`$(.checker.normaliseStr x);
    $[-11h=type y; y; first y]
 };

/ Run a problem's base case plus any extra cases from .inputs.extraCases /
/ .solutions.extraCases against a candidate function, without printing or
/ recording anything. A submission only passes if every case passes.
/ Shared by the console checker and the web judge (web/q/web_api.q) so
/ both grade the same way.
.checker.grade:{[problemName;func]
    category:confirmCategory problemName;
    if[null category; '"Unknown problem"];
    difficulty:`$("." vs string category)3;
    area:`$("." vs string category)2;
    solCategory:.checker.ref.dict category;
    baseInput:(value category) problemName;
    baseExpected:(value solCategory) problemName;
    extraInputs:$[(category in key .inputs.extraCases) and problemName in key .inputs.extraCases category;
        .inputs.extraCases[category][problemName];
        ()
    ];
    extraExpected:$[(solCategory in key .solutions.extraCases) and problemName in key .solutions.extraCases solCategory;
        .solutions.extraCases[solCategory][problemName];
        ()
    ];
    inputCases:enlist[baseInput],extraInputs;
    expectedCases:enlist[baseExpected],extraExpected;
    actuals:{[f;i] .[f;i;{"Error with ",x}]}[func] each inputCases;
    caseActual:.checker.normalise each actuals;
    caseExpected:.checker.normalise each expectedCases;
    casePass:caseActual=caseExpected;
    `problem`area`difficulty`pass`caseNo`casePass`caseActual`caseExpected!
        (problemName;area;difficulty;min casePass;1+til count casePass;casePass;caseActual;caseExpected)
 };

/ Function to check for success
checker:{[problemName; function]
    st:.z.p;
    result:.checker.grade[problemName;function];
    $[result`pass; show"Your solution works!"; show"Please try again."];
    et:.z.p;
    actualSummary:`$" | " sv string each result`caseActual;
    expectedSummary:`$" | " sv string each result`caseExpected;
    insert[`resultsHackerRank; (problemName; result`pass; enlist actualSummary; enlist expectedSummary; st; et; result`area; result`difficulty)];
    insert[`.quiz.history; (problemName; actualSummary; expectedSummary; result`pass; `HackerRank; .web.currentUser)];
 };

.checker.ref.dict: (!) . flip raze 2 cut
    (
        (`.inputs.algorithms.easy; `.solutions.algorithms.easy);
        (`.inputs.algorithms.medium; `.solutions.algorithms.medium);
        (`.inputs.algorithms.hard; `.solutions.algorithms.hard);
        (`.inputs.dataStructures.easy; `.solutions.dataStructures.easy);
        (`.inputs.dataStructures.medium; `.solutions.dataStructures.medium);
        (`.inputs.dataStructures.hard; `.solutions.dataStructures.hard);
        (`.inputs.sql.easy; `.solutions.sql.easy);
        (`.inputs.sql.medium; `.solutions.sql.medium)
    );

confirmCategory:{[problemName]
    mapDict: (key .checker.ref.dict)!{x in key value y}[problemName;]each key .checker.ref.dict;
    inputTopCheck: first where mapDict = 1b
 };

/ Algorithms
/checker[`appleAndOrange; appleAndOrange]
/checker[`aVeryBigSum; aVeryBigSum]
/checker[`betweenTwoSets; betweenTwoSets]
/checker[`billDivision; billDivision]
/checker[`birthdayCakeCandles; birthdayCakeCandles]
/checker[`breakingTheRecords; breakingTheRecords]
/checker[`divisibleSumPairs; divisibleSumPairs]

/ DataStructures
/checker[`arraysDS; arraysDS]
/checker[`compareTriplets; compareTriplets]
/checker[`leftRotation; leftRotation]
/checker[`twoDArrayDS;twoDArrayDS]
/checker[`dynamicArray;dynamicArray]
/checker[`insertNodeAtTheHeadOfALinkedList;insertNodeAtTheHeadOfALinkedList]
/checker[`insertNodeAtTheTailOfALinkedList;insertNodeAtTheTailOfALinkedList]
/checker[`printLinkedList;printLinkedList]
/checker[`insertANodeAtASpecificPositionInALinkedList;insertANodeAtASpecificPositionInALinkedList]
/checker[`deleteANode;deleteANode]
/checker[`printInReverse;printInReverse]
/checker[`reverseALinkedList;reverseALinkedList]
/checker[`compareTwoLinkedLists;compareTwoLinkedLists]
/checker[`getNodeValue;getNodeValue]
/checker[`deleteDuplicateValueNodesFromASortedLinkedList;deleteDuplicateValueNodesFromASortedLinkedList]
/checker[`mergeTwoSortedLinkedLists;mergeTwoSortedLinkedLists]
/checker[`binarySearchTreeInsertion;binarySearchTreeInsertion]
/checker[`treeHeightOfABinaryTree;treeHeightOfABinaryTree]
/checker[`treeInorderTraversal;treeInorderTraversal]
/checker[`treeLevelOrderTraversal;treeLevelOrderTraversal]
/checker[`treePostOrderTraversal;treePostOrderTraversal]
/checker[`treePostOrderTraversal;treePreOrderTraversal]
/checker[`treeTopView;treeTopView]
/checker[`maximumElement;maximumElement]
/checker[`jessieAndCookies;jessieAndCookies]
/checker[`equalStacks;equalStacks]
/checker[`qHeap1;qHeap1]
/results