clear all

load('data_all.mat');
load('task1_results.mat');
load('Clustered_train.mat');

%KNN search
pred_KNN = zeros(10, num_test);
eqCount = 0;
tic
for k = 1:10000
    idx = knnsearch(clusters, testv(k,:), 'K', 7);
    
    counter= zeros(10,1);
    for i = 1:size(idx,2)
        counter(clusterlab(idx(i))+ 1) = counter(clusterlab(idx(i))+1) + 1;
    end
    
    [~, j] = max(counter);
    pred_KNN(j,k) = 1;
end
toc

