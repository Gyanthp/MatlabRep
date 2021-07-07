function [] = bewege( i,a,b,c)
%BEWEGE Summary of this function goes here
%   Detailed explanation goes here
if(i>0)
    bewege(i-1,a,c,b);
    fprintf("Verschiebe oberste Scheibe von Stab %d nach Stab %d\n",a,c);
    bewege(i-1, b,a,c);
 
end
end

