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
//Point(2) = {0, block, 0, lc};
//Point(3) = {len, block, 0, lc} ;
//Point(4) = {len, 0, 0, lc} ;

Point(2) = {0, 0, block, lc} ;
Point(3) = {0., block, block, lc} ;
Point(4) = {0,  block, 0, lc} ;

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};
Line(5) = {2,4};

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};
Recombine Surface{1};
Extrude {1., 0, 0} {Surface{1}; Layers{1};Recombine;}

Line(6) = {14,6};


For i In {0:ne-1}
  Point(15+i) = {block*(i+1), 0, 0};
  Point(ne+15+i) = {block*(i+1), 0, block};
  Line(22+i) = {15+i,ne+15+i};
  Point(ne*2+15+i) = {block*(i+1), block, 0};
  Point(ne*3+15+i) = {block*(i+1), block, block};
  Line(ne+22+i) = {ne*2+15+i,ne*3+15+i};
  Line(ne*2+22+i) = {15+i,ne*2+15+i};
  Line(ne*3+22+i) = {ne+15+i, ne*3+15+i};
EndFor

Line(ne*4+22) = {15,4};
Line(ne*5+22) = {ne*3+15,2};
Line(ne*6+22) = {15,2};
Line(ne*8+22) = {ne*3+15,4};
Line(ne*9+22) = {14,15+ne-2};
Line(ne*10+22) = {6,ne*3+15+ne-2};
Line(ne*11+22) = {6,15+ne-2};
Line(ne*12+22) = {14,ne*3+15+ne-2};

For i In {1:ne/2-1}
  Line(ne*4+22+i) = {15+2*i,(ne*2+16+2*(i-1))};
  Line(ne*5+22+i) = {ne+16+2*(i-1),(ne*3+15+2*i)};
  Line(ne*6+22+i) = {ne+16+2*(i-1),15+2*i};
  Line(ne*7+22+i) = {15+2*(i-1),ne*3+15+2*(i-1)};
  Line(ne*8+22+i) = {2*ne+16+2*(i-1),3*ne+15+2*i};
  Line(ne*9+22+i) = {2*ne+16+2*(i-1),15+2*(i-1)};
  Line(ne*10+22+i) = {3*ne+15+2*(i-1),2*ne+16+2*(i-1)};
  Line(ne*11+22+i) = {15+2*(i-1), ne+16+2*(i-1)};
  Line(ne*12+22+i) = {3*ne+15+2*(i-1),ne+16+2*(i-1)};
EndFor
