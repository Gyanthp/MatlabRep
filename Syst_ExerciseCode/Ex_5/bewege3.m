function [] = bewege3(i,a,b,c)
%BEWEGE3 Summary of this function goes here
%   Detailed explanation goes here
global count;
if(i>0)
    bewege3(i-1,a,c,b);
    count= count+1;
    bewege3(i-1,b,a,c);
 
end

