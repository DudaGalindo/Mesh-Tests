/*********************************************************************
 *
 *  Gmsh test 1
 *
 *  Variables, elementary entities (points, curves, surfaces), physical
 *  entities (points, curves, surfaces)
 *
 *********************************************************************/

lc = 1.;
length = 1.;
numElements = 10; //100 e 1000 só alterar o número de elementos
gridsize = length/numElements;

Point(1) = {0, 0, 0, lc} ;
Point(2) = {0., 0, gridsize, lc} ;
Point(3) = {0, gridsize, gridsize, lc} ;
Point(4) = {0, gridsize, 0, lc} ;
Line(1) = {1,2} ;
Line(2) = {2,3} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1} ;
Recombine Surface{1};

Physical Surface(1) = 1;

//Physical Point(5) = {gridsize/2,gridsize/2,gridsize/2};
//Physical Point(6) = {(numElements-1)*gridsize/2,gridsize/2, gridsize/2};
//Physical Point(5) = {5};

Extrude{1., 0, 0} {Surface{1}; Layers{10}; Recombine;}
Physical Surface{2} = 28;
Physical Volume("The Volume",1) = {1} ;
