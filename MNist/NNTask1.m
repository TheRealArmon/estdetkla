
%% NB!!!

%Takes about an hour to run (results are stored in task1_results.mat)
%as it compares distance from every test case to every training case

%Run NNConfMat_Task1.m to plot confusion matrix from the NN classification

%% 
%Loading data
load('data_all.mat');
load('task1_results.mat');

%NN calssification
pred = zeros(10, num_test);
tic
for k = 1:num_test
    d = dist(trainv, testv(k,:).');
    [~, i] = min(d);
    pred_num = trainlab(i);
    pred(pred_num + 1,k) = 1;
end
toc

save('task1_results.mat', pred);
