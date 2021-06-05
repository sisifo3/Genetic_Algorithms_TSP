function[index] = selection_method_SUS_fox(cell)

%Stochastic Universal Sampling

len = length(cell);
n = len;
f_i = zeros(len,1);

for i = 1:len
    f_i(i) = cell{i,3};
end    
f_i = f_i *1000;
%disp(f_i)
%b = sum(f_i);
%disp(b)
mean_fi = (1/n)*(sum(f_i));
%disp('mean_fi')
%disp(mean_fi)
a = rand();
%disp('a')
%disp(a)
sum_fi = f_i(1);    
%disp('sum_fi')
%disp(sum_fi)
delta = a * mean_fi;
%disp('delta')
%disp(delta)
j = 0;


while j<n
    if delta < sum_fi
        index = j;
        delta = delta + sum_fi;
        %disp('delta')
        %disp(delta)
    else
        j = j+1;
        sum_fi = sum_fi + f_i(j); 
        %disp('sum_fi')
        %disp(sum_fi)
    end
    
end


%{
                  
                  %%%
               %%%|%%
              %%%|%%   
          %%%        %
      %% @>           %
  @%%%%%               %  
   %------              %
    %%%%%%%%%%%%         %  



%}


end