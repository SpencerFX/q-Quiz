//====================================================================
// Jesse and Cookies
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.jessieAndCookies.info[]
//====================================================================
.quiz.hackerRank.dataStructures.jessieAndCookies.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Jesse and Cookies";
    -1 "";
    -1 "Jesse loves cookies, but he wants them all to reach a certain";
    -1 "minimum sweetness level.";
    -1 "";
    -1 "You are given an array of integers where each element represents";
    -1 "the sweetness of a cookie.";
    -1 "";
    -1 "You can perform the following operation:";
    -1 "- Take the two least sweet cookies (with sweetness x and y)";
    -1 "- Remove them from the collection";
    -1 "- Create a new cookie with sweetness:";
    -1 "    newSweetness = x + 2 * y";
    -1 "- Insert the new cookie back into the collection";
    -1 "";
    -1 "Task:";
    -1 "- Determine the minimum number of operations required so that";
    -1 "  all cookies have sweetness >= k";
    -1 "- If it is not possible, return -1";
    -1 "";
    -1 "Example:";
    -1 "k = 7";
    -1 "cookies = 1 2 3 9 10 12";
    -1 "";
    -1 "Operations:";
    -1 "1) combine 1 and 2 -> new cookie = 1 + 2*2 = 5 -> 3 5 9 10 12";
    -1 "2) combine 3 and 5 -> new cookie = 3 + 2*5 = 13 -> 9 10 12 13";
    -1 "";
    -1 "Result:";
    -1 "2";
    -1 "";
    -1 "Function Description:";
    -1 "jessieAndCookies takes:";
    -1 "  - k: minimum required sweetness";
    -1 "  - A: array of cookie sweetness values";
    -1 "";
    -1 "Returns:";
    -1 "  - integer representing minimum number of operations";
    -1 "  - or -1 if the goal cannot be achieved";
    -1 "";
    -1 "Input Format:";
    -1 "- First line: two integers n and k";
    -1 "- Second line: n space-separated integers (cookie sweetness)";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= n <= 10^5";
    -1 "- 0 <= sweetness <= 10^6";
    -1 "";
    -1 "Notes:";
    -1 "- Always combine the two least sweet cookies";
    -1 "- Use an efficient structure (e.g., min-heap) for performance";
    -1 "- Stop early if the smallest cookie already meets the requirement";
    -1 "";
    -1 "Goal:";
    -1 "- Minimize number of operations";
    -1 "- Efficiently manage repeated minimum extraction and insertion";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "k:7;";
    -1 "A:1 2 3 9 10 12;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
/ jessieAndCookies[k;A]
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
