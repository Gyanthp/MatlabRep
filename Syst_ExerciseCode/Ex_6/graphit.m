clc
close all
clear

cp = 709 ; % in J/kg/K
delta_t = 678; % in Kelvin
m = 1; % in Kg

%% Benötigte Wärmemenge
delta_Q = m*cp*delta_t;
fprintf("Wärmemenge = %f\n",delta_Q);

%% Aufgabe 4 cp mit interpolierten Werte
temp  = [-73 127 327 527 727];
Cp =[420 1070 1370 1620 1820];

plot(temp,Cp,'bo'),xlabel("T in °C-->"),ylabel("Cp in J/Kg/K-->"),title("Graphite"),grid ,hold;

%% Cp durch Interpolation zweier Benachbarten Punkte
%% Linear interpolation
koeff_1 = polyfit([327,527],[1370 1620],1);
x_inter = 327:0.1:527;
y_inter = polyval(koeff_1,x_inter);
plot(x_inter,y_inter,'g');   %% Interpoliertes Wert zwischen 327 und 527
%% Cp bei 361 °C
Cp_361 = polyval(koeff_1,361);
plot(361,Cp_361,'g*');

%% Wärmemenge und Heizzeit bei Cp = 361 J/Kg/K
delta_Q_361 = m*delta_t*Cp_361;
fprintf("Wärmemenge bei 361 J/kg/K = %f\n",delta_Q_361);
%% Quadratischer Interpolation
koeff_2 = polyfit([127 327 527 ],[1070 1370 1620],2);
xx_inter2 = 127:0.1:527;
yy_inter2 = polyval(koeff_2,xx_inter2);
plot(xx_inter2,yy_inter2,'r--'); %% quadratisches Interpolation
Cp2_361= polyval(koeff_2,361);
plot(361,Cp2_361,'r*');
fprintf("Cp quadratisches Interpolation = %.5f\n",Cp2_361);


%% Aufgabe 5...









