function [] = bewege2(i,a,b,c,X)
%BEWEGE2 Summary of this function goes here
%   Detailed explanation goes here

if(i>0)
bewege2(i-1,a,c,b,X);
X(i,c) = X(n,a);
X(n,a)=0;
n=n+1;
disp(X);
bewege2(i-1,b,a,c,X);
end
end

