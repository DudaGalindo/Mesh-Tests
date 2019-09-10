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
Point(9) = {2*block, 0, 0, lc} ;
Point(10) = {2*block, block, block, lc} ;

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
Line(11) = {6,9};
Line(12) = {7,10};
Line(13) = {7,9} ;
Line(14) = {6,10};


Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};


Curve Loop(2) = {5,6,7};
Curve Loop(3) = {8,-7,9};
//Curve Loop(4) = {-5,-8,10};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
//Plane Surface(4) = {4};
//Surface Loop(1) = {2,3,4};
//Volume(1) = {1};


Recombine Surface{1};

Extrude {len, 0, 0} {Surface{1}; Layers{10}; Recombine;}
Extrude {len-2*block, 0, 0} {Surface{2,3}; Line{5,10,14,12,11,13}; Layers{4};Recombine;}
Extrude{len-2*block, 0, 0} {Line{10};Layers{5};}

Physical Volume("my volume") = {1,2};
