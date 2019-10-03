/********************** Tetraedrica não estruturada simples *******************/

Point(1) = {0, 0, 0, lc};
Point(2) = {length, 0, 0, lc};
Point(3) = {length, gridsize, 0, lc};
Point(4) = {0, gridsize, 0, lc};

Line(1) = {1,2} ;
Line(2) = {2,3} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1} ;
//Recombine Surface{1};


Physical Surface(1) = 1;

Extrude{0, 0, gridsize} {Surface{1}; Layers{1};}
Transfinite Curve {1, 6, 3, 8} = 10 Using Progression 1;
Physical Surface(2) = {28};
Physical Volume("The Volume",1) = {1};
