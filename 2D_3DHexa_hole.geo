/************************* Grid with a hole in it*****************************/
/**** Data Entry ****/

length = 1.;
numElements = 100; //100 e 1000 só alterar o número de elementos
hole_length = 0.6;
hole_numElements = 60;//hole_length/gridsize;

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
//Recombine Surface(1);

/****Creating mesh region where the physical volume will be - well insertion****/

 /** Well 1 **/
Point(9) = {length/2, (numElements-2)*gridsize/2, 0, lc};
Point(10) = {(numElements-2)*gridsize/2, (numElements-2)*gridsize/2, 0, lc};
Point(11) = {(numElements-2)*gridsize/2, length/2, 0, lc};
Line(9) = {3,9};
Line(10) = {9,10};
Line(11) = {10,11};
Line(12) = {11,3};

Line Loop(3) = {9,10,11,12};
Surface(3) = {3};

//Recombine Surface(3);

 /** Well 2 **/
Point(13) = {-length/2, -(numElements-2)*gridsize/2, 0, lc};
Point(14) = {-(numElements-2)*gridsize/2, -(numElements-2)*gridsize/2, 0, lc};
Point(15) = {-(numElements-2)*gridsize/2, -length/2, 0, lc};
Line(13) = {1,13};
Line(14) = {13,14};
Line(15) = {14,15};
Line(16) = {15,1};

Line Loop(4) = {13,14,15,16};
Surface(4) = {4};

//Recombine Surface(4);

Background Field = 1;
Transfinite Curve {1,2,3,4} = numElements+1 Using Progression 1;
Transfinite Curve {5,6,7,8} = hole_numElements+1 Using Progression 1;
Mesh.Algorithm = 8;

Extrude {0, 0, gridsize} {Surface{1,3,4}; Layers{1};}

Physical Volume("The volume",1) = {1};

/** This part below depends on the surfaces numbers created by the extrusion. So if the mesh has a different number of elements, they will have to be changed
according to the gmsh surface nomination **/

Surface Loop(1) = {3,67,75,71,79,80};
Volume(4) = {1};
Physical Volume("Well 1",2) = {4};
Surface Loop(2) = {4,102,97,93,89,101};
Volume(5) = {2};
Physical Volume("Well 2",3) = {5};
