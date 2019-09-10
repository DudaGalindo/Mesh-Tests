/*********************************************************************
 *
 *  Gmsh tutorial 1
 *
 *  Variables, elementary entities (points, curves, surfaces), physical
 *  entities (points, curves, surfaces)
 *
 *********************************************************************/

lc = 0.4;
len = 1.;
ne = 10;
block = len/ne;

Point(1) = {0, 0, 0, lc};
Point(2) = {0, block, 0, lc};
Point(3) = {len, block, 0, lc} ;
Point(4) = {len, 0, 0, lc} ;

//Point(2) = {0, 0, block, lc} ;
//Point(3) = {0., block, block, lc} ;
//Point(4) = {0,  block, 0, lc} ;

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};

Extrude {0, 0, block} {Surface{1}; Layers{1}; Recombine;}

Line(14) = {5,2};

For i In {0:9}
Point(15+i) = {block*(i+1), 0, 0};
Point(ne+15+i) = {block*(i+1), 0, block};
Line(21+i) = {15+i,ne+15+i};
Point(ne*2+15+i) = {block*(i+1), block, 0};
Point(ne*3+15+i) = {block*(i+1), block, block};
Line(ne+21+i) = {ne*2+15+i,ne*3+15+i};
Line(ne*2+21+i) = {15+i,ne*2+15+i};
Line(ne*3+21+i) = {ne+15+i, ne*3+15+i};
If (i==0)
  Line(ne*4+21) = {15,2};
  Line(ne*5+21) = {5,45};
  Line(ne*6+21) = {45,2};
  Line(ne*7+21) = {15,5};
Else
  Line(ne*4+21+i) = {15+i,(ne*2+15+i-1)};
  Line(ne*5+21+i) = {ne+15+i-1, (ne*3+15+i)};
  Line(ne*6+21+i) = {ne*3+15+i, (ne*2+15+i-1)};
  Line(ne*7+21+i) = {15+i,ne+15+i-1};
EndIf
Line(ne*8+21+i) = {ne*3+15+i,15+i};
EndFor
