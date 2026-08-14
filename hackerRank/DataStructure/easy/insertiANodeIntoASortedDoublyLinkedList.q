//====================================================================
// Inserting a Node Into a Sorted Doubly Linked List
//
// Displays the HackerRank problem statement.
//
// Usage:
//      .quiz.hackerRank.dataStructures.insertiANodeIntoASortedDoublyLinkedList.info[]
//====================================================================
.quiz.hackerRank.dataStructures.insertiANodeIntoASortedDoublyLinkedList.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Inserting a Node Into a Sorted Doubly Linked List";
    -1 "";
    -1 "You are given the head of a sorted doubly linked list and an";
    -1 "integer value to insert into the list.";
    -1 "";
    -1 "A doubly linked list node contains:";
    -1 "- data: integer value";
    -1 "- next: reference to the next node (or null)";
    -1 "- prev: reference to the previous node (or null)";
    -1 "";
    -1 "The list is sorted in non-decreasing order.";
    -1 "";
    -1 "Task:";
    -1 "- Insert a new node with the given data value into the correct";
    -1 "  position in the sorted doubly linked list";
    -1 "- Maintain the sorted order";
    -1 "- Update both next and prev pointers correctly";
    -1 "- Return the head of the updated list";
    -1 "";
    -1 "Example:";
    -1 "Input List:";
    -1 "1 <-> 3 <-> 4 <-> 10";
    -1 "";
    -1 "Insert: 5";
    -1 "";
    -1 "Result:";
    -1 "1 <-> 3 <-> 4 <-> 5 <-> 10";
    -1 "";
    -1 "Explanation:";
    -1 "- 5 is inserted between 4 and 10";
    -1 "- Both next and prev links are updated accordingly";
    -1 "";
    -1 "Function Description:";
    -1 "sortedInsert takes:";
    -1 "  - head: reference to the head of the doubly linked list";
    -1 "  - data: integer value to insert";
    -1 "";
    -1 "Returns:";
    -1 "  - reference to the head of the updated doubly linked list";
    -1 "";
    -1 "Input Format:";
    -1 "- The test harness builds a sorted doubly linked list";
    -1 "- An integer data value is provided for insertion";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= number of nodes <= 1000";
    -1 "- -10^5 <= data <= 10^5";
    -1 "- The list is already sorted in non-decreasing order";
    -1 "";
    -1 "Notes:";
    -1 "- You must correctly update both next and prev pointers";
    -1 "- Handle edge cases:";
    -1 "    - Inserting into an empty list";
    -1 "    - Inserting at the head";
    -1 "    - Inserting at the tail";
    -1 "- Do not break existing links between nodes";
    -1 "";
    -1 "Goal:";
    -1 "- Maintain sorted order after insertion";
    -1 "- Ensure bidirectional linkage is correct";
    -1 "- Return the correct head of the list";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n5:(`v`n`p)!(10; ::; ::);";
    -1 "n4:(`v`n`p)!(4;n5;::);";
    -1 "n5[`p]:n4;";
    -1 "n3:(`v`n`p)!(3;n4;::);";
    -1 "n4[`p]:n3;";
    -1 "n1:(`v`n`p)!(1;n3;::);";
    -1 "n3[`p]:n1;";
    -1 "/";
    -1 "/=============================================================";
 };


/ Solution Info ===============================================
sortedInsert:{[head; x]
  new:(`v`n`p)!(x; ::; ::);

  if[not 99h=type head;
    :new
  ];

  cur:head;

  if[x <= cur`v;
    new`n:cur;
    cur`p:new;
    :new
  ];

  while[1b;

    if[not 99h=type cur`n;
      cur`n:new;
      new`p:cur;
      :head
    ];

    if[99h=type cur`n;
      if[x <= (cur`n)`v;
        nxt:cur`n;

        new`n:nxt;
        new`p:cur;

        cur`n:new;
        nxt`p:new;

        :head
      ];
    ];

    cur:cur`n;
  ];
 }
/
printList:{[x]
  while[99h=type x;
    show x`v;
    x:x`n;
  ];
  show x
 }
/ res:sortedInsert[n1;5]
/ printList n1
/ =============================================================
