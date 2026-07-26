/ Question Info ===============================================
/ Jesse and Cookies

/ Jesse loves cookies, but he wants them all to reach a certain
/ minimum sweetness level.
 
/ You are given an array of integers where each element represents
/ the sweetness of a cookie.
 
/ You can perform the following operation:
/ - Take the two least sweet cookies (with sweetness x and y)
/ - Remove them from the collection
/ - Create a new cookie with sweetness:
/     newSweetness = x + 2 * y
/ - Insert the new cookie back into the collection

/ Task:
/ - Determine the minimum number of operations required so that
/   all cookies have sweetness >= k
/ - If it is not possible, return -1

/ Example:
/ k = 7
/ cookies = [1, 2, 3, 9, 10, 12]

/ Operations:
/ 1) combine 1 and 2 → new cookie = 1 + 2*2 = 5 → [3, 5, 9, 10, 12]
/ 2) combine 3 and 5 → new cookie = 3 + 2*5 = 13 → [9, 10, 12, 13]

/ Result:
/ 2

/ Function Description:
/ cookies takes:
/   - k: minimum required sweetness
/   - A: array of cookie sweetness values

/ Returns:
/   - integer representing minimum number of operations
/   - or -1 if the goal cannot be achieved

/ Input Format:
/ - First line: two integers n and k
/ - Second line: n space-separated integers (cookie sweetness)
 
/ Constraints:
/ - 1 ≤ n ≤ 10^5
/ - 0 ≤ sweetness ≤ 10^6

/ Notes:
/ - Always combine the two least sweet cookies
/ - Use an efficient structure (e.g., min-heap) for performance
/ - Stop early if the smallest cookie already meets the requirement

/ Goal:
/ - Minimize number of operations
/ - Efficiently manage repeated minimum extraction and insertion
/ =============================================================


/ Solution Info ===============================================
/ cookies[7; 1 2 3 9 10 12]
jessieAndCookies:{[k;A]
  h:asc A;
  ops:0;

  while[count h>1;
    if[first h>=k; :ops];

    x:first h;
    y:h 1;

    / remove first two
    h:2 _ h;

    / combine
    new:x + 2*y;

    / insert and re-sort
    h:asc h, new;

    ops+:1
    ];
  $[count h and first h>=k; ops; -1]
  };
/ =============================================================