clear all
close all
clear
clc

LB = [0]; % lower bound on temperature
UB = [inf]; % upper bound on temperature
X0 = 298; % initial guess for temperature
A = []; % inequality constraints
B = []; % inequality constraints
Aeq = []; % equality constraints
Beq = []; % equality constraints
OPTIONS = []; % Optimisation options
 
X = fmincon(@(x)optimisation(x),...,
    X0,...,
    A, B,...,
    Aeq, Beq,...,
    LB, UB,...,
    @nonlincon,...,
    OPTIONS); % Optimisation algorithm
