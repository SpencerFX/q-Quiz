/ Question Info ===============================================
/ Overlapping Tiled Areas

/ You've been presented with the plans for an avant-garde
/ method of tiling floors. You have a list of values which
/ represent the lower-left and upper-right corner co-ordinates
/ of a series of rectangular tiled areas, where one tile is
/ equal to one square unit.

/ The designer then specifies that he doesn't want any areas
/ that don't overlap others included in the final plan - if an
/ area doesn't directly overlap with another, disregard it
/ entirely. In the resulting set of areas, some tiles overlap -
/ since there's no point in placing more than one tile per
/ spot, so how many tiles do you need total to complete the
/ plan?

/ For example, if you were provided with these three tiled
/ areas:
/ lx,ly,ux,uy
/ 0,0,3,3
/ 2,2,4,5
/ 6,3,8,7

/ The direct map would look like this, with (0,0) in the bottom
/ left corner:
/       ##
/       ##
/   ##  ##
/   ##  ##
/ ##@#
/ ###
/ ###

/ There is an overlap of two tiles in the square bounded by
/ (2,2) and (3,3), and the tiles at the top right are not
/ connected to any other tiles. In this case the total number
/ of required tiles is 14.

/ Task:
/ - Drop any rectangle that doesn't overlap at least one other
/   rectangle in the input
/ - Of the rectangles that remain, count the number of distinct
/   unit tiles they cover between them (an overlapping tile
/   only counts once)

/ Example:
/ rects = (0,0,3,3) (2,2,4,5) (6,3,8,7)

/ (0,0,3,3) and (2,2,4,5) overlap each other at the single unit
/ square bounded by (2,2) and (3,3), so both are kept.
/ (6,3,8,7) overlaps neither, so it's dropped entirely, even
/ though it's a valid tiled area on its own.

/ Kept area = 9 tiles + 6 tiles - 1 shared tile = 14

/ Result:
/ 14

/ Function Description:
/ tilesNeeded takes:
/   - rects: list of (lx;ly;ux;uy) rectangles, where a
/     rectangle covers the unit tiles with lower-left corners
/     at integer (x;y) points satisfying lx<=x<ux, ly<=y<uy

/ Returns:
/   - count of distinct unit tiles covered by the rectangles
/     that overlap at least one other rectangle

/ Input Format:
/ - One rectangle per line: lx,ly,ux,uy

/ Constraints:
/ - lx < ux and ly < uy for every rectangle
/ - 1 ≤ count rects

/ Notes:
/ - "Overlap" means the rectangles share at least one unit
/   tile, not just touch at an edge or corner
/ - A rectangle only needs to overlap one other rectangle to be
/   kept, even if it doesn't overlap all of them - overlap
/   chains keep everyone in the chain
/ - If nothing overlaps anything, the answer is 0

/ Goal:
/ - Solve without assuming there are only ever two or three
/   rectangles in the input
/ =============================================================


/ Solution Info ===============================================
/ tilesNeeded[((0;0;3;3);(2;2;4;5);(6;3;8;7))]

rectOverlap:{[a;b] (a[0]<b[2]) & (b[0]<a[2]) & (a[1]<b[3]) & (b[1]<a[3]) };

keepMask:{[rects]
  n:count rects;
  {[rects;n;i]
    others:rects (til n) except i;
    any rectOverlap[rects i;] each others
   }[rects;n;] each til n
 };

cellsOf:{[r]
  xs:r[0]+til r[2]-r[0];
  ys:r[1]+til r[3]-r[1];
  raze {[x;ys] (x;) each ys}[;ys] each xs
 };

tilesNeeded:{[rects]
  kept:rects where keepMask rects;
  count distinct raze cellsOf each kept
 }
/ =============================================================
