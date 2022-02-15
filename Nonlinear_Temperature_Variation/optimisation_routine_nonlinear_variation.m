clear all
close all
clear
clc
 
LB = [0 -inf -inf -inf -inf]; % Lower bounds on optimisation [a0 a1 a2 a3 a4]
UB = [inf inf inf inf inf]; % Upper bounds on optimisation [a0 a1 a2 a3 a4]
X0 = [397.8018 -86.1851 92.4632 -48.3656 9.3463]; % Initial guesses for optimisation [a0 a1 a2 a3 a4]
A = [-1 -2 -4 -8 -16]; % Inequality constraints
B = [0]; % Inequality constraints
Aeq = []; % Equality constraints
Beq = []; % Equality constraints
OPTIONS = []; % Optimisation options
X = fmincon(@(x)optimisation(x),...,
    X0,...,
    A, B,...,
    Aeq, Beq,...,
    LB, UB,...,
    @nonlincon,...,
    OPTIONS); % Optimisation algorithm
 
length = 0:0.01:2; % Length of PFR
 
T = X(1) + X(2)*length + (X(3)*length.^2) + (X(4)*length.^3) + (X(5)*length.^4); % Non-linear temperature profile
 
figure
 
plot(length, T) % Plots the temperature profile along the PFR
xlabel('Length along PFR (m)') % x axis label
ylabel('Temperature (K)') % y axis label