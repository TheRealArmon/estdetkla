clear all

load('data_all.mat');
load('task1_results.mat');
load('Clustered_train.mat');

pred_cluster = zeros(10, num_test);

tic
for k = 1:10000
    d = dist(clusters, testv(k,:).');
    [~, i] = min(d);
    pred_num = clusterlab(i);
    pred_cluster(pred_num + 1,k) = 1;
end
toc


