clc
close all
clear

%% Aufgabe 2%%
polycalc([2 4 1],2);
polycalc([2 4 1 ],2:5);
polycalc([2 4 1 ],[]);


%% aufgabe 3: polynom darstellung  %%
p =  [0.5, -2, 1, 0.7]  ;
x = -2:0.1:2;
y= polycalc(p,x);
figure(1), grid on,hold on ;
%% Aufgabe 4 %%
syms X ;
f =0.5-2*X+X^2+0.7*X^3 ;
ff = @(X) 0.5-2*X+X.^2+0.7*X.^3 ;
title('f(X) =0.5-2*X+X^2+0.7*X^3');
xlabel('x-->'),ylabel('y-->');
%% Aufgabe 5 %%
plot(-2:0.1:2,y);
nullstellen = roots(fliplr(p));
r_null= real(nullstellen);
disp(r_null);
r = find(r_null>=-2);
rr = r_null(r);
plot(rr,0,'ro')
%% Aufgabe 6 %%
f1 = diff(f,1);
f2 = diff(f,2);
extrema = roots([21/10 2 -2]) ;
disp(extrema);                  %% extrem points
plot(extrema,ff(extrema),'r*'); %% plots minima and maxima
ff2 =@(X) (21*X)/5 + 2 ;


