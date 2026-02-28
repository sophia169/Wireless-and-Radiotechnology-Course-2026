clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');

pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

theta = (tmin:tmax) * pi/180;   % radians
phi   = (pmin:pmax) * pi/180;   % radians

dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

[THETA,PHI] = meshgrid(theta,phi);  % meshgrid

x = input('The field pattern : E(THETA,PHI)=','s');  % e.g., cos(THETA)
x = eval(x);

v = input('The power pattern: P(THETA,PHI)=','s');   % e.g., cos(THETA).^2
Pn = eval(v);                                        % normalized power pattern

% Beam solid angle (beam area), numerical integration over sphere region
Prad = sum(sum( Pn .* sin(THETA) )) * dth * dph;

fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta =%2.0f',tmin);
fprintf(' : %2.0f',dth*180/pi);
fprintf(' : %2.0f',tmax);
fprintf('\n Phi =%2.0f',pmin);
fprintf(' : %2.0f',dph*180/pi);
fprintf(' : %2.0f',pmax);
fprintf('\n POWER PATTERN : %s',v);

fprintf('\n \n Output Parameters: \n-------------------- ');
fprintf('\n BEAM AREA (steradians)=%3.2f\n',Prad);