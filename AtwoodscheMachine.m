%Scripts for solving the pulley Problem using ode's
%Author Gyan Thapa, Frankfurt University of applied Sciences
% Date: 24.06.2021

%% Clearing the workspace memory and figure window
clearvars
clc
close all

%% Constants
l = 8;  % seillänge in m
% länge, nur bei den die bewegung stattfindet
ll = 7.0575; % 8-0.5-pi*r

%% Ode solver
tspan = 0:0.01:10;
y0 = [0.5;0];
[t,y] = ode23(@dgl,tspan,y0);

%% Data preparation for the plot
z = y(:,1);
ind = z>=ll;
z(ind) = ll;

v = y(:,2);
v(ind) = 0;


%% Plot the result
subplot(2,1,1),plot(t,z), title("t vs distance");
subplot(2,1,2),plot(t,v), title("t vs velocity");


function dydt = dgl(~,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dydt= zeros(2,1);
 
    m1 = 2.1;
    m2 = 2;
    g = 9.8;
    
    dydt(1) = y(2);
    dydt(2) = (g*(m1-m2))/(m1+m2);
end





