
k = 0;
x = 0;
for i=1:length(allowed)
    for j= 1: length(b_value)
        if (abs(b_value(j))==allowed(i))
            k = k+1 ;
            x(k) = b_value(j);
           
        end
    end
end
