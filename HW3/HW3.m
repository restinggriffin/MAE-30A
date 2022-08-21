%% Q2
clear,clc,close all
format compact
syms Tah1 Cy Cz Dy Dz
eqn1 = 250*Tah1*sind(60)==250*400;
Tah = double(solve(eqn1));
Tah = [0 Tah*sind(30) -Tah*cosd(30)];
C = [0 Cy Cz]; D=[0 Dy Dz];
F = [0 -400 0];
eqn2 = cross([-50 125 sqrt(250^2-125^2)],Tah)+cross([300 0 0],D)+cross([350 0 250],F)==0;
eqn3 = Tah+D+C+F==0;
A = solve(eqn2(1),eqn2(2),eqn2(3),eqn3(1),eqn3(2),eqn3(3))
Cy = double(A.Cy)
Cz = double(A.Cz)
Dy = double(A.Dy)
Dz = double(A.Dz)
%% Q3
clear,clc,close all
format compact
syms Tcf Tde Ax Az Max Maz
rac = [80 0 135];
rad = [980 0 90];
CF = [-80 60 0]./sqrt(60^2+80^2);
DE = [0 120 -90]./sqrt(120^2+90^2);
F = [0 -480 0];
eqn1 = cross(rac,F+Tcf*CF)+cross(rad,Tde*DE)+[Max 0 Maz]==0;
eqn2 = [Ax 0 Az]+F+Tcf*CF+Tde*DE==0;
B = solve(eqn1(1),eqn1(2),eqn1(3),eqn2(1),eqn2(2),eqn2(3))
Tcf = double(B.Tcf)
Tde = double(B.Tde)
Ax = double(B.Ax)
Az = double(B.Az)
Max = double(B.Max)
Maz = double(B.Maz)
%% Q4
clear,clc,close all
format compact
syms Ax Ay Az Bx Tcg
roa = [600 0 0];
rog = [300 200 75];
rob = [0 400 150];
A = [Ax Ay Az];
B = [Bx 0 0];
W = [0 -10*9.81 0];
ucg = [-300 200 -150]./norm([-300 200 -150]);
eqn1 = cross(roa,A)+cross(rog,W+Tcg.*ucg)+cross(rob,B)==0;
eqn2 = A+B+W+Tcg.*ucg==0;
S = solve(eqn1(1),eqn1(2),eqn1(3),eqn2(1),eqn2(2),eqn2(3));
Ax = double(S.Ax)
Ay = double(S.Ay)
Az = double(S.Az)
Bx = double(S.Bx)
Tcg = double(S.Tcg)