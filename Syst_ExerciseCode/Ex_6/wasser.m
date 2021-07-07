clc
close all
clear
cp = 4183 ; % in J/kg/K
delta_T = 100-22; % in Kelvin
m = 0.8; % in kg
P = 1200 ; % Watt
%% Wärmemenge, Q = ?
delta_Q = m*cp*delta_T; % in Joule
fprintf("Wärmemenge = %.2f Joule\n",delta_Q);

%% Benötigte Aufheizzeit
t = delta_Q / P ; %% in sec
fprintf("Aufheizzeit = %.4f s\n",t);

%% Aufgabe 2
temp = [22 42 52 82 100]; 
Cp = [4181 4179 4186 4199 4217]; 
figure(1), plot(temp,Cp,'o'),xlabel("Temp °C-->"),ylabel("Cp J/Kg/K-->"),...
    title("Spezifische Wärme von Wasser"),grid,hold;

%% Linear interpolation
x = [temp(3), temp(4)];
y = [Cp(3),Cp(4)];
koeff = polyfit(x,y,1);
xx = temp(3):0.1:temp(4); %% x zwischen benachbarten Punkt von 61°c
yy = polyval(koeff,xx); %% Interpolierte Werte
plot(xx,yy,'g');
%% Cp für 61°C
cp_61 = polyval(koeff,61);  %% Cp bei 61°C
plot(61,cp_61,'g*');

%% Wärmemenge und Aufheizzeit bei Cp = 61 J/kg/K
delta_Q61 =m*cp_61*delta_T;
Theiz_61 = delta_Q61 / P;

%% Quadratische Interpolation 3 nachbar punkte
koeff_2 = polyfit([42 52 82],[4179 4186 4199],2);
xxx = temp(2):0.1:temp(4);
yyy = polyval(koeff_2,xxx);
plot(xxx,yyy,'r--');
cpp_61 = polyval(koeff_2,61);
plot(61,cpp_61,'r*');

%% Wärmemenge und Aufheizzeit bei Cp = 61 J/kg/K Quadratisches Interpolation
delta_Q61_2 =m*cpp_61*delta_T;
Theiz_61_2 = delta_Q61_2 / P;




