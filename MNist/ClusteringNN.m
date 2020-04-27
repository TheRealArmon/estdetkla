clear all
close all


%Perform clustering (Only run if Clustered_train is non-existing)

% M = 64;
% clusterData(M);   %Performs clustering and saves clusters in Clustered_train

%Loading data
load('data_all.mat');
load('task1_results.mat');
load('clustered_train.mat');

%NN classification (takes about 20 sek)
pred_cluster = zeros(10, num_test);
tic
for k = 1:10000
    d = dist(clusters, testv(k,:).');
    [~, i] = min(d);
    pred_num = clusterlab(i);
    pred_cluster(pred_num + 1,k) = 1;
end
toc

figure(1)
plotConfNumb(testlab, pred_cluster);
title("NN with clustering");

