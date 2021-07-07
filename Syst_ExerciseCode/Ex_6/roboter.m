clc
close all
clear

%% Aufgabe 1
Xpos = [2, 4.5, 5.25, 7.81, 9.2, 10.6];
Ypos =[7.2, 7.1, 6, 5, 3.5, 5];
plot(Xpos,Ypos,'bo'),xlabel("x-->"),ylabel("y-->"),grid,hold;

dx = 0.1;
Xpoints = Xpos(1):dx:Xpos(end);
%% Interpolation durch Polynom 5. grades
polykoeff = polyfit(Xpos,Ypos,5);
Ypoint=polyval(polykoeff,Xpoints);
plot(Xpoints,Ypoint,'r--');

%% Lineare Spline Interpolation
Ylin = interp1(Xpos,Ypos,Xpoints,'linear');
plot(Xpoints,Ylin,'b');

%% Kubishe Spline Interpolation
Ykub = interp1(Xpos,Ypos,Xpoints,'PCHIP');
plot(Xpoints,Ykub,'g--');

%% MYspline 
ymy = mySpline(Xpos,Ypos,Xpoints);
plot(Xpoints,ymy,'g'),legend('coordinates','polynom 5.grad','linear','cubic','mySpline');









