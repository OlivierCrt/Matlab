clear all;

m = 15
%pour r = 1/200
r = 1
KR = 0.3; 
Beff = 1/80; 
Jm = 1/100; 
Jeff = Jm + (r^2)*m
e = 1/2; 

K = (4*Jeff)/((e.^2)*(KR))

Kd = ((4*Jeff)/(1/2) - Beff)/KR

Ti = 1


q2min =0.5;
q2max =1;
Dmin =[ m*q2min^2 0; 0 m ]
Dmax =[ m*q2max^2 0; 0 m ]

Jeff1min = Jm+r*Dmin(1 ,1)
Jeff1max = Jm+r*Dmax(1 ,1)
Jeff2min = Jm+r*Dmin(2 ,2)
Jeff2max = Jm+r*Dmax(2 ,2)