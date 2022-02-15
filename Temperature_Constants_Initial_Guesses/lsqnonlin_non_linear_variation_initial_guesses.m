%% lsqnonlin was used in conjuction with constant temperature data to get the most robust initial guess for the nonlinear temperature variation constants

clear all;
close all;
clear
clc
 
global z T % Global variables
 
%% Data for optimiser - Gained from varying length in constant temperature part
 
z = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0];
T = [390.99, 382.96, 378.34, 375.10, 372.61, 370.58, 368.88, 367.42, 366.13,  364.98, 363.94, 363.00, 362.13, 361.34, 360.59, 359.90, 359.25, 358.64, 358.06, 357.51];
 
x0 = [357.51,0,0,0,0]; % lsqnonlin initial guesses
 
options = optimoptions('lsqnonlin','Display','iter'); % lsqnonlin options
 
x = lsqnonlin(@nonlin_cost_function,...,
              x0,...,
              [],...,
              [],...,
              options); % lsqnonlin optimiser - minimises the cost function
 
T_est = x(1) + x(2) * z + x(3) * z.^2 + x(4) * z.^3 + x(5) * z.^4; % Calculate the model estimate
          
%% plot the data and the model prediction
 
%% Plot the actual data
 
plot(z, T,'bo',...,
    'LineWidth',2, 'MarkerSize', 4)
 
%% Plot the model estimate of data
 
hold
 
plot(z, T_est,'b',...,
    'LineWidth',2, 'MarkerSize', 4)
 
grid;
 
xlabel('z',...
      'FontName', 'AvantGarde', ...
      'FontSize', 12);
 
ylabel('T', ...
      'FontName', 'AvantGarde', ...
      'FontSize', 12); 
 
ax = gca; % current axes
 
    ax.FontName = 'Helvetica';
 
    ax.Box = 'off';
 
    ax.TickDir = 'out';
 
    ax.TickLength = [.02 .02];
 
    ax.XMinorTick = 'on';
    
    ax.YMinorTick = 'on';
    
    ax.XColor = 'k';
    
%% Cost function 
function [error_1] = nonlin_cost_function(x)
 
global z T
 
error_1 = (x(1) + x(2) * z + x(3) * z.^2 + x(4) * z.^3 + x(5) * z.^4) - T; % Works out the difference between the model prediction and the actual value
 
end
