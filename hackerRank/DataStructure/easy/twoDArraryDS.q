/ Question Info ===============================================
/ Question:
/ Given a  2D array, , an hourglass is a subset of values with indices falling in the following pattern:
/ a b c  
/   d  
/ e f g
/ There are  hourglasses in a  array. The  is the sum of the values in an hourglass. 
/ Calculate the hourglass sum for every hourglass in , then print the  hourglass sum.
/ =============================================================


/ Input =======================================================
m:(1 1 1 0 0 0;  0 1 0 0 0 0;  1 1 1 0 0 0; 0 0 2 4 4 0; 0 0 0 2 0 0; 0 0 1 2 4 0);
/ =============================================================


/ Solution Info ===============================================
twoDArrayDS:{[m]
  rN:count m;
  cN:count first m;

  best:-1e9;

  i:0;
  while[i<rN-2;
    j:0;
    while[j<cN-2;
      s:(m[i;j] + m[i;j+1] + m[i;j+2]) +
        m[i+1;j+1] +
        (m[i+2;j] + m[i+2;j+1] + m[i+2;j+2]);
      if[s>best; best:s];
      j+:1;
    ];
    i+:1;
  ];

  best
 };
/ =============================================================