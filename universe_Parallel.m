function[a,b,c] = universe_Parallel(~)

%migration rate = 1;
%selection/Replacement of migration
%topology: distributed model.

%[] = migration_grap();
migrator = 0;
migration = zeros(1,2);
index = 0;


ge = 550;

fit_do = zeros(1,ge+1);
fit_fo = zeros(1,ge+1);
fit_Ra = zeros(1,ge+1);

%the first generation
[poblation_do,poblation_fo,poblation_Ra] =  first_generation();

[fitness_do,poblation_do] = society_dolphin(1,poblation_do,migration,migrator,poblation_Ra,index);
[fitness_fo,poblation_fo] = society_fox(1,poblation_fo,migration,migrator,index);
[fitness_Ra,poblation_Ra] = society_Raven(1,poblation_Ra,migration,migrator);

fit_do(1) = fitness_do;
fit_fo(1) = fitness_fo;
fit_Ra(1) = fitness_Ra;
it = 1:ge+1;

for i = 1:ge
   
    
    [migration,index] = migration_grap(i);
    
    
    [fitness_do,poblation_do,migrator] = society_dolphin(i,poblation_do,migration,migrator,poblation_Ra,index);
    [fitness_fo,poblation_fo,migrator] = society_fox(i,poblation_fo,migration,migrator,index);
    [fitness_Ra,poblation_Ra,migrator] = society_Raven(i,poblation_Ra,migration,migrator,index);
    
    fit_do(i+1) = fitness_do;
    fit_fo(i+1) = fitness_fo;
    fit_Ra(i+1) = fitness_Ra;
    
    %it(i) = i; 
end


a = poblation_do{1,1};
b = poblation_fo{1,1};
c = poblation_Ra{1,1};
disp("dolphin")
disp(a)
disp('fox')
disp(b)
disp('Raven')
disp(c)

d = poblation_do{1,2};
e = poblation_fo{1,2};
f = poblation_Ra{1,2};
disp('ditance')
disp(d)
disp(e)
disp(f)

hi = poblation_do{1,3};
hj = poblation_fo{1,3};
hk = poblation_Ra{1,3};
disp('fitness')
disp(hi)
disp(hj)
disp(hk)

figure(1)
plot(it, fit_do)
hold on
plot(it, fit_fo)
plot(it, fit_Ra)
xlabel('Generations')
ylabel('Aptitud')
hold off
grid
legend('dolphin', 'fox', 'Raven', 'Location', 'SW')

end


