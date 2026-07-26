/ Question Info ===============================================
/ Inserting a Node Into a Sorted Doubly Linked List

/ You are given the head of a sorted doubly linked list and an
/ integer value to insert into the list.
 
/ A doubly linked list node contains:
/ - data: integer value
/ - next: reference to the next node (or null)
/ - prev: reference to the previous node (or null)
 
/ The list is sorted in non-decreasing order.
 
/ Task:
/ - Insert a new node with the given data value into the correct
/   position in the sorted doubly linked list
/ - Maintain the sorted order
/ - Update both next and prev pointers correctly
/ - Return the head of the updated list
 
/ Example:
/ Input List:
/ 1 ⇄ 3 ⇄ 4 ⇄ 10
 
/ Insert: 5
 
/ Result:
/ 1 ⇄ 3 ⇄ 4 ⇄ 5 ⇄ 10
 
/ Explanation:
/ - 5 is inserted between 4 and 10
/ - Both next and prev links are updated accordingly
 
/ Function Description:
/ sortedInsert takes:
/   - head: reference to the head of the doubly linked list
/   - data: integer value to insert
 
/ Returns:
/   - reference to the head of the updated doubly linked list
 
/ Input Format:
/ - The test harness builds a sorted doubly linked list
/ - An integer data value is provided for insertion
 
/ Constraints:
/ - 1 ≤ number of nodes ≤ 1000
/ - -10^5 ≤ data ≤ 10^5
/ - The list is already sorted in non-decreasing order
 
/ Notes:
/ - You must correctly update both next and prev pointers
/ - Handle edge cases:
/     - Inserting into an empty list
/     - Inserting at the head
/     - Inserting at the tail
/ - Do not break existing links between nodes
 
/ Goal:
/ - Maintain sorted order after insertion
/ - Ensure bidirectional linkage is correct
/ - Return the correct head of the list
/==============================================================


/ Input Info ==================================================
n5:(`v`n`p)!(10; ::; ::);
n4:(`v`n`p)!(4;n5;::);
n5`p:n4;
n3:(`v`n`p)!(3;n4;::);
n4`p:n3;
n1:(`v`n`p)!(1;n3;::);
n3`p:n1;
/ =============================================================


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
\
/ =============================================================