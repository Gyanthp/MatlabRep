function [output] = summe(input)
%SUMME Summary of this function goes here
% Summe n natürlichen Zahlen durch rekursion wobei n>=0 ist
fprintf('call : summe(%d)\n',input);
if(input==0)
    output=0;
else
output= summe(input-1)+input;
end
fprintf('output : summe(%d)= %d\n',input,output);
end


