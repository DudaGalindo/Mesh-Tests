/*********************************************************************
 *
 *  Gmsh tutorial 1
 *
 *  Variables, elementary entities (points, curves, surfaces), physical
 *  entities (points, curves, surfaces)
 *
 *********************************************************************/

lc = 0.2;

Point(1) = {0, 0, 0, lc};
Point(2) = {0, 0, 0.1, lc} ;
Point(3) = {0., 0.1, 0.1, lc} ;
Point(4) = {0,  0.1, 0, lc} ;
Point(5) = {0.05, 0.05, 0.05, lc} ;


Line(1) = {1,2} ;
Line(2) = {2,3} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;
Line(5) = {1,5} ;
Line(6) = {2,5} ;
Line(7) = {3,5} ;
Line(8) = {4,5} ;

Curve Loop(1) = {1,2,3,4} ;
Curve Loop(2) = {1,6,-5} ;
Curve Loop(3) = {3,8,-7} ;

Plane Surface(1) = {1} ;
Plane Surface(2) = {2} ;
Plane Surface(3) = {3} ;

//my_new_point = Translate{0.9, 0., 0.} {Duplicata{ Point{5};} } ;
//my_new_points[] = Translate{1.,0.,0.} {Duplicata{ Point{1,2,3,4};} };
//Line(9) = {my_new_points[0],my_new_point};

Recombine Surface{1};
Extrude{1.,0,0} {Surface{1};Layers{10};Recombine;}
Extrude{0.9,0,0} {Surface{2};Layers{9};Recombine;}
Extrude{0.9,0,0} {Surface{3};Layers{9};Recombine;}
Line(52) = {15,21} ;
Line(55) = {6,21} ;
Line(56) = {7,21} ;
Line(57) = {11,21} ;

Curve Loop(4) = {13,55,-52};
Curve Loop(5) = {-11,56,-57};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Extrude{-0.9,0,0} {Surface{4,5};Layers{9};Recombine;}




//Physical Line(10) = {10}
//Physical Line{11} = {11}
//Physical Line{12} = {12}
//Physical Line
//Translate{0.1,0,0} {Duplicata{Point{5};}}

//Extrude{.8,0,0} {Point{5};Layers{5};}
