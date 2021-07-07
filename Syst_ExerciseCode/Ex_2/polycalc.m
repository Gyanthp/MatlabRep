function y = polycalc(poly,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n = length(poly);
y = 0;
for i = 1:n
    p = poly(i) * x.^(i-1);
    y = y + p ;
    
end
end

