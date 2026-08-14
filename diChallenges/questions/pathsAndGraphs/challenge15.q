/ Question Info ===============================================
/ Word Ladder Product

/ As a child, nothing is more difficult and mysterious than the
/ game which apparently has no name, but goes like this:

/ You have a starting word, and an ending word - changing one
/ letter at a time and always maintaining a real word, make a
/ chain of words from the start to the end. For example:
/ fly
/ ...
/ try

/ Results in
/ fly
/ fry
/ try

/ This results in a chain three words long, including the
/ starting and ending words.

/ Using the word list here as a list of valid words, find the
/ shortest full chain of each word pair in the input. The
/ answer is the product of the lengths of each chain - so if
/ the input was
/ fly,try
/ try,fly
/ word,maze

/ The lengths of each chain would be 3 3 5, and the product of
/ these would be the answer: 45.

/ Task:
/ - For each (start;end) word pair, find the length of the
/   shortest chain from start to end where every step changes
/   exactly one letter and every word in the chain (including
/   start and end) is in the given word list
/ - Multiply all the chain lengths together

/ Example:
/ words = "fly" "fry" "try" "cry" "word" "ward" "ware" "mare"
/ "maze" (a word list containing at least the words needed for
/ the chains below)
/ pairs = (fly,try) (try,fly) (word,maze)

/ productOfChains[words;pairs]

/ fly->fry->try (length 3), try->fry->fly (length 3),
/ word->ward->ware->mare->maze (length 5)

/ Result:
/ 45

/ Function Description:
/ productOfChains takes:
/   - words: list of valid words
/   - pairs: list of (start;end) word pairs

/ Returns:
/   - product of the shortest chain length (word count,
/     inclusive of both endpoints) for every pair

/ Input Format:
/ - The valid word list
/ - One start,end pair per line

/ Constraints:
/ - start and end are always the same length
/ - a valid chain always exists for every pair in the input

/ Notes:
/ - Only single-letter substitutions count as a step - no
/   inserting, deleting, or reordering letters
/ - Every intermediate word in the chain must also be a member
/   of the word list, same as start and end
/ - A pair where start equals end has a chain length of 1

/ Goal:
/ - Find the SHORTEST chain (breadth-first, not just any valid
/   chain) for each pair
/ =============================================================


/ Solution Info ===============================================
/ words:("fly";"fry";"try";"cry";"word";"ward";"ware";"mare";"maze")
/ pairs:(("fly";"try");("try";"fly");("word";"maze"))
/ productOfChains[words;pairs]

chainLength:{[words;start;end]
  if[start~end; :1];
  sameLen:distinct words,(enlist start),enlist end;
  sameLen:sameLen where (count each sameLen)=count start;
  visited:enlist start;
  frontier:enlist start;
  dist:1;
  result:0N;
  while[(null result) and 0<count frontier;
    nbrs:distinct raze {[w;sameLen] sameLen where 1={[w;x] sum w<>x}[w] each sameLen}[;sameLen] each frontier;
    nbrs:nbrs where not nbrs in visited;
    $[0=count nbrs;
      [visited,:nbrs; frontier:nbrs; dist+:1];
      $[end in nbrs;
        result:dist+1;
        [visited,:nbrs; frontier:nbrs; dist+:1]
       ]
     ]
   ];
  result
 };

productOfChains:{[words;pairs] prd {[words;x] chainLength[words;x 0;x 1]}[words;] each pairs }
/ =============================================================
