function [padre1,padre2] =  sel_pad_best_fox(Ce_cmp)    
%global selection_metodo 
padre1 = zeros(1,18);
padre2 = zeros(1,18);
for rl = 1:2
    if rl ==1
       %[index] = my_own_RWS_best(Ce_cmp);
       [index] = selection_method_SUS_fox(Ce_cmp);
       %disp(index)
       padre1 = Ce_cmp{index,1};
    end
    if rl ==2
        %[index] = my_own_RWS_best(Ce_cmp);
        [index] = selection_method_SUS_fox(Ce_cmp);
        %disp(index)
        padre2 = Ce_cmp{index,1};
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
