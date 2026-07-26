/Question Info ===============================================
/
Bill Division (Bon Appétit)

Anna and Brian are sharing a meal at a restaurant.

- The bill is represented as an array of integers, where each value
  corresponds to the cost of an item
- Anna does not eat the item at index k

Brian calculates the total cost and splits the bill equally between them.

Task:
- Determine whether Brian charged Anna correctly
- If he did, print "Bon Appetit"
- Otherwise, print the amount Brian owes Anna (the difference)

Example:
bill = 3 10 2 9
k = 1
b = 12

Anna did not eat item at index 1 → cost = 10

Total bill excluding that item:
3 + 2 + 9 = 14

Anna's fair share:
14 / 2 = 7

Brian charged:
12

Overcharged:
12 - 7 = 5

Result:
5

Function Description:
bonAppetit takes:
  - bill: array of integers (item costs)
  - k: integer (index of item Anna didn't eat)
  - b: integer (amount Brian charged Anna)

Returns:
  - None (prints result)

Input Format:
- First line: two integers n and k (number of items and index to exclude)
- Second line: n space-separated integers (bill amounts)
- Third line: integer b (amount charged to Anna)

Output Format:
- Print "Bon Appetit" if charge is correct
- Otherwise print the overcharged amount

Constraints:
- 2 ≤ n ≤ 10^5
- 0 ≤ k < n
- 0 ≤ bill[i] ≤ 10^4
- 0 ≤ b ≤ sum(bill)

Notes:
- Compute total excluding index k:
    total = sum(bill) - bill[k]
- Compute fair share:
    share = total % 2
- Compare:
    if b == share → "Bon Appetit"
    else → print (b - share)

Goal:
- Correctly exclude the item Anna didn’t eat
- Compute fair split and validate Brian’s charge
\
/=============================================================


/ Input Info ==================================================
input: 3 10 2 9
/ =============================================================


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