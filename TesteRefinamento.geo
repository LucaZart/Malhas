// Gmsh project created on Mon Nov 13 19:47:21 2023
SetFactory("OpenCASCADE");

Esize = 0.1;            //overall grid size  
Esize2 = Esize/10;        //boundary layers size  

//Mesh.CharacteristicLengthMin = Esize2;  
//Mesh.CharacteristicLengthMax = Esize;  
Mesh.CharacteristicLengthFactor = Esize;

Mesh.Algorithm = 8; //1: MeshAdapt, 2: Automatic, 5: Delaunay, 6: Frontal-Delaunay, 7: BAMG, 8: Frontal-Delaunay for Quads, 9: Packing of Parallelograms  
Mesh.RecombinationAlgorithm = 0;//0: simple, 1: blossom, 2: simple full-quad, 3: blossom full-quad  
//Mesh.Algorithm3D = 1; //1: Delaunay, 4: Frontal, 7: MMG3D, 9: R-tree, 10: HXT  
//Mesh.Recombine3DAll = 0; //0=off, 1=on  
Mesh.RecombineAll = 1; //0=off, 1=on

//--------------------------------------------------------------  
L = 0.5;    nL = L/Esize;  
H = 0.3;    nH = H/Esize;  
D = 0.05;   nD = Pi*D/Esize/4;  
r = D/2;

x0 = 0;  
y0 = 0;  
z0 = 0;

Point(1) = {x0, y0, z0};  
Point(2) = {x0+r, y0, z0};  
Point(3) = {x0-r, y0, z0};  
Point(4) = {x0, y0+r, z0};  
Point(5) = {x0, y0-r, z0};
  
Point(6) = {-L, y0-H/2, z0};  
Point(7) = {L, y0-H/2, z0};  
Point(8) = {L, y0+H/2, z0};  
Point(9) = {-L, y0+H/2, z0};

//-------------------------------------------------------------------  
Circle(1) = {2, 1, 4};  
Circle(2) = {4, 1, 3};  
Circle(3) = {3, 1, 5};  
Circle(4) = {5, 1, 2};

Line(5) = {6, 7};  
Line(6) = {7, 8};  
Line(7) = {8, 9};  
Line(8) = {9, 6};  
Curve Loop(1) = {8, 5, 6, 7};  
Curve Loop(2) = {3, 4, 1, 2};  
Plane Surface(1) = {1, 2};

//-------------------------------------------------------------------  
Field[1] = BoundaryLayer;  
Field[1].EdgesList = {1, 2, 3, 4};  
Field[1].hfar = Esize2;         //(float) Element size far from the wall  
Field[1].hwall_n = Esize2/10;     //(float) Mesh size normal to the wall  
Field[1].thickness = Esize2;    //(float) maximal thickness of the boundary layer  
Field[1].ratio = 1.1;        //(float)  
Field[1].Quads = 0;        //(int) Generate recombined elements in the boundary layer  
BoundaryLayer Field = 1;
//------------------------------------------------------------------