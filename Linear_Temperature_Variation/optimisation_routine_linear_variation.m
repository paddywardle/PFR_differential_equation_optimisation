clear all
close all
clear
clc
 
OPTIONS = [];          
LB = [0 -inf]; % Lower bounds on optimisation [a0 a1]
UB = [inf inf]; % Upper bounds on optimisation [a0 a1]
X0 = [381.9624 -14.1380]; % Initial guesses for optimisation [a0 a1]
A = [-1 -2]; % Inequality constraints
B = [0]; % Inequality constraints
Aeq = []; % Equality constraints
Beq = []; % Equality constraints
X = fmincon(@(x)optimisation(x),...,
    X0,...,
    A, B,...,
    Aeq, Beq,...,
    LB, UB,...,
    @nonlincon,...,
    OPTIONS); % Optimisation algorithm
 
length = 0:0.01:2; % length of PFR
 
T = X(1) + X(2)*length; % Linear equation for temperature profile
 
figure 
 
plot(length, T) % Plots the temperature profie along the PFR
xlabel('Length along PFR (m)') % x axis label
ylabel('Temperature (K)') % y axis label