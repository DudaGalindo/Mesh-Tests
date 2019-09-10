/*********************************************************************
 *
 *  Gmsh test 1
 *
 *  Variables, elementary entities (points, curves, surfaces), physical
 *  entities (points, curves, surfaces)
 *
 *********************************************************************/

lc = 0.3;

Point(1) = {0, 0, 0, lc};
Point(2) = {0., 1.,  0, lc} ;
Line(1) = {1,2} ;

Extrude{1., 0, 0} {Line{1}; Layers{5}; Recombine;}

Physical Curve(1) = {1,2,3,4} ;
Physical Surface("My Surface") = {1} ;
