function[desc1,desc2] = method_crossover_CSEC_Raven()%pred1,pred2)
%CESX
%Complete Subtour Exchange Crossover:
%dista_pid = csvread('dist_wR.csv');


%pred1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
%pred2 = [18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1];

cell = zeros(6,3);
cell = num2cell(cell);

Offsprindg1 = pred1;
Offsprindg2 = pred1;
Offsprindg3 = pred1;
Offsprindg4 = pred2;
Offsprindg5 = pred2;
Offsprindg6 = pred2;

temporal = Offsprindg1(2);
Offsprindg1(2) = Offsprindg1(3);
Offsprindg1(3) = temporal;

temporal = Offsprindg4(2);
Offsprindg4(2) = Offsprindg4(3);
Offsprindg4(3) = temporal;

temporal = Offsprindg2(15);
Offsprindg2(15) = Offsprindg2(16);
Offsprindg2(16) = temporal;

temporal = Offsprindg5(15);
Offsprindg5(15) = Offsprindg5(16);
Offsprindg5(16) = temporal;

temporal = Offsprindg3(2);
Offsprindg3(2) = Offsprindg3(3);
Offsprindg3(3) = temporal;
temporal = Offsprindg3(15);
Offsprindg3(15) = Offsprindg3(16);
Offsprindg3(16) = temporal;

temporal = Offsprindg6(2);
Offsprindg6(2) = Offsprindg6(3);
Offsprindg6(3) = temporal;
temporal = Offsprindg6(15);
Offsprindg6(15) = Offsprindg6(16);
Offsprindg6(16) = temporal;

cell{1,1} =  Offsprindg1;
cell{2,1} =  Offsprindg2;
cell{3,1} =  Offsprindg3;
cell{4,1} =  Offsprindg4;
cell{5,1} =  Offsprindg5;
cell{6,1} =  Offsprindg6;

[cell] = make_dist_apt(cell,dista_pid);
desc1 = cell{1,1};
desc2 = cell{2,1};


end