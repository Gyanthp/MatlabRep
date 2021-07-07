clc
clear
x(1)=1;
while 1
    x(end+1) = x(end) - ( atand(x(end))-(exp(-x(end)/2) )  / ...
        ( (1/1+x(end)^2) + (exp(-x(end)/2)/2)) );
    if abs(x(end)-x(end-1))<=10^-7
        break;
    end
end
plot(x);
disp(x);
