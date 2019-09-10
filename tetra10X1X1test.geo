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
Point(2) = {0, 0, block, lc} ;
Point(3) = {0., block, block, lc} ;
Point(4) = {0,  block, 0, lc} ;
Point(5) = {block, 0, 0, lc};
Point(6) = {block, block, 0, lc} ;
Point(7) = {block, 0, block, lc};
Point(8) = {block, block, block, lc} ;

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};
Line(5) = {1,3};
Line(6) = {3,7};
Line(7) = {7,1};
Line(8) = {6,1};
Line(9) = {7,6};
Line(10) = {6,3};

Curve Loop(1) = {1,2,3,4};
Curve Loop(2) = {5,6,7};
Curve Loop(3) = {8,-7,9};
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};

Recombine Surface{1};

Extrude {len, 0, 0} {Surface{1}; Layers{10}; Recombine;}
Extrude {len-block, 0, 0} {Surface{2,3}; Layers{9};Recombine;}
Extrude{len-block, 0, 0} {Line{10};Layers{9};}
