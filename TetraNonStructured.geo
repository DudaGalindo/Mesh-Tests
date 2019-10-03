/*************** Malha tetraedrica não estruturada por volumes ****************/


length = 1.;
numElements = 10; //100 e 1000 só alterar o número de elementos
gridsize = length/numElements;
dd=300.0;

Point(1) = {0, 0, 0, dd};
Point(2) = {0, gridsize, 0, dd};
Point(3) = {0, gridsize, gridsize, dd};
Point(4) = {0, 0, gridsize, dd};

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Curve Loop(1) = {1,2,3,4};
Plane Surface(1) = {1};

For i In {1:numElements}
Point(numElements+i) = {gridsize*i, 0, gridsize, dd};
Point(2*numElements+i) = {gridsize*i, gridsize, 0, dd};
Point(3*numElements+i) = {gridsize*i,0,0, dd};
Point(4*numElements+i) = {gridsize*i, gridsize, gridsize, dd};
Line(1*numElements+i) = {3*numElements+i, 2*numElements+i};
Line(2*numElements+i) = {2*numElements+i, 4*numElements+i};
Line(3*numElements+i) = {4*numElements+i, 1*numElements+i};
Line(4*numElements+i) = {1*numElements+i, 3*numElements+i};
Curve Loop(1+i) = {2*numElements+i,3*numElements+i,4*numElements+i,1*numElements+i};
Plane Surface(numElements+i) = {1+i};
EndFor

For i In {0:numElements-2}
Line(5*numElements+1+i) = {4*numElements+1+i,4*numElements+2+i};
Line(6*numElements+1+i) = {3*numElements+1+i,3*numElements+2+i};
Line(7*numElements+1+i) = {2*numElements+1+i,2*numElements+2+i};
Line(8*numElements+1+i) = {1*numElements+1+i,1*numElements+2+i};
EndFor

Line(5) = {4,11};
Line(6) = {3,41};
Line(7) = {2,21};
Line(8) = {1,31};


For i In {0:numElements/2}
Transfinite Surface {numElements+2*i} Right;
Transfinite Surface {numElements+2*i+1} Left;
EndFor

For i In {0:numElements-2}
Curve Loop(numElements+3+i) = {1*numElements+1+i,7*numElements+1+i,-(1*numElements+i+2),-(6*numElements+1+i)};
Curve Loop(2*numElements+3+i) = {8*numElements+1+i, -(3*numElements+i+2), -(5*numElements+1+i), 3*numElements+i+1};
Curve Loop(3*numElements+3+i) = {6*numElements+1+i, -(4*numElements+i+2), -(8*numElements+1+i), 4*numElements+i+1};
Curve Loop(4*numElements+3+i) = {5*numElements+1+i, -(2*numElements+i+2), -(7*numElements+1+i), 2*numElements+i+1};
Plane Surface(2*numElements+1+i) = {numElements+3+i};
Plane Surface(3*numElements+i+1) = {2*numElements+3+i};
Plane Surface(4*numElements+i+1) = {3*numElements+3+i};
Plane Surface(5*numElements+i+1) = {4*numElements+3+i};
Surface Loop(2+i) = {5*numElements+1+i,3*numElements+i+1, 4*numElements+i+1, 2*numElements+i+1, numElements+2+i,numElements+1+i};
Volume(2+i) = {2+i};
EndFor

Curve Loop(12) = {8, 11, -7,-1};
Plane Surface(10) = {12};
Curve Loop(22) = {5, -31, -6, 3};
Plane Surface(30) = {22};
Curve Loop(32) = {4, 8, -41, -5};
Plane Surface(40) = {32};
Curve Loop(42) = {2, 6, -21, -7};
Plane Surface(50) = {42};
Surface Loop(1) = {50, 1, 10, 40, 30, 11};
Volume(1) = {1};

Coherence;
Mesh 3;
Coherence Mesh;
