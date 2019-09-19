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

Curve Loop(12) = {1,7,-11,-8};
Plane Surface(2) = {12};

For i In {0:numElements/2}
Transfinite Surface {numElements+2*i} Right;
Transfinite Surface {numElements+2*i+1} Left;
EndFor

For i In {0:numElements-2}
Curve Loop(numElements+3+i) = {1*numElements+1+i,7*numElements+1+i,-(1*numElements+i+2),-(6*numElements+1+i)};
Plane Surface(2*numElements+1+i) = {numElements+3+i};

//Transfinite Surface()
EndFor

Curve Loop(22) = {5, -31, -6, 3};
Plane Surface(30) = {22};
//Fazer mais automatico  - até os volumes
Curve Loop(23) = {81, -32, -51, 31};
//+
Plane Surface(31) = {23};
//+
Curve Loop(24) = {82, -33, -52, 32};
//+
Plane Surface(32) = {24};
//+
Curve Loop(25) = {83, -34, -53, 33};
//+
Plane Surface(33) = {25};
//+
Curve Loop(26) = {84, -35, -54, 34};
//+
Plane Surface(34) = {26};
//+
Curve Loop(27) = {85, -36, -55, 35};
//+
Plane Surface(35) = {27};
//+
Curve Loop(28) = {86, -37, -56, 36};
//+
Plane Surface(36) = {28};
//+
Curve Loop(29) = {87, -38, -57, 37};
//+
Plane Surface(37) = {29};
//+
Curve Loop(30) = {88, -39, -58, 38};
//+
Plane Surface(38) = {30};
//+
Curve Loop(31) = {89, -40, -59, 39};
//+
Plane Surface(39) = {31};
//+
Curve Loop(32) = {4, 8, -41, -5};
//+
Plane Surface(40) = {32};
//+
Curve Loop(33) = {61, -42, -81, 41};
//+
Plane Surface(41) = {33};
//+
Curve Loop(34) = {62, -43, -82, 42};
//+
Plane Surface(42) = {34};
//+
Curve Loop(35) = {63, -44, -83, 43};
//+
Plane Surface(43) = {35};
//+
Curve Loop(36) = {64, -45, -84, 44};
//+
Plane Surface(44) = {36};
//+
Curve Loop(37) = {65, -46, -85, 45};
//+
Plane Surface(45) = {37};
//+
Curve Loop(38) = {66, -47, -86, 46};
//+
Plane Surface(46) = {38};
//+
Curve Loop(39) = {67, -48, -87, 47};
//+
Plane Surface(47) = {39};
//+
Curve Loop(40) = {68, -49, -88, 48};
//+
Plane Surface(48) = {40};
//+
Curve Loop(41) = {69, -50, -89, 49};
//+
Plane Surface(49) = {41};
//+
Curve Loop(42) = {2, 6, -21, -7};
//+
Plane Surface(50) = {42};
//+
Curve Loop(43) = {51, -22, -71, 21};
//+
Plane Surface(51) = {43};
//+
Curve Loop(44) = {52, -23, -72, 22};
//+
Plane Surface(52) = {44};
//+
Curve Loop(45) = {53, -24, -73, 23};
//+
Plane Surface(53) = {45};
//+
Curve Loop(46) = {54, -25, -74, 24};
//+
Plane Surface(54) = {46};
//+
Curve Loop(47) = {55, -26, -75, 25};
//+
Plane Surface(55) = {47};
//+
Curve Loop(48) = {56, -27, -76, 26};
//+
Plane Surface(56) = {48};
//+
Curve Loop(49) = {57, -28, -77, 27};
//+
Plane Surface(57) = {49};
//+
Curve Loop(50) = {58, -29, -78, 28};
//+
Plane Surface(58) = {50};
//+
Curve Loop(51) = {59, -30, -79, 29};
//+
Plane Surface(59) = {51};
//+
Surface Loop(1) = {50, 1, 2, 40, 30, 11};
//+
Volume(1) = {1};
//+
Surface Loop(2) = {51, 31, 41, 21, 12, 11};
//+
Volume(2) = {2};
//+
Surface Loop(3) = {32, 42, 22, 52, 13, 12};
//+
Volume(3) = {3};
//+
Surface Loop(4) = {33, 43, 23, 53, 14, 13};
//+
Volume(4) = {4};
//+
Surface Loop(5) = {54, 34, 44, 24, 15, 14};
//+
Volume(5) = {5};
//+
Surface Loop(6) = {35, 45, 25, 55, 16, 15};
//+
Volume(6) = {6};
//+
Surface Loop(7) = {36, 46, 26, 56, 17, 16};
//+
Volume(7) = {7};
//+
Surface Loop(8) = {17, 57, 37, 47, 27, 18};
//+
Volume(8) = {8};
//+
Surface Loop(9) = {58, 38, 48, 28, 19, 18};
//+
Volume(9) = {9};
//+
Surface Loop(10) = {39, 49, 29, 59, 20, 19};
//+
Volume(10) = {10};

/*
//+
Transfinite Surface {51} Right;
//+
Transfinite Surface {53} Right;
//+
Transfinite Surface {55} Right;
//+
Transfinite Surface {57} Right;
//+
Transfinite Surface {50} Left;
//+
Transfinite Surface {52} Right;
//+
Transfinite Surface {54} Right;
//+
Transfinite Surface {56} Right;
//+
Transfinite Surface {58} Right;
//+
Transfinite Surface {51};
//+
Transfinite Surface {53};
//+
Transfinite Surface {55};
//+
Transfinite Surface {57};
//+
Transfinite Surface {59};
//+
Transfinite Surface {2} Right;
//+
Transfinite Surface {22} Right;
//+
Transfinite Surface {24} Right;
//+
Transfinite Surface {26} Right;
//+
Transfinite Surface {28} Right;
//+
Transfinite Surface {21};
//+
Transfinite Surface {23};
//+
Transfinite Surface {25};
//+
Transfinite Surface {27};
//+
Transfinite Surface {29};
//+
Transfinite Surface {30};
//+
Transfinite Surface {32};
//+
Transfinite Surface {34};
//+
Transfinite Surface {36};
//+
Transfinite Surface {38};
//+
Transfinite Surface {31} Right;
//+
Transfinite Surface {33} Right;
//+
Transfinite Surface {35} Right;
//+
Transfinite Surface {37} Right;
//+
Transfinite Surface {39} Right;
//+
Transfinite Surface {40} Left;
//+
Transfinite Surface {42} Right;
//+
Transfinite Surface {44} Right;
//+
Transfinite Surface {46} Right;
//+
Transfinite Surface {48} Right;
//+
Transfinite Surface {41} Left;
//+
Transfinite Surface {43} Left;
//+
Transfinite Surface {45} Leftt;
//+
Transfinite Surface {47} Left;
//+
Transfinite Surface {49} Left;
//+
Transfinite Surface {1} Right;
//+
Transfinite Surface {12} Right;
//+
Transfinite Surface {12};
//+
Transfinite Surface {14};
//+
Transfinite Surface {16};
//+
Transfinite Surface {18};
//+
Transfinite Surface {20};
//+
Transfinite Surface {11} Right;
//+
Transfinite Surface {13} Right;
//+
Transfinite Surface {15} Right;
//+
Transfinite Surface {17} Right;
//+
Transfinite Surface {19} Right;

Coherence;
Mesh 3;
Coherence Mesh;
*/
