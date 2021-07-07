clc
clear
close
syms s ;
f = exp(-1/s)-cos(4*s);
ff = diff(f);          
wp(1) = 0.2;
while 1
    wp(end+1) = wp(end) - (exp(-1/wp(end))-cos(4*wp(end)) )/(4*sin(4*wp(end)) + exp(-1/wp(end))/wp(end)^2);
    if ( abs(wp(end)-wp(end-1)) <= 10^-7 )
        break
    end

end
plot(wp),grid on;
disp(wp(end));
