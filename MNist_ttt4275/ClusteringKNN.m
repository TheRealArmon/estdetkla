clear all
close all

%Perform clustering (Only run if Clustered_train is non existing)

% M = 64;
% clusterData(M);   %Performs the clustering and save data in Clustered_train

%Loading data
load('data_all.mat');
load('task1_results.mat');
load('clustered_train.mat');

%KNN search (takes around 40-50 sek)
K = 7;
pred_KNN = zeros(10, num_test);
tic
for k = 1:10000
    idx = knnsearch(clusters, testv(k,:), 'K', K); 
    
    counter= zeros(10,1);
    for i = 1:size(idx,2)
        counter(clusterlab(idx(i))+ 1) = counter(clusterlab(idx(i))+1) + 1;
    end
    
    [~, j] = max(counter);
    pred_KNN(j,k) = 1;
end
toc

figure(1)
plotConfNumb(testlab, pred_KNN);
title("KNN with clustering");



