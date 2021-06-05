function[index] = selection_method_LRS_Raven(cell)

%Linear Rank Selection

len = length(cell);
pi = zeros(1,len);

for j = 1:len
    pi(j) = j/(100 *(100-1));
end

pi = pi*10;
v = 1/(100-2.001);
v = v* (10.^4);
v = fix(v);
a = randi([0,v]);
a = a/(10.^3);
%disp(a)
for l = 1:100
    if pi(l) >= a
        index = l;
        %disp('done')
        %disp(index)
        break;
    else
        index =100;
    end
end

end