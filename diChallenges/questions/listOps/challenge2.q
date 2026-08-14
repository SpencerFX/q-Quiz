/ Question Info ===============================================
/ Duplicate Trail Discard

/ You've found a table which is supposed to record only unique
/ values in the order they appeared. Looking closely, you
/ realise that some of the values occur multiple times.
/ Consulting the documentation, you see the original system was
/ designed to only have data appended, so there was no way to
/ correct broken inputs.

/ Instead, a record appearing more than once means that
/ everything between the first instance of that record up to
/ the latest occurrence was incorrect, and should be discarded.
/ Values after this occurrence are treated as if those records
/ in between hadn't existed. What is the sum of the values
/ returned from your input after this process has been applied?

/ Task:
/ - Walk the input, keeping a running "clean" trail
/ - When a value repeats, discard everything in the trail from
/   its first occurrence onwards, then re-append the value
/ - Sum the values left in the trail once the input is exhausted

/ Example:
/ xs = 1 4 3 2 4 7 2 6 3 6

/ f[1 4 3 2 4 7 2 6 3 6]
/ 1 4 7 2 6

/ Result:
/ 20

/ Function Description:
/ sumUniqueTrail takes:
/   - xs: list of integers

/ Returns:
/   - sum of the surviving values after duplicate trails are
/     discarded

/ Input Format:
/ - Single line containing a list of integers

/ Constraints:
/ - 1 ≤ count xs

/ Notes:
/ - A repeated value discards its own earlier trail too - it is
/   re-appended after the truncation, not dropped entirely
/ - Values can repeat more than once; each repeat re-triggers
/   the discard from its most recent surviving occurrence

/ Goal:
/ - Solve with a single pass/fold over the input
/ =============================================================


/ Solution Info ===============================================
/ sumUniqueTrail[1 4 3 2 4 7 2 6 3 6]

pruneRepeats:{[xs]
  step:{[acc;x]
    idx:acc?x;
    acc:$[idx=count acc; acc; idx#acc];
    acc,x
   };
  step/[();xs]
 };

sumUniqueTrail:{[xs] sum pruneRepeats xs }
/ =============================================================
