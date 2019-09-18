length = 1.;
numElements = 10; //100 e 1000 só alterar o número de elementos
gridsize = length/numElements;
dd=2.0;
Point(1) = {0, 0, 0, dd};
Point(2) = {length, 0, 0, dd};
Point(3) = {length, gridsize, 0, dd};
Point(4) = {0, gridsize, 0, dd};

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Line Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};
Physical Surface(1) = {1};

//Transfinite Surface {3, 1} = numElements+1 Progression 1;

// Creating 3D Mesh
Extrude {0, 0, gridsize} { Curve{1,2,3,4}; Layers{1}; Recombine;}

// Creating mesh lines inside the mesh quadrangular surfaces

For i In {1:numElements-1}
Point(2*numElements+i) = {gridsize*i, 0, gridsize, dd};
Point(3*numElements+i) = {gridsize*i, gridsize, 0, dd};
Point(4*numElements+i) = {gridsize*i,0,0, dd};
Point(5*numElements+i) = {gridsize*i, gridsize, gridsize, dd};
Line(2*numElements+i) = {4*numElements+i, 3*numElements+i};
Line(3*numElements+i) = {3*numElements+i, 5*numElements+i};
Line(4*numElements+i) = {5*numElements+i, 2*numElements+i};
Line(5*numElements+i) = {2*numElements+i, 4*numElements+i};
Curve Loop(1+i) = {3*numElements+i,4*numElements+i,5*numElements+i,2*numElements+i};
Plane Surface(20+i) = {1+i};
EndFor

Line Loop(numElements+1) = {7, 9, -11, -2};
Line Loop(numElements+2) = {5, 9, 13, 17};
Plane Surface(2) = {numElements+2};


Transfinite Surface {1} Alternated;
Transfinite Curve {1,3,5,13} = numElements+1 Using Progression 1;
Transfinite Surface {2} = {10, 5, 6, 8} Alternated;
Transfinite Surface {16} = {10, 8, 3, 4} Alternated;
Transfinite Surface {8} = {1, 2, 6, 5} Alternated;
Transfinite Surface {12} Left;
//Transfinite Surface {20} Right;

For i In {0:numElements/2}
Transfinite Surface {20+2*i} Right;
Transfinite Surface {20+2*i+1} Left;
EndFor

Coherence;
Mesh 3;
Coherence Mesh;
