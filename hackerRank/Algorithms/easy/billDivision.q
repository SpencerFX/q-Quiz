.quiz.hackerRank.algorithms.billDivision.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Bill Division (Bon Appetit)";
    -1 "";
    -1 "Anna and Brian are sharing a meal at a restaurant.";
    -1 "";
    -1 "- The bill is represented as an array of integers, where each value";
    -1 "  corresponds to the cost of an item";
    -1 "- Anna does not eat the item at index k";
    -1 "";
    -1 "Brian calculates the total cost and splits the bill equally between them.";
    -1 "";
    -1 "Task:";
    -1 "- Determine whether Brian charged Anna correctly";
    -1 "- If he did, print \"Bon Appetit\"";
    -1 "- Otherwise, print the amount Brian owes Anna";
    -1 "";
    -1 "Example:";
    -1 "bill = 3 10 2 9";
    -1 "k = 1";
    -1 "b = 12";
    -1 "";
    -1 "Anna did not eat the item at index 1:";
    -1 "Excluded item = 10";
    -1 "";
    -1 "Remaining bill:";
    -1 "3 + 2 + 9 = 14";
    -1 "";
    -1 "Anna's fair share:";
    -1 "14 % 2 = 7";
    -1 "";
    -1 "Brian charged:";
    -1 "12";
    -1 "";
    -1 "Overcharged:";
    -1 "12 - 7 = 5";
    -1 "";
    -1 "Result:";
    -1 "5";
    -1 "";
    -1 "Function Description:";
    -1 "bonAppetit takes:";
    -1 "  - bill: array of integers (item costs)";
    -1 "  - k: integer (index of item Anna didn't eat)";
    -1 "  - b: integer (amount Brian charged Anna)";
    -1 "";
    -1 "Returns:";
    -1 "  - None (prints the result)";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: two integers n and k";
    -1 "    n = number of items";
    -1 "    k = index of the item Anna didn't eat";
    -1 "- Second line: n space-separated integers (bill)";
    -1 "- Third line: integer b (amount Brian charged Anna)";
    -1 "";
    -1 "Output Format:";
    -1 "- Print \"Bon Appetit\" if Brian charged correctly";
    -1 "- Otherwise print the amount Anna was overcharged";
    -1 "";
    -1 "Constraints:";
    -1 "- 2 <= n <= 10^5";
    -1 "- 0 <= k < n";
    -1 "- 0 <= bill[i] <= 10^4";
    -1 "- 0 <= b <= sum(bill)";
    -1 "";
    -1 "Notes:";
    -1 "- Compute the total excluding the item Anna didn't eat:";
    -1 "    total = sum bill - bill[k]";
    -1 "- Compute Anna's fair share:";
    -1 "    share = total % 2";
    -1 "- Compare:";
    -1 "    if b == share";
    -1 "        print \"Bon Appetit\"";
    -1 "    else";
    -1 "        print b - share";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly exclude the item Anna did not eat";
    -1 "- Compute the fair split";
    -1 "- Determine whether Brian charged Anna fairly";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "bill:3 10 2 9;";
    -1 "k:1;";
    -1 "b:12;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ billDivision[input; 1; 12]

billDivision:{[bill;k;b]
  annaShare:(sum bill) - bill[k];
  annaShare:annaShare % 2;

  $[annaShare = b;
    "Bon Appetit";
    string b - annaShare
  ]
 };
/ =============================================================


/ Solution Info (alternate) ====================================
/ Excludes Anna's item via a boolean mask instead of index
/ subtraction, and uses integer div instead of float divide.
/ billDivision2[bill;k;b]
billDivision2:{[bill;k;b]
  mask:(til count bill)<>k;
  annaShare:(sum bill where mask) div 2;
  $[annaShare=b; "Bon Appetit"; string b-annaShare]
 };
/ =============================================================