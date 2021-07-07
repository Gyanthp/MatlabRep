clc
close all
clear
w=2;
a=0.5;
b=0.75;
sim('Modelll_1');
y=simout.signals.values(:,1);
x=simout1.signals.values(:,1);
plot(x,y,'Linewidth',2),grid on,xlabel("x-->"),ylabel("y-->");
