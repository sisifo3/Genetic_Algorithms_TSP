function[index] = selection_method_SUS_fox(cell)
%Stochastic Universal Sampling

len = length(cell);
n = len;
f_i = zeros(len,1);

for i = 1:len
    f_i(i) = cell{i,3};
end    
f_i = f_i *1000;
mean_fi = (1/n)*(sum(f_i));
a = rand();
sum_fi = f_i(1);    
delta = a * mean_fi;
j = 0;

while j<n
    if delta < sum_fi
        index = j;
        delta = delta + sum_fi;
        
    else
        j = j+1;
        sum_fi = sum_fi + f_i(j); 
        
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