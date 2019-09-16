/************************* Grid with a hole in it*****************************/
/**** Data Entry ****/

length = 1.;
numElements = 10; //100 e 1000 só alterar o número de elementos
hole_length = 0.6;
hole_numElements = 6;//hole_length/gridsize;

/**** Grid Construction ****/

gridsize = length/numElements;


hl = hole_length;
lc = 0.4;

Point(1) = {-length/2, -length/2, 0, lc};
Point(2) = {length/2, -length/2, 0, lc};
Point(3) = {length/2, length/2, 0, lc};
Point(4) = {-length/2, length/2, 0, lc};

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Point(5) = {-hl/2, -hl/2, 0, lc};
Point(6) = {hl/2, -hl/2, 0, lc};
Point(7) = {hl/2, hl/2, 0, lc};
Point(8) = {-hl/2, hl/2, 0, lc};

Line(5) = {5,6};
Line(6) = {6,7};
Line(7) = {7,8};
Line(8) = {8,5};

Line Loop(1) = {1,2,3,4};
Line Loop(2) = {5,6,7,8};

Plane Surface(1) = {1,2}; //the first surface is the exterior one, the others represent the hole

Physical Surface(1) = {1};
Recombine Surface(1);

Background Field = 1;
Transfinite Curve {1,2,3,4} = numElements+1 Using Progression 1;
Transfinite Curve {5,6,7,8} = hole_numElements+1 Using Progression 1;
Mesh.Algorithm = 8;

Extrude {0, 0, gridsize} {Surface{1}; Layers{1}; Recombine;}
Physical Volume("The volume",1) = {1}
