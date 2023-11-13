// Gmsh project created on Sun Oct 29 20:50:04 2023
SetFactory("OpenCASCADE");

//Parâmetros de Projeto
AR = 0.1;                   //Corresponde a razão de aspecto da Darreius (H/Dd)
r_d = 0.4;                  //Raio da Turbina Darreius (m)
c_d = 0.2;                  //Corda da Pá da Darreius (m)
n_d = 3;                    //Número de Pás
D_d = r_d*2;                //Diâmetro da Turbina Darreius (m)
SR  = (n_d*c_d)/(2*r_d);    //Corresponde a razão de solidez 

Point( 1) = ( 0.100000,       0.000378,       0.000000 );
Point( 2) = ( 0.090000,       0.002420,       0.000000 );
Point( 3) = ( 0.080000,       0.004344,       0.000000 );
Point( 4) = ( 0.060000,       0.007870,       0.000000 );
Point( 5) = ( 0.040000,       0.010992,       0.000000 );
Point( 6) = ( 0.020000,       0.013690,       0.000000 );
Point( 7) = ( 0.000000,       0.015882,       0.000000 );
Point( 8) = ( -0.02000,       0.017410,       0.000000 );
Point( 9) = ( -0.04000,       0.018006,       0.000000 );
Point(10) = ( -0.05000,       0.017824,       0.000000 );
Point(11) = ( -0.06000,       0.017212,       0.000000 );
Point(12) = ( -0.07000,       0.016036,       0.000000 );
Point(13) = ( -0.08000,       0.014048,       0.000000 );
Point(14) = ( -0.08500,       0.012600,       0.000000 );
Point(15) = ( -0.09000,       0.010664,       0.000000 );
Point(16) = ( -0.09500,       0.007844,       0.000000 );
Point(17) = ( -0.09750,       0.005682,       0.000000 );
Point(18) = ( -0.10000,       0.000000,       0.000000 );
Point(19) = ( -0.09750,       -0.00568,       0.000000 );
Point(20) = ( -0.09500,       -0.00784,       0.000000 );
Point(21) = ( -0.09000,       -0.01066,       0.000000 );
Point(22) = ( -0.08500,       -0.01260,       0.000000 );
Point(23) = ( -0.08000,       -0.01404,       0.000000 );
Point(24) = ( -0.07000,       -0.01603,       0.000000 );
Point(25) = ( -0.06000,       -0.01721,       0.000000 );
Point(26) = ( -0.05000,       -0.01782,       0.000000 );
Point(27) = ( -0.04000,       -0.01800,       0.000000 );
Point(28) = ( -0.02000,       -0.01741,       0.000000 );
Point(29) = ( 0.000000,       -0.01588,       0.000000 );
Point(30) = ( 0.020000,       -0.01369,       0.000000 );
Point(31) = ( 0.040000,       -0.01099,       0.000000 );
Point(32) = ( 0.060000,       -0.00787,       0.000000 );
Point(33) = ( 0.080000,       -0.00434,       0.000000 );
Point(34) = ( 0.090000,       -0.00242,       0.000000 );


Translate {0, r_d, 0}{Point{1}; Point{2}; Point{3}; Point{4}; Point{5}; Point{6}; Point{7}; Point{8}; Point{9}; Point{10}; Point{11}; Point{12}; Point{13}; Point{14}; Point{15}; Point{16}; Point{17}; Point{18}; Point{19}; Point{20}; Point{21}; Point{22}; Point{23}; Point{24}; Point{25}; Point{26}; Point{27}; Point{28}; Point{29}; Point{30}; Point{31}; Point{32}; Point{33}; Point{34};}

Coherence;
BSpline(1) = {18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18};
Line Loop(2) = {1};
Plane Surface(3) = {2};

Rotate {{0, 0, 1}, {0, 0, 0}, 2*Pi/3} {Duplicata { Surface{3}; }}
Rotate {{0, 0, 1}, {0, 0, 0}, 4*Pi/3} {Duplicata { Surface{3}; }}
Delete {Surface{3, 4, 5};}

//Criando zona de rotação
Point(100) = { 0         ,  0           , 0, 1.0};        //Centro
Point(101) = { r_d + 0.1 ,  0           , 0, 1.0};
Point(102) = { 0         ,  r_d + 0.1   , 0, 1.0};
Point(103) = {-r_d - 0.1 ,  0           , 0, 1.0};
Point(104) = { 0         , -r_d - 0.1   , 0, 1.0};

Circle(4) = {104, 100, 102};
Circle(5) = {102, 100, 104};

Circle(6) = {101, 100, 103};
Circle(7) = {103, 100, 101};

//Criando Domínio
Point(105) = {-10*D_d   ,  7.5*D_d, 0, 1.0};
Point(106) = {-10*D_d   , -7.5*D_d, 0, 1.0};
Point(107) = { 25*D_d   ,  7.5*D_d, 0, 1.0};
Point(108) = { 25*D_d   , -7.5*D_d, 0, 1.0};

Line(16) = {105, 107};
Line(17) = {107, 108};
Line(18) = {108, 106};
Line(19) = {106, 105}; 

Line Loop(12) = {4, 5};             //Zona de Rotação
Line Loop(13) = {2};                //Pá da Darreius         
Line Loop(14) = {3};                //Pá da Darreius
Line loop(15) = {1};                //Pá da Darreius
Line Loop(24) = {6, 7};             //Zona de Rotação 2
Line Loop(25) = {16, 17, 18, 19};   //Quadrado do domínio

Plane Surface(9) = {15, 12, 13, 14};                //Pás
Plane Surface(10) = {24, 25};                       //Domínio
//-------------------------------//

//-----Refinamento-----//
Transfinite Line {1, 2, 3} = 150 Using Progression 1; //Darreius
Transfinite Line {8, 9, 10, 11} = 200 Using Progression 1; //Circulo externo
Transfinite Line {4, 5, 6, 7} = 200 Using Progression 1; //Circulo de Rotação
Transfinite Line {19, 17} = 200 Using Progression 1; //inlet e outlet
Transfinite Line {16, 18} = 300 Using Progression 1; //symmetry
//---------------------//

//-----Physical Grups-----//
Physical Line("CircRot") = {4, 5};
Physical Line("CircExt") = {6, 7};
Physical Line("PasDarreius") = {1, 2, 3};
Physical Line("symmetry") = {16, 18};
Physical Line("Inlet") = {19};
Physical Line("Outlet") = {17};

Physical Surface("Rot") = {9};
Physical Surface("Ext") = {10};
//-------------------------//