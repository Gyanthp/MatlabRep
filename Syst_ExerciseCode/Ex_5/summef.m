function [output] = summef(input)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% sum of first n natural numbers using flac rekursion realisierung
output=0;
if(input==0)
    output=0;
else
    for i=input:-1:1
        output=i+output;
    end
end

end

