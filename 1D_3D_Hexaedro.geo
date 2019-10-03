/********************* Structured hexahedral mesh *****************************/


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

Extrude{length, 0, 0} {Surface{1}; Layers{numElements}; Recombine;}
Physical Surface(2) = {28};
Physical Volume("The Volume",1) = {1};


/****Creating mesh region where the physical volume will be - well insertion****/

 /** Well 1 **/

/*
Point(11) = {(numElements-1)*gridsize, gridsize, 0, lc};
Point(12) = {(numElements-1)*gridsize, 0, 0, lc};
Point(13) = {(numElements-1)*gridsize, gridsize, gridsize, lc};
Point(15) = {(numElements-1)*gridsize, 0, gridsize, lc};

Line(21) = {11,12};
Line(22) = {11,14};
Line(23) = {5,12};
Line(24) = {12,15};
Line(25) = {11,13};
Line(26) = {13,15};
Line(27) = {13,10};
Line(28) = {15,6};

Line Loop(7) = {-23,6,-28,-24};
Line Loop(8) = {22,-8,-27,-25};
Line Loop(9) = {26,28,7,-27};
Line Loop(10) = {21, -23,-9,-22};
Line Loop(11) = {21,24,-26,-25};

Surface(8) = {7};
Surface(9) = {8};
Surface(10) = {9};
Surface(11) = {10};
Surface(12) = {11};

Recombine Surface(8);
Recombine Surface(9);
Recombine Surface(10);
Recombine Surface(11);
Recombine Surface(12);

Surface Loop(1) = {8,9,10,11,26,12};
Volume(2) = {1};
Physical Volume ("Well 1") = {2};
*/
 /** Well 2 **/
/*
Point(16) = {gridsize, gridsize, 0, lc};
Point(17) = {gridsize, 0, 0, lc};
Point(18) = {gridsize, gridsize, gridsize, lc};
Point(19) = {gridsize, 0, gridsize, lc};

Line(29) = {16,17};
Line(30) = {16,18};
Line(31) = {1,17};
Line(32) = {18,19};
Line(33) = {17,19};
Line(34) = {4,16};
Line(35) = {2,19};
Line(36) = {3,18};

Line Loop(12) = {31,-29,-34,4};
Line Loop(13) = {31,33,-35,-1};
Line Loop(14) = {35,-32,-36,-2};
Line Loop(15) = {34,30,-36, 3};
Line Loop(16) = {29,33,-32,-30};

Surface(19) = {12};
Surface(14) = {13};
Surface(15) = {14};
Surface(16) = {15};
Surface(18) = {16};
Recombine Surface(19); Recombine Surface(14);Recombine Surface(15); Recombine Surface(16);
Recombine Surface(18);
Surface Loop(2) = {19,14,15,16,18 ,1};

Volume(3) = {2};
Physical Volume ("Well 2") = {3};
Mesh.Algorithm = 8; // NÃO TA FUNCIONANDO O BLOCO DO POÇO - OLHAR DEPOIS
*/
