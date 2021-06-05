function[desc1,desc2] = two_points_crossover_Raven()

pred1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
pred2 = [19,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1];
desc1 = zeros(1,18);
desc2 = zeros(1,18);
cro_one = zeros(1,12);
cro_two = zeros(1,12);
temporal_chromosome = zeros(2,6);
rni = randi([1,12]);
rne = rni+6;
rna = 18-rne;
%disp(rni)
for i = 1:6
    temporal_chromosome(1,i) = pred1(rni+i);
    temporal_chromosome(2,i) = pred2(rni+i);
    
end
for j = 1:rni
    cro_one(j) = pred1(j);
    cro_two(j) = pred2(j);
end    

for k = 1:rna
    cro_one(rni+k) = pred1(rne+k);
    cro_two(rni+k) = pred2(rne+k);
end

    
rni = randi([1,12]);
rne = rni+6;
rna = 18-rne;

for ii = 1:6
    desc1(rni+ii) = temporal_chromosome(2,ii);
    desc2(rni+ii) = temporal_chromosome(1,ii);
end

for jj = 1:rni

end