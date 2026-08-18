/ PUZZLE 8 =========================================
/ The input is a list of 2D points, one per line as "x y".

/ Two points are "linked" if the (Euclidean) distance between them is
/ at most a given threshold. Linked points form clusters (if A links
/ to B and B links to C, A/B/C are all one cluster, even if A and C
/ aren't directly within range of each other).

/ Part 1: using a threshold of 10, find the two largest clusters and
/ report the product of their sizes.

/ Part 2: find the smallest threshold at which every point belongs
/ to one single cluster, and report that threshold.

/ Function Description:
/ day08 takes the puzzle input as a list of strings ("x y" per line)
/ and returns (part1;part2). Distances are compared as squared
/ Euclidean distance (no square root needed since only relative order
/ matters), so the threshold is a squared distance too.
/ =====================================================


/ Solution Info ===============================================
/ day08 ("0 0";"1 1";"2 2";"10 10";"11 11";"12 10")

day08:{[lines]
    pts:{"J"$" " vs x} each lines;
    n:count pts;
    xs:pts[;0]; ys:pts[;1];
    distSq:{[xs;ys;i;j] ((xs[i]-xs[j])*xs[i]-xs[j])+(ys[i]-ys[j])*ys[i]-ys[j]};
    pairs:raze {[n;i] ((i+1)+til (n-1)-i),\:i}[n;] each til n-1;
    pairDist:{[xs;ys;distSq;p] distSq[xs;ys;p 0;p 1]}[xs;ys;distSq;] each pairs;

    / union-find: follow parent pointers up to each element's root
    find:{[parent;x] while[parent[x]<>x; x:parent[x]]; x};

    / cluster sizes when only edges at or under threshold are kept
    clusterSizes:{[n;pairs;pairDist;find;threshold]
        parent:til n;
        keep:where pairDist<=threshold;
        merge1:{[parent;pairs;find;pi]
            p:pairs pi;
            ra:find[parent;p 0]; rb:find[parent;p 1];
            if[ra<>rb; parent[ra]:rb];
            parent
         };
        proj:merge1[;pairs;find;];
        parent:proj/[parent;keep];
        roots:find[parent;] each til n;
        count each group roots
     };

    sizes:clusterSizes[n;pairs;pairDist;find;10];
    sortedSizes:desc sizes;
    part1:prd 2#sortedSizes;

    / smallest distance threshold that merges everything into one
    / cluster - step up through every distinct pairwise distance,
    / stopping as soon as a single cluster covers all n points.
    sortedDist:asc distinct pairDist;
    minThreshold:{[n;pairs;pairDist;find;clusterSizes;sortedDist;lo]
        t:sortedDist lo;
        sz:clusterSizes[n;pairs;pairDist;find;t];
        $[1=count sz; t; .z.s[n;pairs;pairDist;find;clusterSizes;sortedDist;lo+1]]
     }[n;pairs;pairDist;find;clusterSizes;sortedDist;0];
    part2:minThreshold;
    (part1;part2)
 };
/ =============================================================
