function [f] = differential_function(L, C, x) % function defining the differential equations
 
Ca = C(1);
Cb = C(2);
Cc = C(3);
 
U = 0.25; % Fluid velocity in the PFR
 
R = 8.31; % Gas constant
 
T = x(1) + x(2)*L; % Linear variation in temperature equation
 
k1 = (1.37*10^10)*exp(-75000/(R*T)); % Reaction 1 rate constant
k2 = (1.19*10^17)*exp(-125000/(R*T)); % Reaction 2 rate constant
 
ra = -k1*Ca; % Reaction rate for species A
rb = k1*Ca - k2*Cb; % Reaction rate for species B
rc = k2*Cb; % Reaction rate for species C
 
dCa = ra/U; % Differential equation for species A
dCb = rb/U; % Differential equation for species B
dCc = rc/U; % Differential equation for species C
 
f = [dCa; dCb; dCc]; % Vector containing all the differential equation to be fed to the ODE solver function
 
end
