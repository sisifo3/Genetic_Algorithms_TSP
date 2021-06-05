function[fitness,anser,emigrate]  = society_Raven(g,celda_num,migration,immigrate,rnd)

close all;
clc;
emigrate = immigrate;

dista_pid = csvread('dist_wR.csv');

%we will chake the value of migration
if migration(1) == 1
    %rnd = randi([1,100]);
    emigrate = celda_num{rnd,1};
    celda_num{rnd,1} = immigrate;
    disp('migration raven')
    disp(rnd)

end


%this will be the migration best/worst
if migration(1,2) == 1
    emigrate =celda_num{1,1};
    celda_num{100,1} = immigrate;
    disp('migration bw')
%else
    %emigrate = immigrate;
end



if g < 2 

    number_of_solution = 100;
    sol = number_of_solution;

    celda_num = zeros(sol,3);
    celda_num = num2cell(celda_num);

    cell_num = zeros(sol*2,3);
    cell_num = num2cell(cell_num);

    mid_sol = sol/2;
    generations = 1;

    it_gen = zeros(1,generations);
    sum_aptd = zeros(1,generations);

    best_solution_per_generation = zeros(generations,3);
    best_solution_per_generation = num2cell(best_solution_per_generation);

    bes_ind_pmx = zeros(1,generations);
    wor_ind_pmx = zeros(1,generations);


    for i = 1:sol
        arr_temp =  randperm(18,18);
        celda_num{i,1} = arr_temp;
        cell_num{i,1} = arr_temp;
    end

    [celda_num] = make_dist_apt(celda_num,dista_pid);
else
    generations = 1;
    sol = 100;
    mid_sol = 50;
    cell_num = zeros(200,3);
    cell_num = num2cell(cell_num);
    
    for i = 1:100
       cell_num{i,1} = celda_num{i,1};
    end
    
    
end

%After the first generation.
number_of_solution = 100;
sol = number_of_solution;
mid_sol = sol/2;
generations =1;
    
for iter = 1:generations
    for rip = 1:mid_sol
        [pred1,pred2] = sel_pad_best_Raven(celda_num);
        [desc1,desc2] = method_crossover_CSEC_Raven(pred1,pred2,dista_pid);
        %[desc1,desc2] = order_crossover_Davids(pred1,pred2);
        %[desc1,desc2] = crossover_PMx_18(pred1,pred2);
        
        cell_num{rip+sol,1} = desc1;
        cell_num{rip+mid_sol*3,1} = desc2;
    end
    
    [cell_num] = make_dist_apt(cell_num,dista_pid);
    [cell_num] = biology_competition(cell_num,dista_pid);
    
    b = mod(g,100);
    if b == 0
        disp('heuristic')
        [cell_num] = heuristic_mutation(cell_num,dista_pid);
    end
         
    [sum_apt] = apt_for_gene(cell_num);
    sum_aptd(iter) =  sum_apt;
    it_gen(iter) =  iter;
    
    best_solution_per_generation(iter,:) = cell_num(1,:);
    bes_ind_pmx(iter) = cell_num{1,3}; 
    wor_ind_pmx(iter) = cell_num{100,3};
    
    
    %disp(iter)
    celda_num = cell_num;
end
%[apt_david,bes_ind,wos_ind] = cangrejo_david();



%disp(best_solution_per_generation)
%[wx] = learn_to_plot(it_gen,apt_david,sum_aptd);
%[wz] = learn_to_plot_bestind(it_gen,bes_ind,bes_ind_pmx);

fitness = sum_apt;
anser = cell_num;
%disp(wx)
%disp(wz)







%{
           %%
        %     %%
%%%%%%%    @    %%
%-------          %% 
% %%%%
      %
        %%
            %
             

%}






end