length = 1.;
numElements = 10; //100 e 1000 só alterar o número de elementos
gridsize = length/numElements;
dd = 1.0;

Point(1) = {0, 0, 0, dd};
Point(2) = {length, 0, 0, dd};
Point(3) = {length, gridsize, 0, dd};
Point(4) = {0, gridsize, 0, dd};

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};
Physical Surface(1) = {1};

Extrude {0, 0, gridsize} {Surface{1}; Layers{1}; Recombine;}

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
Plane Surface(26+i) = {1+i};
EndFor

Line Loop(numElements+1) = {7, 9, -11, -2};
Line Loop(numElements+2) = {5, 9, 13, 17};
Plane Surface(2) = {numElements+2};

Transfinite Surface {1} Alternated;
Transfinite Curve {1,3,6,8} = numElements+1 Using Progression 1;
Transfinite Surface {26} = {14, 5, 6, 10} Alternated;
Transfinite Surface {21} = {14, 10, 3, 4} Alternated;
Transfinite Surface {13} = {1, 5, 6, 2} Alternated;
Transfinite Surface {17} Left;
Transfinite Surface {25} Right;


For i In {0:numElements/2}
Transfinite Surface {26+2*i} Right;
Transfinite Surface {26+2*i+1} Left;
EndFor

Coherence;
Mesh 3;
Coherence Mesh;

Physical Volume("The Volume",1) = {1};
