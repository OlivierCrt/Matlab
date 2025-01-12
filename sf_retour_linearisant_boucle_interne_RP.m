function [sys,x0,str,ts] = sf_retour_linearisant_boucle_interne_RP(t,x,u,flag)
% NE PAS MODIFIER CI-DESSOUS ; CF. SEULEMENT mdlOutputs PLUS BAS
%
switch flag,
  case 0,
    [sys,x0,str,ts] = mdlInitializeSizes;
  case 3,
    sys = mdlOutputs(t,x,u);
  case {1,2,4,9}
    sys = [];
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
%=============================================================================
function [sys,x0,str,ts] = mdlInitializeSizes
% NE PAS MODIFIER CI-DESSOUS ; CF. SEULEMENT mdlOutputs PLUS BAS
%
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;               % [v1;v2]
sizes.NumInputs      = 6;               % [e1;e2;q1;q2;dq1;dq2]
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];                           % période héritée du bloc père
%=============================================================================
function sys = mdlOutputs(t,x,u)
%
e1 = u(1); e2 = u(2);
q1 = u(3); q2 = u(4); dq1 = u(5); dq2 = u(6);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% À COMPLÉTER À PARTIR D'ICI %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sys DOIT ÊTRE INTIALISÉ AVEC LE CONTENU DU VECTEUR DE SORTIE DU BLOC
% e.g. 
g = -9.81;
m = 15
r = 1
KR = 0.3; 
Beff = 1/80; 
Jm = 1/100; 
Jeff = Jm + (r^2)*m
e = 1/2; 

K = (4*Jeff)/((e.^2)*(KR))

Kd = ((4*Jeff)/(1/2) - Beff)/KR

Ti = 0.8
d1 = 2* m * q2 * dq1 * dq2 - m * q2 * g * cos ( q1 ) ;
d2 = -m * q2 * dq1 * dq1 - m * g * sin ( q1 ) ;
s1 = e1 / r * Jeff / KR + dq1 / r * Beff / KR + r * d1 / KR ;
s2 = e2 / r * Jeff / KR + dq2 / r * Beff / KR + r * d2 / KR ;
sys = [ s1 ; s2 ];
%=============================================================================
