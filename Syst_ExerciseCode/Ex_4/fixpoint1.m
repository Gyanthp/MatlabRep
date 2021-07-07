clc
close all
clear
x(1) = 0.5;
for i = 1:20
    x(i+1) = sqrt(sin(x(i)));
end
fprintf("Value of x = %g",x(end));
plot(x),grid on ; 
