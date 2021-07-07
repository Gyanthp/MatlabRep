clc
close
clear
wp = zeros(1,100);
wp(1) = 0.2 ;
for i =1:100
   wp(i+1) = cos(4*wp(i))+ wp(i) - exp(-1/wp(i)); 
end
disp(wp(end));
plot(wp);