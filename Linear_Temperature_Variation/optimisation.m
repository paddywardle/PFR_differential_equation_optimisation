function [obj] = optimisation(x) % ODE solver function where objective function is determined
 
Lspan = [0 2]; % length of PFR
 
C0 = [700 0 0]; % Initial concentrations [Ca Cb Cc] (mol m^-3)
 
[L, C] = ode15s(@(L, C)differential_function(L,C,x), Lspan, C0); % ODE solver
 
obj = -C(end, 2); % Objective function, negative so that local maxima for Cb is found
 
plot(L, C(:,1), L, C(:,2), L, C(:,3)) % plotting concentration profiles along the length of the PFR
legend('Ca', 'Cb', 'Cc') % Graph legend
xlabel('Length along PFR (m)') % x axis label
ylabel('Concentration (mol m^-3)') % y axis label
 
end
