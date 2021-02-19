function CountsMat = CountsMat_generation(data1,data2,le)

num_fea_states1 = le;% unique returns the unique value by increasing orders
num_fea_states2 = le;% numel returns the number of elements

CountsMat = zeros(num_fea_states1,num_fea_states2);

for i=1:numel(data1)
    CountsMat(data1(i),data2(i)) = ...
        CountsMat(data1(i),data2(i)) + 1;
end

end