/ Question Info ===============================================
/ Cheapest Transfer Route

/ A new bitcoin fork has taken over! In this new system, users
/ can use a modified form of the lightning network, in which
/ users are connected to some subset of other users, and can
/ freely transfer money to each other. In this system,
/ transferring money directly between users costs some small
/ amount of pence - a different amount from user to user.

/ A set of user source-destination pairs and the cost to
/ transfer between them looks like this:

/  s  d  c
/  --------
/  A  B  8
/  B  C  50
/  B  D  5
/  D  E  10
/  E  C  6

/ Mapped out, with the costs between the users, this would look
/ like:

/  A--8--B--50--C
/        |      |
/        5      6
/        |      |
/        D--10--E

/ If user A wants to send money to user C, they can send via
/ route ABC, costing 58p, or ABDEC, costing 29p.

/ In your input, you have a number of user pairs (listed in
/ both directions) and their costs. Tupac owes Diddy fifty
/ pounds - what's the smallest extra amount he'll have to spend
/ (in pence) to pay back Diddy this fiddy?

/ Task:
/ - Find the cheapest total transfer-fee route between two
/   named users in a weighted graph of user-to-user transfer
/   costs

/ Example:
/ edges = A-B 8, B-C 50, B-D 5, D-E 10, E-C 6 (plus their
/ reverse direction, since pairs are listed both ways)

/ shortestPath[edges;`A;`C]

/ Route ABC costs 58p, route ABDEC costs 29p - the cheaper of
/ the two.

/ Result:
/ 29

/ Function Description:
/ shortestPath takes:
/   - edges: table with columns s (source user), d (destination
/     user), c (transfer cost in pence) - both directions of
/     every connected pair are present as separate rows
/   - src: the paying user (Tupac)
/   - dst: the receiving user (Diddy)

/ Returns:
/   - the smallest total transfer cost, in pence, to route a
/     payment from src to dst

/ Input Format:
/ - List of user pairs and their transfer cost, in both
/   directions
/ - The two users involved: the payer and the payee

/ Constraints:
/ - Costs are positive
/ - A route between src and dst exists

/ Notes:
/ - The fifty pounds itself isn't the answer - only the extra
/   fee needed to route it, i.e. the cheapest path's total cost
/ - Users may be connected via more than one route; take the
/   cheapest one, not the most direct one

/ Goal:
/ - Solve with a general shortest-path search (e.g. Dijkstra),
/   not a hardcoded enumeration of routes
/ =============================================================


/ Solution Info ===============================================
/ fwd:([] s:`A`B`B`D`E; d:`B`C`D`E`C; c:8 50 5 10 6)
/ edges:fwd,([] s:fwd`d; d:fwd`s; c:fwd`c)
/ shortestPath[edges;`A;`C]

shortestPath:{[edges;src;dst]
  nodes:distinct edges[`s],edges[`d];
  dist:nodes!(count nodes)#0W;
  dist[src]:0;
  visited:0#`;
  n:count nodes;
  i:0;
  while[i<n;
    unvisitedNodes:nodes where not nodes in visited;
    if[0=count unvisitedNodes; i:n];
    if[i<n;
      unvisitedDist:dist unvisitedNodes;
      $[all unvisitedDist=0W;
        i:n;
        [
          u:unvisitedNodes unvisitedDist?min unvisitedDist;
          visited,:u;
          outEdges:select from edges where s=u;
          dist:{[dist;row] v:row`d; c:row`c; u:row`s; nd:dist[u]+c; dist[v]:dist[v]&nd; dist}/[dist;outEdges];
          i+:1
         ]
       ]
     ];
   ];
  dist dst
 }
/ =============================================================
