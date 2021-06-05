function [migration,rnd] = migration_grap(generation)
%this funtion will be say when make migration
% the first will be said just for generations
%migration : [random,best/worst] ; 1 for yes, 0 for non;

mgt = mod(generation,20000);
migration = zeros(1,2);
rnd = 0;

if mgt == 0
    migration(1,1) = 1;
    rnd = randi([1,100]);
end    

mgt_bw = mod(generation,30000);

if mgt_bw == 0 
    migration(1,2) = 1;
end    


end