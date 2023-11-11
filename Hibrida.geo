// Gmsh project created on Sun Oct 29 20:50:04 2023
SetFactory("OpenCASCADE");



//Parâmetros de Projeto
AR = 0.1;                   //Corresponde a razão de aspecto da Darreius (H/Dd)
OR = 0.1;                   //Corresponde a sobreposição das pás da turbina savonius (s/c_s)
RR  = 0.4;                  //Razão entre os raios da Savonius e da darreius (r_d/c_s)
gama = 00*(Pi/180);         //"Fase" entre os rotores

//Darreius 
r_d = 0.4;                  //Raio da Turbina Darreius (m)
c_d = 0.2;                  //Corda da Pá da Darreius (m)
n_d = 3;                    //Número de Pás
D_d = r_d*2;                //Diâmetro da Turbina Darreius (m)
SR  = (n_d*c_d)/(2*r_d);    //Corresponde a razão de solidez 

//Savonius
c_s = r_d*RR;               //Raio da Turbina Savonius (m)             
esp = 0.001;                //Espessura da pá (m)
s = c_s*OR;                 //Sobreposição da Pás (m)
H   = D_d*AR;               //Altura dos rotores
fi  = 0*(Pi/180);           //Ângulo de retorno da pá da savonius
ea = 0.005;                 //Espessura da Alma da Malha

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

//-------------Savonius-------------//

//Pás da Savonius - Point(3XX) Elementos(4XX)

//Pás parte interna
Point(300) = {0         , c_s / 2 - s   , 0, 1.0};
Point(301) = {0         , c_s     - s   , 0, 1.0};
Point(302) = {0         , 0       - s   , 0, 1.0};

Point(310) = {0         , -c_s / 2 + s  , 0, 1.0};
Point(311) = {0         , -c_s     + s  , 0, 1.0};
Point(312) = {0         , 0        + s  , 0, 1.0};

Circle(400) = {302, 300, 301};
Circle(401) = {312, 310, 311};

//Pás parte externa
Point(303) = {0             , c_s     - s + esp , 0, 1.0};
Point(304) = {0             , 0       - s - esp , 0, 1.0};

Point(313) = {0             , -c_s     + s - esp, 0, 1.0};
Point(314) = {0             , 0        + s + esp, 0, 1.0};

Circle(402) = {304, 300, 303};
Circle(403) = {314, 310, 313};

//Pontas da Savonius
Point(315) = {0             , c_s     - s + esp/2, 0, 1.0};
Point(316) = {0             , 0       - s - esp/2, 0, 1.0};
Point(317) = {0             , -c_s    + s - esp/2, 0, 1.0};
Point(318) = {0             , 0       + s + esp/2, 0, 1.0};

Circle(404) = {303, 315, 301};
Circle(405) = {302, 316, 304};
Circle(406) = {313, 317, 311};
Circle(407) = {312, 318, 314};

//Alma da Savonius - Point(2XX) Elementos(5XX)//

//Pontos das Pás parte interna 
Point(201) = {0             , c_s     - s - ea  , 0, 1.0};
Point(202) = {0             , 0       - s + ea  , 0, 1.0};

Point(204) = {0             , -c_s     + s + ea , 0, 1.0};
Point(205) = {0             , 0        + s - ea , 0, 1.0};

//Curvas Internas da Alma
Circle(500) = {202, 300, 201};
Circle(502) = {205, 310, 204};

//Pontos da pá externa
Point(207) = {0                 , c_s     - s + esp + ea, 0, 1.0};
Point(208) = {0                 , 0       - s - esp - ea, 0, 1.0};

Point(210) = {0                  , -c_s     + s - esp - ea, 0, 1.0};
Point(211) = {0                  , 0        + s + esp + ea, 0, 1.0};

Circle(504) = {208, 300, 207};
Circle(506) = {211, 310, 210};

//Pontas da alma
Circle(508) = {202, 316, 208};
Circle(509) = {207, 315, 201};

Circle(510) = {205, 318, 211};
Circle(511) = {210, 317, 204};

Line(512) = {304, 208};
Line(513) = {202, 302};
Line(514) = {301, 201};
Line(515) = {207, 303};


Line(516) = {312, 205};
Line(517) = {211, 314};
Line(518) = {204, 311};
Line(519) = {313, 210};
//---------------------------------//

//-----Rotacionando a Savonius-----//
Rotate {{0, 0, 1}, {0, 0, 0}, gama} {
    Curve{400, 402, 404, 405};
    Curve{401, 403, 407, 406}; 
    Curve{511, 502, 506, 510};
    Curve{508, 500, 504, 509};
    Point{315, 300, 318, 317, 310, 316};
    Line{512, 513, 514, 515, 516, 517, 518, 519};
}
//---------------------------------//

//-----Definindo Superfícies-----//
//Alma1 - Externa
Line Loop(30) = {504, -512, -402, 515};
Plane Surface(1) = {30};
//Alma2 - Externa
Line Loop(50) = {403, 517, -506, -519};
Plane Surface(2) = {50};
//Alma3 - Interna
Line Loop(32) = {400, 513, -500, -514};
Plane Surface(3) = {32};
//Alma4 - Interna
Line Loop(33) = {401, 516, -502, -518};
Plane Surface(4) = {33};
//Alma5 - Ponta
Line Loop(34) = {509, -515, -404, 514};
Plane Surface(5) = {34};
//Alma6 - Ponta
Line Loop(35) = {508, -513, -405, 512};
Plane Surface(6) = {35};
//Alma7 - Ponta
Line Loop(36) = {510, -516, -407, 517};
Plane Surface(7) = {36};
//Alma8 - Ponta
Line Loop(37) = {511, -519, -406, 518};
Plane Surface(8) = {37};

//Savonius
Line Loop(38) = {400, -405, -402, -404};
Line Loop(39) = {406, 403, 407, -401};
Line Loop(40) = {500, -508, -504, -509};
Line Loop(41) = {502, -510, -506, -511};

Plane Surface(9) = {15, 12, 13, 14, 38, 39, 40, 41};    //Pás
Plane Surface(10) = {24, 25};                           //Domínio
//-------------------------------//

//-----Refinamento-----//
//Savonius
Transfinite Line {517, 515, 513, 518} = 30 Using Progression 0.9; //Ponta da Pá - Linhas da Alma
Transfinite Line {514, 512, 516, 519} = 30 Using Progression 1.1; //Ponta da Pá - Linhas da Alma
Transfinite Line {407, 405, 404, 406} = 5 Using Progression 1; //Pontas
Transfinite Line {509, 508, 510, 511} = 45 Using Progression 1; //Pontas da Alma
Transfinite Line {500, 504, 502, 506} = 400 Using Progression 1; //Alma
Transfinite Line {400, 402, 401, 403} = 400 Using Progression 1; //Pás

Transfinite Surface {1} Right; //Surface da Alma Externa
Transfinite Surface {2} Right; //Surface da Alma Externa
Transfinite Surface {3}; //Surface da Alma Interna
Transfinite Surface {4}; //Surface da Alma Interna
Recombine Surface {1, 2, 3, 4};

Transfinite Line {1, 2, 3} = 150 Using Progression 1; //Darreius
Transfinite Line {8, 9, 10, 11} = 200 Using Progression 1; //Circulo externo
Transfinite Line {4, 5, 6, 7} = 200 Using Progression 1; //Circulo de Rotação
Transfinite Line {19, 17} = 200 Using Progression 1; //inlet e outlet
Transfinite Line {16, 18} = 300 Using Progression 1; //symmetry
//---------------------//

//-----Physical Grups-----//
Physical Line("CircRot") = {4, 5};
Physical Line("CircExt") = {6, 7};
Physical Line("Rotores") = {1, 2, 3, 400, 402, 401, 403, 407, 405, 404, 406};
Physical Line("symmetry") = {16, 18};
Physical Line("Inlet") = {19};
Physical Line("Outlet") = {17};

Physical Surface("Rot") = {9};
Physical Surface("Ext") = {10};
//-------------------------//