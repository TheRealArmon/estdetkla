
K = 7;
M = 64;

clusters = zeros(M*10,size(trainv,2));

for i = 0:9
    train_i = trainv(trainlab == i, :);
    [~,C] = kmeans(train_i, M);
    clusters(M*i+1:M*(i+1),:) = C;
end

clusterlab = zeros(M*10,1);
for i = 0:9
    clusterlab(M*i+1:M*(i+1)) = i*ones(M,1);
end

pred_cluster = zeros(10, num_test);

tic
for k = 1:10000
    d = dist(clusters, testv(k,:).');
    [~, i] = min(d);
    pred_num = clusterlab(i);
    pred_cluster(pred_num + 1,k) = 1;
end
toc


