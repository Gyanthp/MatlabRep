%% Finding point of intersection between two lines and the area of the closed 
%  surface

%%
clc
close all
clear

x=linspace(0,10);
fx=2*cos(x*0.8)+4;
gx=0.3*(x-6).^2;
plot(x,fx,x,gx);
legend('fx','gx');
ind=find(abs(fx-gx)<0.1);
lim=[33 97];
p=(fx(33:97)-gx(33:97))+gx(33:97);
hold on;
plot(x(lim(1)),fx(lim(1)),'*',x(lim(2)),fx(lim(2)),'*');
hold on;
bar(x(33:97),p);
pint=polyint(p);
area=diff(polyval(p,lim));