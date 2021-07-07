clc
close all
clear
%% Aufgabe 1 ........... M = f(phi)
M = [0.188224 0.209138 0.230052 0.250965 0.313707]';
phi = [0.698132 0.959931 1.134464 1.570796 1.919862]';
figure(1),plot(phi,M,'ro'),hold, grid ,xlabel("phi-->"),ylabel("M-->"); 
%% modellbildung Y =  a1 X + a0 ---- AX = B , X = unknown
X = zeros(length(M),2);
X(:,1) = 1;
X(:,2) = phi;
K = X\M;

f = @(t) K(2)*t + K(1);
reg = f(phi);
plot(phi,reg);
